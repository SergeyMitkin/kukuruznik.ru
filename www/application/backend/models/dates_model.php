<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

Class Dates_model extends CI_Model {

	function dates_index() {
        $group = $this->session->userdata('group');

        if($this->find_right('read','date_single',$group))
            $single = $this->db->order_by('date','desc')->get_where('dates',array('jumptype'=>'single'),20)->result_array();

        if(!isset($single))
            $single = array();

			foreach($single as $id=>$date) {
				$single[$id]['single'] = TRUE;
				$single[$id]['tandem'] = FALSE;
			}

        if($this->find_right('read','date_tandem',$group))
            $tandem = $this->db->order_by('date','desc')->get_where('dates',array('jumptype'=>'tandem'),20)->result_array();

        if(!isset($tandem))
            $tandem = array();

		foreach($tandem as $id=>$date) {
			$tandem[$id]['single'] = FALSE;
			$tandem[$id]['tandem'] = TRUE;
		}

		$dates2 = array_merge($single,$tandem);
		$dates = array_merge($single,$tandem);
		foreach($dates2 as $id1=>$date1) {
			unset($dates[$id1]['jumptype']);
			foreach($dates2 as $id2=>$date2) {
				if(($date2['date'] == $date1['date']) && ($id1 < $id2)) {
					unset($dates[$id2]);

					if($date2['single'] === TRUE) {
						$dates[$id1]['single'] = TRUE;
					}

					if($date2['tandem'] === TRUE) {
						$dates[$id1]['tandem'] = TRUE;
					}

				}
			}
		}

		function date_sort($row1,$row2) {
			if ($row1['date'] == $row2['date']) {
				return 0;
			}

		        return ($row1['date'] < $row2['date']) ? 1 : -1;
		}

		usort($dates,'date_sort');
		return $dates;
	}

	function loadinthismonth($type){
		return $this->db->order_by('date')->get_where('dates',array('jumptype'=>$type,'MONTH(`date`)'=>date("m"), 'YEAR(`date`)'=>date("Y")))->result_array();
	}

	function loadinmonth($type,$year,$month){
		return $this->db->order_by('date')->get_where('dates',array('jumptype'=>$type,'MONTH(`date`)'=>$month, 'YEAR(`date`)'=>$year))->result_array();
	}

	function add_date($date){
		$date2 = $this->db->get_where('dates',array('date'=>$date['date'],'jumptype'=>$date['jumptype']))->result_array();
		//если дату не создают заново
		if(empty($date2)){
			$letter = array('title'=>$date['title'],'date'=>$date['date'],'jumptype'=>$date['jumptype'],'template'=>$date['template']);
			unset($date['title']);
			unset($date['template']);
			$this->db->insert('dates',$date);
			$this->load->model('mails_model');
			$date_id = $this->db->order_by('Id','desc')->get_where('dates',array('date'=>$date['date']))->result_array();
			$date_id = $date_id[0]['Id'];
			$letter['date_id'] = $date_id;
			$this->mails_model->add_default_letter($letter);
		}
	}

	function remove_date($date,$type){
		$this->db->delete('dates',array('date'=>$date, 'jumptype'=>$type));
	}

	function loaddatesfororders($type){
		$nextdate = $this->db->limit(1)->order_by('date')->get_where('dates',array('jumptype'=>$type,'date >='=>date("Y-m-d")))->result_array();
		$dates = array();
		if(!empty($nextdate)){
			$nextdate = $nextdate[0]['date'];
			$dates = $this->db->order_by('date','desc')->limit(3)->get_where('dates',array('jumptype'=>$type,'date <'=>$nextdate))->result_array();
			$dates3 = $dates;
			foreach($dates3 as $id=>$date)$dates[count($dates)-$id-1]['date']=$date['date'];

			$dates2 = $this->db->order_by('date')->get_where('dates',array('jumptype'=>$type,'date >'=>date('m'),'MONTH(`date`)-3 <='=>date('m')))->result_array();
			$dates = array_merge($dates,$dates2);
		}
		return $dates;
	}

	private function find_right($right,$controller,$group){
	  if($controller == 'welcome' || $controller == 'login' || empty($controller))
			return true;
	  $group = array_shift($this->db->get_where('groups',array('name'=>$group))->result_array());
	  $group['rights'] = (array) json_decode($group['rights']);
	  foreach($group['rights'] as $id=>$row){
			$group['rights'][$id] = (array)$row;
	  }
	  $rights = $group['rights'];
	  if(isset($rights[$controller][$right]))
			return true;
	  return false;
	}
}

?>
