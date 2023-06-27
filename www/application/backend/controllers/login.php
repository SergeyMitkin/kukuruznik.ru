<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('login_model');
	}

	public function index() {

	}

	public function auth() {
		$check_auth = $this->session->userdata('logged_in');
		if($check_auth){
			header('Location: /admin/welcome/');
		}

		if(empty($_POST)){
			$this->templates->display('login/login.tpl');
		}else{
			if($this->login_model->user_check($_POST)){
				$authdata = array_shift($this->login_model->load_info($_POST['login']));
				$authdata['logged_in'] = true;
				// Добавляем данные в сессию
				$this->session->set_userdata($authdata);

				// Редиректим на нужную нам страницу
				header('Location: /admin/welcome/');
			}else{
				header('Location: /admin/login/auth');
			}
		}
	}

	function logout(){
		$this->session->sess_destroy();
		header('Location: /admin/index.php/login/auth/');
	}
}

?>
