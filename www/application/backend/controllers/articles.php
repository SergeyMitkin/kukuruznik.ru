<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Articles extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('articles_model');
	}

	public function index() {
		$this->templates->assign('articles',$this->articles_model->load_articles());
		$this->templates->display('articles/articles.tpl');
	}

	public function add_article() {
		if(empty($_POST)){
			$this->templates->display('articles/add_article.tpl');
		}else{
			$this->articles_model->add_article($_POST);
			header('Location: /admin/articles');
		}
	}

	public function edit_article($id) {
		$this->articles_model->update_article($id);
		header('Location: /admin/articles');
	}

	public function delete_article($id) {
		$this->articles_model->delete_article($id);
		header('Location: /admin/articles');
	}

}
