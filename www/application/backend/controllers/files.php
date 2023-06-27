<?php
class Files extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('files_model');
	}

	public function index() {
		$this->templates->assign('files',$this->files_model->load_files());
		$this->templates->display('files/index.tpl');
	}

	public function upload_file() {
		$config['upload_path'] = $_SERVER['DOCUMENT_ROOT'].'/uploads/';
		$config['allowed_types'] = "*";
		$this->load->library('upload', $config);
		
		if (!$this->upload->do_upload('file')){
			$error = array('error' => $this->upload->display_errors());
			var_dump($error);
		}else{
			$data = $this->upload->data();
			$this->files_model->add_file($data['file_name']);
			header('Location: /admin/files');
		}
	}

	public function delete_file($id) {
		$this->files_model->remove_file($id);
		header('Location: /admin/files');
	}
}
