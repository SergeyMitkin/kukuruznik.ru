<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Date extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('Dates');
		$this->templates->assign('dates',$this->dates->dates());
		$this->load->model('meta_model');
		$uri2 = $this->uri->segment(2);
		if(empty($uri2)){
			$path = $this->uri->segment(1);
		}else{
			$path = $this->uri->segment(1).'/'.$this->uri->segment(2);
		}
		$settings = $this->meta_model->load_page($path);
		$this->templates->assign('title',$settings['title']);
		$this->templates->assign('keywords',$settings['keywords']);
		$this->templates->assign('description',$settings['description']);
	}

	public function index(){
		$this->templates->assign('singledates',$this->Dates->loadalldates('single'));
		$this->templates->assign('tandemdates',$this->Dates->loadalldates('tandem'));
		$this->templates->display('dates.tpl');
	}
}
?>
