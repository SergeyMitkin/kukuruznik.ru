<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Comments extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('Comments_model');
	}

	public function index()
	{
		$this->templates->assign('comments', $this->Comments_model->selectallcomments());
		$this->templates->display('comments/comments.tpl');
	}

	public function edit_comments()
	{
		$this->Comments_model->update_comments($this->uri->segment(3));
		header('Location: /admin/comments');
	}

	public function add_comments()
	{
		$this->Comments_model->add_comments();
		header('Location: /admin/comments');
	}

	public function delete_comments()
	{
		$this->Comments_model->delete_comments($this->uri->segment(3));
		header('Location: /admin/comments');
	}

}
?>
