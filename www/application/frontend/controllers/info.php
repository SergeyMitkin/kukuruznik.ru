<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Info extends CI_Controller {
	public function __construct(){
		parent::__construct();
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

	public function index()
	{
		$this->templates->display('info.tpl'); //указываем имя шаблона
	}
	
	public function loadinfo(){
		$this->load->model('Getinfo');
		$codename = $this->uri->segment(1);
		$info = $this->Getinfo->loadinfo($codename);

		$this->templates->assign('info', $info);
		$this->templates->display('info.tpl');
	}

	public function subinfo(){
		$this->load->model('Getinfo');
		$codename = $this->uri->segment(1);
		$info = $this->Getinfo->loadinfo($codename);
		
		$this->templates->assign('info', $info);
		$this->templates->display('subinfo.tpl');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
