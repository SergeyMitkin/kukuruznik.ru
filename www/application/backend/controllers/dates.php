<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dates extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('Dates_model');
	}

	public function index(){
		$this->templates->assign('singledates', $this->Dates_model->loadinthismonth('single'));
		$this->templates->assign('tandemdates', $this->Dates_model->loadinthismonth('tandem'));
		$this->templates->display('dates/dates.tpl');
	}

	public function showdatesinmonth(){
		$this->templates->assign('singledates',$this->Dates_model->loadinmonth('single',$_POST['year'],$_POST['month']));
		$this->templates->assign('tandemdates',$this->Dates_model->loadinmonth('tandem',$_POST['year'],$_POST['month']));
		$this->templates->display('dates/datesinmonth.tpl');
	}

	public function add_date(){
		if(empty($_POST)){
			$this->templates->display('dates/add_date.tpl');
		}else{
			$this->Dates_model->add_date($_POST);
			header('Location: /admin/orders');
		}
	}

	public function delete_date(){
		$this->Dates_model->remove_date($this->uri->segment(3),$this->uri->segment(4));
		header('Location: /admin/orders');
	}
}
?>
