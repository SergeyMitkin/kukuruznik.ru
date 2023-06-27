<?php
class Orders_model extends CI_Model {

	function __construct(){
			parent::__construct();
	}
	 
	function orders_array(){
		 $this->db->order_by('date');
		 $query = $this->db->get('orders')->result_array();
		 foreach($query as $key=>$quer){
			$man = $this->db->limit(1)->order_by('Id')->get_where('people',array('order_id'=>$quer['Id']))->result_array();
//		 	$query[$key]['name'] = $man[0]['name'];
		 }
		 return $query;
	}
	 
	 function orders_array_ondate($date,$type){
	 	$this->db->where('date', $date);
	 	$this->db->where('type', $type);
		$query = $this->db->order_by('Id')->get('orders')->result_array();

		foreach($query as $key=>$quer){
			$man = $this->db->limit(1)->order_by('Id')->get_where('people',array('order_id'=>$quer['Id']))->result_array();
			$query[$key]['name'] = $man[0]['name'];
		}

		return($query);
	 }
	 
	 function orders_people($order_id){
		$this->db->where('order_id',$order_id);
	 	$people_in_order = $this->db->order_by('Id')->get('people')->result_array();
		return $people_in_order;
	 }
	 
	 function select_order($order_id)
	 {
	 	$this->db->where('Id',$order_id);
		return $this->db->get('orders')->result_array();
	 }
	 
	 function select_people($order_id){
	 	$this->db->where('order_id', $order_id);
		return $this->db->get('people')->result_array();
	 }
	 
	function update_people($order_id,$array){
		$this->db->delete('people', array('order_id' => $order_id));
		$i = 0;
		foreach($array['name'] as $name){				
			unset($human_info);
			$human_info = array(
				'order_id' => $order_id,
				'name' => $name,
				'age' => $array['age'][$i],
				'weight' => $array['weight'][$i],
				'sertnum' => $array['sertnum'][$i],
				'height' => $array['height'][$i]
			);		
			$this->db->insert('people', $human_info);
			$i++;
		}     
	}
	
	function changedate($olddate, $newdate, $type){
		$this->db->where('date',$olddate);
		$this->db->where('type',$type);
		$updateinfo = array(
			'date' => $newdate
		);
		$this->db->update('orders',$updateinfo);
	}
	 
	 function update_order($order)
	 {
		$this->db->where('Id',$order['Id']);
		$this->db->update('orders',$order); 
	 }
	 
	 function delete_order($order_id)
	 {
	 	$this->db->delete('people', array('order_id' => $order_id)); 
		$this->db->delete('orders', array('Id' => $order_id));
	 }

	 function set_confirm($order_id,$type){
	 	$this->db->where('Id',$order_id)->update('orders',array('confirmation'=>$type));
	 }
 }
?>
