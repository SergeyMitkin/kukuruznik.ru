<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Articles extends CI_Controller {
	public function __construct(){ parent::__construct();
		$this->templates->assign('dates',$this->dates->dates());

		$this->load->model('articles_model');
		$this->load->model('meta_model');

		$uri2 = $this->uri->segment(2);
		if(empty($uri2)){
			$path = $this->uri->segment(1);
			$settings = $this->meta_model->load_page($path);
		}else{
			//$path = $this->uri->segment(1).'/'.$this->uri->segment(2);
			if($uri2 = 'view'){
				$article = $this->articles_model->load_article($this->uri->segment(3));
				$settings['title'] = $article['title'];
				$settings['keywords'] = '';
				$settings['description'] = '';
			}
		}

		$this->templates->assign('title',$settings['title']);
		$this->templates->assign('keywords',$settings['keywords']);
		$this->templates->assign('description',$settings['description']);
	}

	public function index() {
		$per_page = 5;
		$page = $this->uri->segment(2);
		if (empty($page)) $page = 0;
		$this->load->library('pagination');
		$config['base_url'] = 'http://kukuruznik.com/articles/';
		$config['total_rows'] = $this->articles_model->articles_num();
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
		$this->templates->assign('articles',$this->articles_model->load_articles($page,$per_page));
		$this->templates->display('articles/articles.tpl');
	}

	public function view($id) {
		$this->templates->assign('article',$this->articles_model->load_article($id));
		$this->templates->display('articles/article.tpl');
	}

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
