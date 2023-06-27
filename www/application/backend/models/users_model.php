<?php
class Users_model extends CI_Model {

	function load_users() {
		return $this->db->get('users')->result_array();
	}

	function load_user($id) {
		$user = $this->db->get_where('users',array('Id'=>$id))->result_array();
        unset($user[0]['password']);
		return $user[0];
	}

	function add($user_array) {
        $user_array['password'] = md5($user_array['password']);
		$this->db->insert('users',$user_array);
	}

	function update($user_array,$user_id) {
        $user_array['password'] = md5($user_array['password']);
		$this->db->where(array('Id'=>$user_id))->update('users',$user_array);
	}

	function delete($user_id) {
		$this->db->delete('users',array('Id'=>$user_id));
	}
}
?>
