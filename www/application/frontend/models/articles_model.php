<?
class Articles_model extends CI_Model {

	function load_articles($page,$per_page){
		$this->db->order_by('Id');
		$this->db->limit($per_page, $page);
		$stories_array = $this->db->order_by('Id')->limit($per_page,$page)->get('comments')->result_array();
		$articles = $this->db->get('articles')->result_array();
		foreach($articles as $id=>$article){
			$articles[$id]['shorttext'] = substr($article['text'],0,$this->strposex($article['text']));
		}
		return $articles;
	}

	function load_article($id) {
		return array_shift($this->db->get_where('articles',array('Id'=>$id))->result_array());
	}

	function articles_num() {
		$articles = $this->db->select('Id')->get('articles')->result_array();
		return sizeof($articles);
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
