<?php
class Storymodel extends CI_Model{
	function all_items(){
		$this->db->from('comments')->order_by('Id','desc');
		return $this->db->count_all_results();
	}

	function strposex($string){
		if(strpos($string,'.') == true){ $point = strpos($string,'.');} else {$point = strlen($string);}
		if(strpos($string,'!') == true){ $voskl = strpos($string,'!');} else {$voskl = strlen($string);}
		if(strpos($string,'?') == true){ $vopr = strpos($string,'?');} else {$vopr = strlen($string);}
		if (($point < $voskl) && ($point < $vopr)){
			$ext = $point;
		}

		if (($vopr < $voskl) && ($vopr < $point)){
			$ext = $vopr;
		}

		if (($voskl < $vopr) && ($voskl < $point)){
			$ext = $voskl;
		}

		if(!isset($ext))
			$ext = 50;
		return $ext+1;
	}

	function stories($page,$per_page){
		$this->db->order_by('Id','date');
		$this->db->limit($per_page, $page);
		$stories_array = $this->db->get('comments')->result_array();
		foreach($stories_array as $id=>$story){
			$stories_array[$id]['text'] = substr($story['text'],0,$this->strposex($story['text']));
		}
		return $stories_array;
	}

	function story($id){
		return $this->db->get_where('comments',array('Id'=>$id))->result_array();
	}
}
?>
