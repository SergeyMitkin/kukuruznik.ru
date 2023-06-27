<?php

class Test extends CI_Controller {
	public function testafterreg(){
		$this->load->model('mail_model');
		$this->mail_model->afterreg();
	}
}
?>
