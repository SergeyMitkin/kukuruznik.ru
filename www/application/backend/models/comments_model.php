<?php
class Comments_model extends CI_Model {
	
	function selectallcomments()
	{
		return $this->db->get('comments')->result_array();
	}
	
	function selectcomments($comment_id)
	{
		$this->db->where('Id',$comment_id);
		return $this->db->get('comments')->result_array();
	}
	
	function add_comments()
	{
		$comment = array(
			'author' => $_POST['author'],
			'age' => $_POST['age'],
			'date' => $_POST['date'],
			'text' => $_POST['text']
		);
		$this->db->insert('comments',$comment);
	}
	
	function update_comments($comment_id)
	{
		$comment = array(
			'author' => $_POST['author'],
			'age' => $_POST['age'],
			'date' => $_POST['date'],
			'text' => $_POST['text']
		);
		$this->db->where('Id',$comment_id);
		$this->db->update('comments', $comment);
	}
	
	function delete_comments($comment_id)
	{
	 	$this->db->delete('comments', array('Id' => $comment_id)); 
	}
}
?>
