<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model {
	function user_check($query){
		$array = $this->db->select(array('login','password'))->get_where('users',array('login'=>$query['login'], 'password'=>md5($query['password'])))->result_array();
		if(empty($array)){
			return FALSE;
		}else{
			return TRUE;
		}
	}

    function load_info($login){
        $array = $this->db->get_where('users',array('login'=>$login))->result_array();
        unset($array['password']);
        return $array;
    }
}

?>
