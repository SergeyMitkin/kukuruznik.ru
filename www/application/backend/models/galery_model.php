<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

Class Galery_model extends CI_Model {

	//PHOTOS

	function loadalbums(){
		return $this->db->get('albums')->result_array();
	}

	function loadalbum($album_codename){
		return $this->db->get_where('albums',array('codename'=>$album_codename))->result_array();
	}

	function add_album($album){
		mkdir($_SERVER['DOCUMENT_ROOT'].'/galery/photos/'.$album['codename']);
		copy($_SERVER['DOCUMENT_ROOT'].'/galery/photos/nocover.jpg',$_SERVER['DOCUMENT_ROOT'].'/galery/photos/'.$album['codename'].'/nocover.jpg');
		$album['cover'] = 'nocover.jpg';
		$this->db->insert('albums',$album);
	}

	function remove_album($album_codename){
		$photos = $this->db->get_where('photos',array('album'=>$album_codename))->result_array();
		foreach($photos as $photo){
			$this->remove_photo($photo['Id']);
		}
		unlink($_SERVER['DOCUMENT_ROOT'].'/galery/photos/'.$album_codename.'/nocover.jpg');
		rmdir($_SERVER['DOCUMENT_ROOT'].'/galery/photos/'.$album_codename);
		$this->db->delete('albums',array('codename'=>$album_codename));	
	}

	function update_album($album,$album_id){
		$this->db->where(array('Id'=>$album_id))->update('albums',$album);
	}

	function album_cover($photo_id,$album_codename){
		$photo = $this->db->get_where('photos',array('Id'=>$photo_id))->result_array();
		$photo = $photo[0];
		$this->db->where(array('codename'=>$album_codename))->update('albums',array('cover'=>$photo['path']));
	}

	function loadphotos($album_codename){
		return $this->db->get_where('photos',array('album'=>$album_codename))->result_array();
	}

	function remove_photo($photo_id){
		$photo = $this->db->get_where('photos',array('Id'=>$photo_id))->result_array();
		$photo = $photo[0];
		unlink($_SERVER['DOCUMENT_ROOT'].'/galery/photos/'.$photo['album'].'/'.$photo['path']);
		$this->db->delete('photos',array('Id'=>$photo_id));
	}

	//VIDEOS

	function loadvideos(){
		return $this->db->get('videos')->result_array();
	}

	function loadvideo($video_id){
		return $this->db->get_where('videos',array('Id'=>$video_id))->result_array();
	}

	function add_video($video){
		$this->db->insert('videos',$video);
	}

	function update_video($video,$video_id){
		$this->db->where(array('Id'=>$video_id))->update('videos',$video);
	}
	
	function remove_video($video_id){
		$this->db->delete('videos',array('Id'=>$video_id));
	}
}

?>
