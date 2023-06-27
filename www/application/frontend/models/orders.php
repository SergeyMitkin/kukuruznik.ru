<?php
class Orders extends CI_Model {

	function __construct(){
		 // Call the Model constructor
		 parent::__construct();
	}
     
	function add_order(){
		$order_info = array(
			'type' => $this->input->post('type'),
			'telephone' => $this->input->post('telephone'),
			'email' => $this->input->post('email'),
			'date' => $this->input->post('date')
		);
		$this->db->insert('orders', $order_info); 
		$last_order = $this->db->order_by('Id','desc')->limit(1)->get('orders')->result_array();
		$i = 0;
		foreach($_POST['name'] as $name){
			unset($human_info);
			$human_info = array(
				'order_id' => $last_order[0]['Id'],
				'name' => $name,
				'age' => $_POST['age'][$i],
				'weight' => $_POST['weight'][$i],
				'height' => $_POST['height'][$i],
				'sertnum' => $_POST['sertnum'][$i]
			);		
			$this->db->insert('people', $human_info);
			$i++;
		}
		$this->add_address($order_info['email'],$order_info['date'],$order_info['type']);
	}
	
	function add_address($address, $date, $type){
		$date_id = $this->db->get_where('dates',array('date'=>$date,'jumptype'=>$type))->result_array();
		$date_id = $date_id[0]['Id'];
		$addresses = $this->db->select('addresses')->get_where('letters',array('date_id'=>$date_id))->result_array();
		if(empty($addresses[0]['addresses'])){
			$addresses = $address;
		}else{
			$addresses = $addresses[0]['addresses'].', '.$address;
		}
		$this->db->where(array('date_id'=>$date_id))->update('letters',array('addresses'=>$addresses));
	}

	function daysnumb(){
		$this->db->from('dates');
		return $this->db->count_all_results(); 
	}
	 
	function givetandemdays(){
	 	return $this->db->order_by('date')->get_where('dates', array('jumptype' => 'tandem', 'date >='=>date("Y-m-d")))->result_array();
	}
	 
	function givesingledays(){
		$dates = $this->db->order_by('date')->get_where('dates', array('jumptype' => 'single', 'date >='=>date("Y-m-d")))->result_array();
		return $dates;
	}
}
?>
