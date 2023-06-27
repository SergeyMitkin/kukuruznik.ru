<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

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
	}

	public function csv(){
		mb_internal_encoding('windows-1251');
		$date = $_GET['date'];
		$type = $_GET['type'];
		$file = '/'.$date.' '.$type.'.csv';

		$this->db->query('SET CHARSET cp1251');
		$f = fopen($_SERVER['DOCUMENT_ROOT'].$file,'w');
		$orders = $this->db->get_where('orders',array('date'=>$date,'type'=>$type))->result_array();
		fputcsv($f, array(iconv('utf-8','cp1251','ФИО'),iconv('utf-8','cp1251','Возраст'),iconv('utf-8','cp1251','Рост'),iconv('utf-8','cp1251','Вес'),iconv('utf-8','cp1251','№ сертификата'),iconv('utf-8','cp1251','email'),iconv('utf-8','cp1251','Телефон')), ';');
		
		foreach($orders as $order){
			$people = $this->db->select(array('name','age','height','weight','sertnum'))->get_where('people',array('order_id'=>$order['Id']))->result_array();
			foreach($people as $data){
				$data['email'] = $order['email'];
				$data['telephone'] = $order['telephone'];
				fputcsv($f, $data, ';');
			}
			unset($people);

		}

		fclose($f);
		header('Location: '.$file);
	}


	public function csv_tandem(){
		mb_internal_encoding('windows-1251');
		$date = $_GET['date'];
		$type = $_GET['type'];
		$file = '/'.$date.' '.$type.'_short.csv';

		$this->db->query('SET CHARSET cp1251');
		$f = fopen($_SERVER['DOCUMENT_ROOT'].$file,'w');
		$orders = $this->db->get_where('orders',array('date'=>$date,'type'=>$type))->result_array();
		fputcsv($f, array(iconv('utf-8','cp1251','ФИО'),iconv('utf-8','cp1251','Заметки')), ';');
		
		foreach($orders as $order){
			$people = $this->db->select(array('name'))->get_where('people',array('order_id'=>$order['Id']))->result_array();
			foreach($people as $data){
				$data['notes'] = $order['notes'];
				fputcsv($f, $data, ';');
			}
			unset($people);

		}

		fclose($f);
		header('Location: '.$file);
	}

	public function testemail(){
		#$this->load->model('mails');
		$this->load->library('email');
		$this->email->from('joker-main@yandex.ru','Alexeev Vyacheslav');	
//		$this->email->reply_to('joker-main@yandex.ru','Alexeev Vyacheslav');
//		$this->email->to('alexeev.corp@gmail.com, joker-main@qip.ru');
        $this->email->to('sergeymitkin@gmail.com');
		$this->email->subject('Проверка работы email модуля новой cms');
		$this->email->message('Проверка прошла. С уважением, Алексеев Вячеслав');
		$this->email->send();
	}


	public function index() {
		$settings['title'] = 'Прыжки с парашютом в Москве (Московская область и Подмосковье)';
		$settings['keywords'] = 'Прыжки с парашютом в Москве, прыжок с парашютом в Подмосковье (Московская область)';
		$settings['description'] = '';

		$this->load->model('news_model');
		$this->templates->assign('news',$this->news_model->load_on_top());
		$this->templates->assign('title',$settings['title']);
		$this->templates->assign('keywords',$settings['keywords']);
		$this->templates->assign('description',$settings['description']);
		$this->templates->assign('content',$this->db->get_where('pages',array('title'=>'Главная'))->result_array());

		$this->templates->display('index.tpl'); //указываем имя шаблона
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
