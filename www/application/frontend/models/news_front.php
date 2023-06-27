<?
class News_front extends CI_Model {
		
	function loadlast3news(){
		$this->db->order_by('date', 'desc');
		$array = $this->db->get('news',3)->result_array();
		$k = 0;
		foreach($array as $value){
			$array[$k]['date'] = date('d F',strtotime($value['date']));
			$k++;
		}
		
		return $array;
	}
	
	function allnews(){
		$this->db->order_by('date', 'desc');
		$array = $this->db->get('news')->result_array();
		$k = 0;
		foreach($array as $value){
			$array[$k]['date'] = date('d F',strtotime($value['date']));
			$k++;
		}
		
		return $array;
	}
}
?>
