<?php
class Getinfo extends CI_Model {
	
     function loadinfo($codename)
     {
        return $this->db->get_where('info',array('codename' => $codename))->result_array();		
     }
 }
?>
