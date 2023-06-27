<?php
class Meta_model extends CI_Model {

	function load_page($uri) {
		$settings = $this->db->get_where('meta',array('uri'=>$uri))->result_array();
		return $settings[0];
	}
}

?>
