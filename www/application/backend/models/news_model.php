<?php
class News_model extends CI_Model {

	function load_news() {
		return $this->db->get('news')->result_array();
	}

	function add_new($info) {
		$this->db->insert('news',$info);
	}

	function update_new($Id) {
		return $this->db->where(array('Id'=>$Id))->update('news',$_POST);
	}

	function delete_new($Id) {
		$this->db->delete('news',array('Id'=>$Id));
	}

}

?>

