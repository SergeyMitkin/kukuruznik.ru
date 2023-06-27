<?php
class Orders extends CI_Controller{

	public function __construct(){
		parent::__construct();
		$this->load->helper(array('form', 'url'));
		$this->load->model('Orders_model');
	}

	public function index(){
		$this->load->model('dates_model');
		$this->load->model('lettemps_model');

		$orders_array = $this->Orders_model->orders_array();
		$this->templates->assign('templates',$this->lettemps_model->load_templates());
		$this->templates->assign('dates',$this->dates_model->dates_index());
		#$this->templates->assign('singledates', $this->Dates_model->loaddatesfororders('single')); //объявляем переменную
		#$this->templates->assign('tandemdates', $this->Dates_model->loaddatesfororders('tandem')); //объявляем переменную
		$this->templates->display('orders/dates.tpl'); //указываем имя шаблона
	}

	public function ondate(){
		$group = $this->session->userdata('group');
		$date = $this->uri->segment(3);
		$type = $this->uri->segment(4);
		$orders_array = $this->Orders_model->orders_array_ondate($date,$type);
		$k = 0;

		foreach($orders_array as $k=>$value){
			$orders_array[$k]['count_people'] = sizeof($this->Orders_model->orders_people($value['Id']));
			$orders_array[$k]['people'] = $this->Orders_model->orders_people($value['Id']);
			$sert_size = 0;
			foreach($orders_array[$k]['people'] as $man) {
				if($man['sertnum'] != 0)
					$sert_size++;
			}
			$orders_array[$k]['sert_size'] = $sert_size;
		}

		$date = array('date'=>$date,'type'=>$type);
		$this->templates->assign('orders', $orders_array);
		$this->templates->assign('date', $date);
		$this->templates->assign('read', $this->find_right('read','date_'.$type,$group));
		$this->templates->assign('write', $this->find_right('write','date_'.$type,$group));
		$this->templates->assign('delete', $this->find_right('delete','date_'.$type,$group));
		$this->templates->display('orders/orders.tpl');
	}

	public function edit_order(){
		$order = $_POST;
		$date = $this->uri->segment(4);
		$type = $this->uri->segment(5);
		$order['Id'] = $this->uri->segment(3);
		$this->Orders_model->update_order($order);
		header("Location: /admin/orders/ondate/$date/$type");
	}

	public function people(){
		$date = $this->uri->segment(4);
		$jumptype = $this->uri->segment(5);

		$this->Orders_model->update_people($this->uri->segment(3),$_POST);
		header("Location: /admin/orders/ondate/$date/$jumptype");
	}

	public function changedate(){
		$date = $_POST['date'];
		$this->Orders_model->changedate($this->uri->segment(3),$date,$this->uri->segment(4));
		header('Location:/admin/orders/ondate/'.$date.'/'.$this->uri->segment(4));
	}

	public function delete_order(){
		$this->Orders_model->delete_order($this->uri->segment(3));
		$this->templates->assign('redirect',$_SERVER['HTTP_REFERER']);
		$this->templates->display('formsuccess.tpl');
	}

	public function set_confirm(){
		$this->Orders_model->set_confirm($this->uri->segment(3),$this->uri->segment(4));
		if (!empty($_SERVER['HTTP_REFERER']))
		    header('Location: '.$_SERVER['HTTP_REFERER']);
	}

	private function find_right($right,$controller,$group){
	  if($controller == 'welcome' || $controller == 'login' || empty($controller))
			return true;
	  $group = array_shift($this->db->get_where('groups',array('name'=>$group))->result_array());
	  $group['rights'] = (array) json_decode($group['rights']);
	  foreach($group['rights'] as $id=>$row){
			$group['rights'][$id] = (array)$row;
	  }
	  $rights = $group['rights'];
	  if(isset($rights[$controller][$right]))
			return true;
	  return false;
	}

}

?>
