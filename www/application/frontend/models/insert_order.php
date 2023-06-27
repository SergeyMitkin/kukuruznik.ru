<?
class Insert_order extends CI_Model {

     function __construct()
     {
         // Call the Model constructor
         parent::__construct();
     }
     
     function add_order()
     {
        $order_info = array(
			'type' => $this->input->post('type'),
			'telephone' => '+7'.$this->input->post('telephone'),
			'email' => $this->input->post('email'),
			'date' => $this->input->post('date')
		);
		$this->db->insert('orders', $order_info); 
		$last_order = $this->db->limit(1)->get('orders')->result_array();
		$human_info = array(
			'order_id' => $last_order[0]['Id'],
			'name' => $this->input->post('name'),
			'age' => $this->input->post('age'),
			'weight' => $this->input->post('weight'),
			'height' => $this->input->post('height')
		);
		
		$this->db->insert('people', $human_info);
     }
 }
?>