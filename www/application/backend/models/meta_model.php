<?php
class Meta_model extends CI_Model {

	function load_pages() {
		return $this->db->get('meta')->result_array();
	}

	function load_page($id) {
		$page = $this->db->get_where('meta',array('Id'=>$id))->result_array();
		return $page[0];
	}

	function add_meta($meta_array) {
		$this->db->insert('meta',$meta_array);
	}
	
	function update_meta($meta_array,$meta_id) {
		$this->db->where(array('Id'=>$meta_id))->update('meta',$meta_array);
	}

	function delete_meta($meta_id) {
		$this->db->delete('meta',array('Id'=>$meta_id));
	}
}
?>
