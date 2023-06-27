<?php
class Meta extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('meta_model');
	}

	public function index() {
		$this->templates->assign('pages',$this->meta_model->load_pages());
		$this->templates->display('meta/pages.tpl');
	}

	public function add() {
		$this->meta_model->add_meta($_POST);
		header('Location: /admin/meta');
	}

	public function edit($Id) {
		$this->meta_model->update_meta($_POST,$Id);
		header('Location: /admin/meta');
	}

	public function delete($Id) {
		$this->meta_model->delete_meta($Id);
		header('Location: /admin/meta');
	}
}
?>
