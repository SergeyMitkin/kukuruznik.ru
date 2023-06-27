<?php
class Mail extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('meta_model');
		$uri2 = $this->uri->segment(2);
		if(empty($uri2)){
			$path = $this->uri->segment(1);
		}else{
			$path = $this->uri->segment(1).'/'.$this->uri->segment(2);
		}
		$settings = $this->meta_model->load_page($path);
		$this->templates->assign('title',$settings['title']);
		$this->templates->assign('keywords',$settings['keywords']);
		$this->templates->assign('description',$settings['description']);
	}
	public function feedback(){
		if(!empty($_POST)){
			include($_SERVER['DOCUMENT_ROOT'].'/mailafterreg.php'); 
			sendmail('jump@kukuruznik.com','Обратная связь kukuruznik.com','Имя: '.$this->input->post('name').'<br>Email:'.$this->input->post('mail').'<br>Телефон: '.$this->input->post('telephone').'<br>'.$this->input->post('text'),0,0);
		}
		$this->templates->display('mailsended.tpl');
	}
}
?>
