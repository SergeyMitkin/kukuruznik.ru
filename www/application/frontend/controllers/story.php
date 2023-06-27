<?php
class Story extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->templates->assign('dates',$this->dates->dates());
		$this->load->model('meta_model');
		$uri2 = $this->uri->segment(2);
		$path = $this->uri->segment(1);
		if(strpos($path,'.html') == TRUE){
			$path = substr($path,0,strpos($path,'.html'));
		}
		$settings = $this->meta_model->load_page($path);
		$this->templates->assign('title',$settings['title']);
		$this->templates->assign('keywords',$settings['keywords']);
		$this->templates->assign('description',$settings['description']);
	}
	
	public function index(){
		$this->load->model('storymodel');
		$per_page = 5;
		$page = $this->uri->segment(2);
		if (empty($page)) $page = 0;
		$this->load->library('pagination');
		$config['base_url'] = 'http://kukuruznik.com/story.html/';
		$config['total_rows'] = $this->storymodel->all_items();
		$config['per_page'] = $per_page;
		$config['num_links'] = 10;
		$config['uri_segment'] = 2;
		$config['full_tag_open'] = '<ul class="pages">';
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';
		$config['full_tag_close'] = '</ul>';
		$config['cur_tag_open'] = '<li class="active">';
		$config['cur_tag_close'] = '</li>';
		$config['prev_link'] = '';
		$config['next_link'] = '';
		$config['last_link'] = '';
		$this->pagination->initialize($config);
		$this->templates->assign('pages',$this->pagination->create_links());
		$this->templates->assign('stories',$this->storymodel->stories($page,$per_page));
		$this->templates->display('stories.tpl');
	}

	public function storyid(){
		$this->load->model('storymodel');
		$this->templates->assign('stories',$this->storymodel->story($this->uri->segment(3)));
		$this->templates->display('story.tpl');
	}
}
?>
