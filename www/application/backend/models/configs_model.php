<?php
class Configs_model extends CI_Model{
	function load_configs(){
		return $this->db->get('configs')->result_array();
	}
	
	function load_config($id){
		$array = $this->db->get_where('configs',array('Id'=>$id))->result_array();
		$array = $array[0];
		return $array;
	}

	function add($array){
		$this->db->insert('configs',$array);
	}

	function delete($id){
		$this->db->delete('configs',array('Id'=>$id));
	}

	function update($array,$id){
		$this->db->where(array('Id'=>$id))->update('configs',$array);
	}
}
?>
