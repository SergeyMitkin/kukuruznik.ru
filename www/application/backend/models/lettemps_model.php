<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

Class Lettemps_model extends CI_Model {
	function load_templates(){
		return $this->db->get('lettemps')->result_array();
	}

	function load_template($id){
		return array_shift($this->db->get_where('lettemps',array('id'=>$id))->result_array());
	}

	function add_template($template) {
		$this->db->insert('lettemps',$template);
	}

	function update_template($id) {
		$this->db->where('id',$id)->update('lettemps',$_POST);
	}

	function remove_template($id) {
		$this->db->delete('lettemps',array('id'=>$id));
	}
}
