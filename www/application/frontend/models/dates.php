<?php
class Dates extends CI_Model {
	function dates(){
		$this->db->select('date');
		$single_array = $this->db->order_by('date')->get_where('dates',array('jumptype' => 'single', 'date >=' => date('Y-m-d')))->result_array();
		if(empty($single_array[0]))
			$single_date1 = '';
		else
			$single_date1 = $single_array[0]['date'];

		if(empty($single_array[1]))
			$single_date2 = '';
		else
			$single_date2 = $single_array[1]['date'];

		$tandem_array = $this->db->select('date')->limit(2)->order_by('date')->get_where('dates',array('jumptype' => 'tandem', 'date >=' => date('Y-m-d')))->result_array();

		if(empty($tandem_array)){
			$tandem_date1 = 'Неизвестно';
			$tandem_date2 = 'Неизвестно';
		}elseif(count($tandem_array) == 1){
			$tandem_date1 = $tandem_array[0]['date'];
			$tandem_date2 = 'Неизвестно';
		}else{
			$tandem_date1 = $tandem_array[0]['date'];
			if(empty($tandem_array[1])){
				$tandem_date2 = 'Неизвестно';
			}else{
				$tandem_date2 = $tandem_array[1]['date'];
			}
		}
		$dates_array = array(
		array(
		'single'=>array($single_date1, $single_date2),
		'tandem'=>array($tandem_date1,$tandem_date2)));	
		return $dates_array;
	}

	function loadalldates($type){
		return $this->db->order_by('date')->get_where('dates',array('date >='=>date('Y-m-d'),'jumptype'=>$type))->result_array();
	}
}
?>
