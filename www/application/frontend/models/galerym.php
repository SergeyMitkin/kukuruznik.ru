<?php
class Galerym extends CI_Model{
	function loadphotos($album){
		$photos_array = $this->db->get_where('photos',array('album'=>$album))->result_array();
		return $photos_array;
	}

	function loadvideos(){
		return $this->db->get('videos')->result_array();
	}

	function loadvideo($video_id){
		return $this->db->get_where('videos',array('Id'=>$video_id))->result_array();
	}

	function loadalbum($album){
		$albums_array = $this->db->get_where('albums',array('codename' => $album))->result_array();
		return $albums_array;
	}

	function loadalbums(){
		$albums_array = $this->db->get('albums')->result_array();
		return $albums_array;
	}
}
?>
