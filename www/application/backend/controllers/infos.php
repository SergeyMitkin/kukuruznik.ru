<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Infos extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('Infos_model');
	}
	public function index()
	{
		$this->templates->assign('infos', $this->Infos_model->loadallinfo());
		$this->templates->display('info/info.tpl');
	}

	public function add_info(){
		$this->Infos_model->add_info($_POST);
		header('Location:/admin/infos/');
	}

	public function delete_info(){
		$this->Infos_model->delete_info($this->uri->segment(3));
		header('Location:/admin/infos/');
	}

	public function edit_info(){
		$this->Infos_model->update_info($this->uri->segment(3));
		header('Location:/admin/infos/');
	}
}
?>
