<?php
class Articles_model extends CI_Model {

	function load_articles() {
		return $this->db->get('articles')->result_array();
	}
	
	function add_article($info) {
		$this->db->insert('articles',$info);
	}

	function update_article($Id) {
		return $this->db->where(array('Id'=>$Id))->update('articles',$_POST);
	}

	function delete_article($Id) {
		$this->db->delete('articles',array('Id'=>$Id));
	}

}
?>

