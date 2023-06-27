<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pages extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('Comments_model');
		$this->load->model('pages_model');
	}

	public function index() {
		$this->templates->assign('pages',$this->pages_model->load_pages());
		$this->templates->display('pages/pages.tpl');
	}

	public function add_page() {
		if(empty($_POST)){
			$this->templates->display('pages/add_page.tpl');
		}else{
			$this->pages_model->add_page($_POST);
			header('Location: /admin/pages');
		}
	}

	public function edit_page($id) {
		$this->pages_model->update_page($id);
		header('Location: /admin/pages');
	}

	public function delete_page($id) {
		$this->pages_model->date_page($id);
		header('Location: /admin/pages');
	}
}
?>
