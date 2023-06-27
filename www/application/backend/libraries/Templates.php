<?php
require_once('smarty/Smarty.class.php');
class Templates extends Smarty{             
    function Templates() 
    {      
        parent::__construct();
        $this->left_delimiter = '{';
        $this->right_delimiter = '}';            
        $this->template_dir = $_SERVER['DOCUMENT_ROOT'].'/application/backend/views/';
        $this->compile_dir = $_SERVER['DOCUMENT_ROOT'].'/application/backend/templates_c/';
        $this->config_dir = $_SERVER['DOCUMENT_ROOT'].'/application/backend/configs/';
        $this->cache_dir = $_SERVER['DOCUMENT_ROOT'].'/application/backend/cache/';   
    }      
}
?>
