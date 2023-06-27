<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class News extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$check_auth = $this->session->userdata('logged_in');

		if($check_auth == FALSE){
			header('Location: /admin/login/auth/');
		}

		$this->load->model('news_model');
	}

	public function index() {
		$this->templates->assign('news',$this->news_model->load_news());
		$this->templates->display('news/news.tpl');
	}

	public function add_new() {
		if(empty($_POST)){
			$this->templates->display('news/add_new.tpl');
		}else{
			$this->news_model->add_new($_POST);
			header('Location: /admin/news');
		}
	}

	public function edit_new($id) {
		$this->news_model->update_new($id);
		header('Location: /admin/news');
	}

	public function delete_new($id) {
		$this->news_model->delete_new($id);
		header('Location: /admin/news');
	}

}
