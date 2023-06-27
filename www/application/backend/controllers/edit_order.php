<?
class Edit_order extends CI_Controller {
	public function __construct(){
		parent::__construct();
	}
	public function index(){
		$this->load->helper(array('form', 'url'));
		$this->load->library('form_validation');
		$this->form_validation->set_rules('type', 'Type', 'trim|required');
		$this->form_validation->set_rules('date', 'Height', 'trim|required');
		if ($this->form_validation->run() == FALSE){
			$this->templates->assign('order_id',$this->uri->segment(3));
			$this->templates->display('edit_order.tpl');

		}else{
			$this->Orders_model->update_order($this->uri->segment(3));
			$this->templates->display('formsuccess.tpl');
		}
	}

	public function people(){
		$people = $this->Orders_model->select_people($this->uri->segment(3));
		$this->load->helper(array('form', 'url'));
		$this->load->library('form_validation');
		if (empty($_POST))
		{
			$this->templates->assign('people', $people);
			$this->templates->assign('order_id',$this->uri->segment(3));
			$this->templates->display('edit_people.tpl');

		}else{
			$this->Orders_model->update_people($this->uri->segment(3));
			$this->templates->display('formsuccess.tpl');
		}
	}

	public function changedate(){
		$this->Orders_model->changedate($_POST['olddate'],$_POST['newdate']);
		$this->templates->display('formsuccess.tpl');
	}

	public function delete(){
		$this->Orders_model->delete_order($this->uri->segment(3));
		$this->templates->display('formsuccess.tpl');
	}
}
?>
