<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Configs extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('configs_model');
	}

	public function index(){
		$this->templates->assign('configs',$this->configs_model->load_configs());
		$this->templates->display('configs/configs.tpl');
	}

	public function add(){
		if(empty($_POST)){
			$this->templates->display('configs/add.tpl');
		}else{
			$this->configs_model->add($_POST);
			header('Location:/admin/index.php/configs');
		}
	}

	public function edit(){
		$this->configs_model->update($_POST,$this->uri->segment(3));
		header('Location:/admin/configs');
	}

	public function delete(){
		$this->configs_model->delete($this->uri->segment(3));
		header('Location:/admin/configs');
	}

}

?>
