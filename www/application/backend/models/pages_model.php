<?php
class Pages_model extends CI_Model {

	function load_pages(){
		return $this->db->get('pages')->result_array();
	}

	function load_page($Id) {
		return $this->db->get_where('pages',array('Id'=>$Id))->result_array();
	}

	function add_page($info) {
		$this->db->insert('pages',$info);
	}

	function update_page($Id) {
		return $this->db->where(array('Id'=>$Id))->update('pages',$_POST);
	}

	function delete_page($Id) {
		$this->db->delete('pages',array('Id'=>$Id));
	}

}
?>
