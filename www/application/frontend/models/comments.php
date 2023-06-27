<?
class Comments_front extends CI_Model {
	function cut_str($str, $len, $end = "...")
    {
        if (mb_strlen($str, "utf-8") <= $len)
            return $str;
        else
        {
            $str = mb_substr($str, 0, $len, "utf-8");
            $str = mb_substr($str, 0, mb_strrpos($str, " ", 0, "utf-8"), "utf-8");
             
            return $str.$end;   
        }
    }
	function loadlastcomment(){
		$k = 0;
		$this->db->order_by('date', 'desc');
		$array = $this->db->get('comments',1)->result_array();
		foreach ($array as $value){
			$array[$k]['text'] = $this->Comments_front->cut_str($value['text'], 150);
			$k++;
		}
		return $array;
	}
	function loadallcomments()
	{
		$this->db->order_by('date', 'desc');
		return $this->db->get('comments')->result_array();
	}
}
?>
