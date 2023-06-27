<?php
class Users extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('users_model');
	}

	public function index() {
		$this->load->model('groups_model');
        $this->templates->assign('groups',$this->groups_model->load_groups());
		$this->templates->assign('users',$this->users_model->load_users());
		$this->templates->display('users/index.tpl');
	}

	public function add() {
		$this->users_model->add($_POST);
		header('Location: /admin/users');
	}

	public function edit($Id) {
		$this->users_model->update($_POST,$Id);
		header('Location: /admin/users');
	}

	public function delete($Id) {
		$this->users_model->delete($Id);
		header('Location: /admin/users');
	}
}
?>
