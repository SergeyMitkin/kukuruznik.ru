<?php
class Groups_model extends CI_Model {

	function load_groups() {
		$groups = $this->db->get('groups')->result_array();
        foreach($groups as $id=>$group)
            $groups[$id]['rights'] = json_decode($group['rights']);
        return $groups;
	}

	function load_group($id) {
		$group = $this->db->get_where('groups',array('Id'=>$id))->result_array();
        $group[0]['rights'] = (array) json_decode($group[0]['rights']);
        foreach($group[0]['rights'] as $id=>$right){
            $group[0]['rights'][$id] = (array)$right;
        }
		return $group[0];
	}

	function add_group($group_array) {
        $group_array['rights'] = json_encode($group_array['rights']);
		$this->db->insert('groups',$group_array);
	}

	function update_group($group_array,$group_id) {
        $group_array['rights'] = json_encode($group_array['rights']);
		$this->db->where(array('Id'=>$group_id))->update('groups',$group_array);
	}

	function delete_group($group_id) {
		$this->db->delete('groups',array('Id'=>$group_id));
	}

}
?>
