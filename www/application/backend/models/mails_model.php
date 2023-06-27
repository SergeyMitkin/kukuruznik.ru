<?php
class Mails_model extends CI_Model{

	function load_letters($month){
		$array = $this->db->query('SELECT * FROM `letters` WHERE `date` >= NOW() - INTERVAL 10 DAY AND `date` <= NOW() + INTERVAL 31 DAY ORDER BY `date`')->result_array();
		return $array;
	}

	function load_letter($letter_id){
		return $this->db->get_where('letters',array('Id'=>$letter_id))->result_array();
	}

	function add_letter($letter){
		$this->db->insert('letters',$letter);
	}

	function add_default_letter($letter){
		$mailinterval = $this->db->get_where('configs',array('name'=>'mailinterval'))->result_array();
		$mailinterval = $mailinterval[0]['value'];
		$date = date("d",strtotime($letter['date']));
		$aMonth = array('января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря');
		$month = $aMonth[date("m",strtotime($letter['date']))-1];

		$letter['content'] = array_shift($this->db->get_where('lettemps', array('id'=>$letter['template']))->result_array());
		$letter['content'] = $letter['content']['text'];
		unset($letter['template']);
		$letter['date'] = date("Y-m-d",strtotime($letter['date'])-($mailinterval*60*60*24));

		$this->db->insert('letters',$letter);
	}

	function remove_letter($letter_id){
		$this->db->delete('letters',array('Id'=>$letter_id));
	}

	function update_letter($letter,$letter_id){
		$this->db->where(array('Id'=>$letter_id))->update('letters',$letter);
	}

	function sendtodayletters(){
		$letters = $this->db->get_where('letters',array('date'=>date("Y-m-d")))->result_array();
		foreach($letters as $letter){
			$addresses = explode(', ',$letter['addresses']);
			foreach($addresses as $mail){
				$content = $letter['content']."\r\n Для активации пройдите по ссылке <a href='http://kukuruznik.tk/mails/activate/".md5($mail)."'>http://kukuruznik.tk/mails/activate/".md5($mail)."</a>";
				$this->load->library('email');
				$this->email->from('joker-main@yandex.ru', 'Прыжки с парашютом');
				$this->email->to($mail);
				$this->email->subject($letter['title']);
				$this->email->message($content);
				$this->email->send();
				echo $this->email->print_debugger();
			}
		}
	}

}

?>
