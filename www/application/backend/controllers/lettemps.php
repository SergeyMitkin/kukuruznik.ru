<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Lettemps extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('Lettemps_model');
	}

	public function index() {
		$this->load->model('files_model');
		$this->templates->assign('templates', $this->Lettemps_model->load_templates());
		$this->templates->assign('files',$this->files_model->load_files());
		$this->templates->display('lettemps/index.tpl');
	}

	public function add_template(){
		$this->Lettemps_model->add_template($_POST);
		header('Location:/admin/lettemps/');
	}


	public function delete_template(){
		$this->Lettemps_model->remove_template($this->uri->segment(3));
		header('Location:/admin/lettemps/');
	}

	public function edit_template(){
		$this->Lettemps_model->update_template($this->uri->segment(3));
		header('Location:/admin/lettemps/');
	}
}
?>
