<?php
class Modules_model extends CI_Model {

	function load_modules() {
		return $this->db->get('modules')->result_array();
	}
}
?>
