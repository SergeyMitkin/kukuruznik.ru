<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

Class Files_model extends CI_Model {
	function load_files() {
		return $this->db->get('files')->result_array();
	}

	function add_file($filename) {
		$this->db->insert('files',array('name'=>$filename));
	}

	function remove_file($id) {
		$file = array_shift($this->db->get_where('files',array('id'=>$id))->result_array());
		unlink($_SERVER['DOCUMENT_ROOT'].'/uploads/'.$file['name']);
		$this->db->delete('files',array('id'=>$id));
	}
}
