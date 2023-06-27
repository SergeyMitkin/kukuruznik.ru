<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

    public function __construct() {
        echo "yeah";

        if($this->session->userdata('logged_in')){
            header('Location: /admin/login/auth/');
        }

        $this->load->model('articles_model');
    }
}
