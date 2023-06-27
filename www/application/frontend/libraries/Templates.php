<?php
require_once('smarty/Smarty.class.php');
class Templates extends Smarty{             
    function Templates() 
    {      
        parent::__construct();
        $this->left_delimiter = '{';
        $this->right_delimiter = '}';            
        $this->template_dir = $_SERVER['DOCUMENT_ROOT'].'/application/frontend/views/';
        $this->compile_dir = $_SERVER['DOCUMENT_ROOT'].'/application/frontend/templates_c/';
        $this->config_dir = $_SERVER['DOCUMENT_ROOT'].'/application/frontend/configs/';
        $this->cache_dir = $_SERVER['DOCUMENT_ROOT'].'/application/frontend/cache/';   
    }      
}
?>
