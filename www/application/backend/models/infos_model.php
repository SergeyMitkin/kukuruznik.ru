<?php
class Infos_model extends CI_Model {
	function loadinfo($codename)
	{
		return $this->db->get_where('info',array('codename' => $codename))->result_array();		

	}
	
	function loadallinfo()
	{
		return $this->db->get('info')->result_array();
	}
	
	function add_info($info){
		$this->db->insert('info',$info);
	}

	function delete_info($codename){
		$this->db->where(array('codename'=>$codename))->delete('info');
	}

	function update_info($codename)
	{
		$info = array(
			'text' => $_POST['text']
		);
		$this->db->where('codename',$codename);
		$this->db->update('info', $info);
	}
}
?>
