<?php

Class Mail_model extends CI_Controller {
	function afterreg($type){
		if($type == 'single') {
			$file = 'shnp1.jpg';
		}elseif($type == 'tandem'){
			$file = 'kak_proehat.doc';
		}

		$mailinterval = $this->db->get_where('configs',array('name'=>'mailinterval'))->result_array();
		$mailinterval = $mailinterval[0]['value'];
		$last_order = $this->db->order_by('Id','desc')->limit(1)->get('orders')->result_array();
		$last_order = $last_order[0];
		$order_date = strtotime($last_order['date']);
		$cur_date = strtotime(date('Y-m-d'));
		$date_id = $this->db->get_where('dates',array('date'=>$last_order['date'],'jumptype'=>$type))->result_array();
		$date_id = $date_id[0]['Id'];
		if($mailinterval >= floor(($order_date - $cur_date)/(60*60*24))){
			$content = $this->db->get_where('letters',array('date_id'=>$date_id))->result_array();
			include('mailafterreg.php');
			sendmail($last_order['email'],$content[0]['title'],$content[0]['content'],$file,1);
			$this->db->where(array('Id'=>$last_order['Id']))->update('orders',array('confirmation'=>'sended'));
		}else{
			include('mailafterreg.php');
			sendmail($last_order['email'],'Заявка на прыжок с парашютом','
				Ваша заявка на прыжок с парашютом принята. <br><br>

				За 5-6 дней до прыжков на Вашу электронную почту придет подробная  инструкция  о дальнейших действиях и схема проезда.
				<br><br>
				Если за 5 дней до запланированной даты прыжков  Вы не получите наше письмо, то:
				<br><br>
				1. Проверьте, не попало ли подтверждающее письмо в папку "Нежелательная почта", "Спам" или в "Корзину" (этим часто грешит почта от gmail.com)
				<br><br>
				2. Если письма нет в указанных в п.1 папках, то свяжитесь с нами по эл. почте jump@kukuruznik.com, или по тел. +7 926 824 64 59 
',0,0);
		}		
	}
}

?>
