<?php

class Order extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->templates->assign('dates',$this->dates->dates());
		$this->load->model('meta_model');
		$uri2 = $this->uri->segment(2);
		if(empty($uri2)){
			$path = $this->uri->segment(1);
		}else{
			$path = $this->uri->segment(1).'/'.$this->uri->segment(2);
		}
		$settings = $this->meta_model->load_page($path);
		$this->templates->assign('title',$settings['title']);
		$this->templates->assign('keywords',$settings['keywords']);
		$this->templates->assign('description',$settings['description']);
	}

	function index(){
		$this->load->helper(array('form', 'url'));
		$this->load->library('form_validation');
		$this->load->model('Orders');
		if (empty($_POST))
		{	
			$this->templates->assign('info_single',$this->db->get_where('pages',array('title'=>'Одиночный'))->result_array());
			$this->templates->assign('info_tandem',$this->db->get_where('pages',array('title'=>'Тандем'))->result_array());
			$this->templates->assign('tandemdates',$this->Orders->givetandemdays());
			$this->templates->assign('singledates',$this->Orders->givesingledays());
			$this->templates->display('order.tpl');			
		}else{
			$this->Orders->add_order();
			$this->load->model('mail_model');
			$this->mail_model->afterreg($_POST['type']);
			$order_date = strtotime($_POST['date']);
			$cur_date = strtotime(date('Y-m-d'));
			$mailinterval = $this->db->get_where('configs',array('name'=>'mailinterval'))->result_array();
			$mailinterval = $mailinterval[0]['value'];

			if($mailinterval >= floor(($order_date - $cur_date)/(60*60*24))){
				$this->templates->assign('overinterval',0);
			}else{
				$this->templates->assign('overinterval',1);
			}
			
//			$this->templates->display('formsuccess.tpl');
		}
	}
}
?>
