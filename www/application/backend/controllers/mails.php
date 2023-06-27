<?php
class Mails extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->model('mails_model');
	}

	public function index(){
		if (isset($_GET['test'])){
			$this->sendtodayletters();
			var_dump($_GET);
		}
		$this->templates->assign('letters', $this->mails_model->load_letters(date("m")));
		$this->templates->display('mails/mails.tpl');
	}

	public function sendtodayletters(){
		$this->mails_model->sendtodayletters();
		echo "done";
	}

	public function othermonth(){
		$this->templates->assign('letters',$this->mails_model->load_letters($this->uri->segment(3)));
		$this->templates->display('mails/mails.tpl');
	}

	public function add_letter(){
		if(empty($_POST)){
			$this->templates->display('mails/add_letter.tpl');
		}else{
			$this->mails_model->add_letter($_POST);
			$this->templates->display('formsuccess.tpl');
		}
	}

	public function edit_letter(){
		$this->mails_model->update_letter($_POST,$this->uri->segment(3));
		header('Location:/admin/mails/');
	}

	public function remove_letter(){
		$this->mails_model->remove_letter($this->uri->segment(3));
		header('Location:/admin/mails/');
	}

}
?>
