<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Galery extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Galery_model');
	}

	public function index(){
		$this->templates->display('galery/galery.tpl');
	}

	public function albums(){
		$albums = $this->Galery_model->loadalbums();
		$this->templates->assign('albums',$albums);
		$this->templates->display('galery/albums.tpl');
	}

	public function album(){
		$albums = $this->Galery_model->loadalbum($this->uri->segment(3));
		$photos = $this->Galery_model->loadphotos($this->uri->segment(3));
		$this->templates->assign('albums',$albums);
		$this->templates->assign('photos',$photos);
		$this->templates->display('galery/album.tpl');
	}

	public function add_album(){
		$this->Galery_model->add_album($_POST);
		header('Location:/admin/galery/albums');
	}

	public function album_cover(){
		$this->Galery_model->album_cover($this->uri->segment(4),$this->uri->segment(3));
		if (!empty($_SERVER['HTTP_REFERER']))
		    header('Location: '.$_SERVER['HTTP_REFERER']);
	}

	public function add_photos(){
		$albums = $this->Galery_model->loadalbum($this->uri->segment(3));
		$this->templates->assign('albums',$albums);
		$this->templates->display('galery/add_photos.tpl');
	}

	public function edit_album(){
		$this->Galery_model->update_album($_POST,$this->uri->segment(3));
		header('Location:/admin/galery/albums');
	}

	public function remove_album(){
		$this->Galery_model->remove_album($this->uri->segment(3));
		header('Location:/admin/galery/albums');
	}

	public function remove_photo(){
		$this->Galery_model->remove_photo($this->uri->segment(3));
		if (!empty($_SERVER['HTTP_REFERER']))
		    header('Location: '.$_SERVER['HTTP_REFERER']);
	}

	public function videos(){
		$videos = $this->Galery_model->loadvideos();
		$this->templates->assign('videos',$videos);
		$this->templates->display('galery/videos.tpl');
	}

	public function video(){
		$videos = $this->Galery_model->loadvideo($this->uri->segment(3));
		$this->templates->assign('videos',$videos);
		$this->templates->display('galery/video.tpl');
	}

	public function add_video(){
		$this->Galery_model->add_video($_POST);
		header('Location: /admin/galery/videos');
	}

	public function edit_video(){
		$this->Galery_model->update_video($_POST,$this->uri->segment(3));
		header('Location: /admin/galery/videos');
	}

	public function remove_video(){
		$this->Galery_model->remove_video($this->uri->segment(3));
		header('Location: /admin/galery/videos');
	}
}

?>
