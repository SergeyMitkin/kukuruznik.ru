<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class News extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct(){
		parent::__construct();
		$this->templates->assign('dates',$this->dates->dates());

		$this->load->model('news_model');
		$this->load->model('meta_model');

		$uri2 = $this->uri->segment(2);
		if(empty($uri2)){
			$path = $this->uri->segment(1);
			$settings = $this->meta_model->load_page($path);
		}else{
			//$path = $this->uri->segment(1).'/'.$this->uri->segment(2);
			if($uri2 = 'view'){
				$new = $this->news_model->load_new($this->uri->segment(3));
				$settings['title'] = $new['title'];
				$settings['keywords'] = '';
				$settings['description'] = '';
			}
		}

		$this->templates->assign('title',$settings['title']);
		$this->templates->assign('keywords',$settings['keywords']);
		$this->templates->assign('description',$settings['description']);
	} 

	public function index() {
		$per_page = 10;
		$page = $this->uri->segment(2);
		if (empty($page)) $page = 0;
		$this->load->library('pagination');
		$config['base_url'] = 'http://kukuruznik.com/news/';
		$config['total_rows'] = $this->news_model->news_num();
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
		$this->templates->assign('news',$this->news_model->load_news($page,$per_page));
		$this->templates->display('news/news.tpl');
	}

	public function view($id) {
		$this->templates->assign('new',$this->news_model->load_new($id));
		$this->templates->display('news/new.tpl');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
