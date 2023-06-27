<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Galery extends CI_Controller {
	public function __construct(){
		parent::__construct();	
		$this->uri->segment(1);
		$this->templates->assign('dates',$this->dates->dates());
		$this->load->model('galerym');
		$this->load->model('meta_model');
		$path = $this->uri->segment(1);
		$settings = $this->meta_model->load_page($path);
		$this->templates->assign('title',$settings['title']);
		$this->templates->assign('keywords',$settings['keywords']);
		$this->templates->assign('description',$settings['description']);
	}

	public function index(){
		$this->templates->display('galery.tpl');
	}

	public function albums(){
		$this->templates->assign('albums',$this->galerym->loadalbums());
		$this->templates->display('galery/albums.tpl');
	}

	public function album(){
		$this->templates->assign('photos',$this->galerym->loadphotos($this->uri->segment(2)));
		$this->templates->assign('albums',$this->galerym->loadalbum($this->uri->segment(2)));
		$this->templates->display('galery/photos.tpl');
	}

	public function videos(){
		$this->templates->assign('videos',$this->galerym->loadvideos());
		$this->templates->display('galery/videos.tpl');
	}

	public function video(){
		$this->templates->assign('videos',$this->galerym->loadvideo($this->uri->segment(3)));
		$this->templates->display('galery/video.tpl');
	}
}
?>
