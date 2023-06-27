<?php
class News_model extends CI_Model {

	function load_news($page,$per_page){
		$this->db->order_by('Id');
		$this->db->limit($per_page, $page);
		$news = $this->db->get('news')->result_array();
		foreach($news as $id=>$new){
			$news[$id]['shorttext'] = substr($new['text'],0,$this->strposex($new['text']));
		}
		return $news;
	}

	function load_on_top() {
		$this->db->order_by('Id','desc');
		$this->db->limit(2);
		$news = $this->db->get('news')->result_array();
		foreach($news as $id=>$new){
			$news[$id]['shorttext'] = substr($new['text'],0,$this->strposex($new['text']));
		}
		return $news;
	}

	function load_new($id) {
		return array_shift($this->db->get_where('news',array('Id'=>$id))->result_array());
	}

	function news_num() {
		$news = $this->db->select('Id')->get('news')->result_array();
		return sizeof($news);
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
}
?>
