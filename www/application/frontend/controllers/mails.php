<?php
class Mails extends CI_Controller {
	public function index(){
			
	}
	
	public function activate(){
		$settings['title'] = 'ПРЫЖКИ С ПАРАШЮТОМ, активация письма';
		$settings['keywords'] = '';
		$settings['description'] = '';

		$this->templates->assign('title',$settings['title']);
		$this->templates->assign('keywords',$settings['keywords']);
		$this->templates->assign('description',$settings['description']);

		$orders = $this->db->get_where('orders',array('md5(`email`)'=>$this->uri->segment(3)))->result_array();
		foreach($orders as $mail){
			if($mail['confirmation'] == 'sended'){
				$this->db->where(array('md5(`email`)'=>$this->uri->segment(3)))->update('orders',array('confirmation'=>'readed'));
			}
		}
		$this->templates->display('emailactivated.tpl');
	}
}
?>
