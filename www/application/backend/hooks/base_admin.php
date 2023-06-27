<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Base_admin extends CI_Controller {
    public function check_auth() {
        $check_auth = $this->session->userdata('logged_in');

        if(($check_auth == FALSE) && ($this->uri->segment(1) != 'login')){
            header('Location: /admin/login/auth/');
        }
    }

    public function check_rights() {
        $group = $this->session->userdata('group');

        $query_write = FALSE;
        $query_delete = FALSE;
        $query_date = FALSE;

        switch($this->uri->segment(2)){
            case "add":
            case "edit":
            case "add_article":
            case "edit_article":
            case "add_comments":
            case "edit_comments":
            case "add_date":
            case "add_album":
            case "album_cover":
            case "add_photos":
            case "edit_album":
            case "add_video":
            case "edit_video":
            case "add_info":
            case "edit_info":
            case "add_letter":
            case "edit_letter":
            case "add_new":
            case "edit_order":
            case "people":
            case "changedate":
            case "set_confirm":
            case "add_page":
            case "edit_page":
                $query_write = TRUE;
                break;
            case "delete":
            case "delete_article":
            case "delete_comments":
            case "delete_date":
            case "remove_photo":
            case "remove_album":
            case "remove_video":
            case "delete_info":
            case "remove_letter":
            case "delete_new":
            case "delete_order":
            case "delete_page":
                $query_delete = TRUE;
                break;
            case "ondate":
                $query_date = TRUE;
                break;
        }

        if($query_write)
            if(!$this->find_right("write",$this->uri->segment(1),$group)){
                echo "Прав на запись нет<br>";
                echo "<a href='".$_SERVER['HTTP_REFERER']."'>Вернуться</a>";
                exit;
                //header('Location: /admin/welcome');
            }
        if($query_date)
            if($this->uri->segment(4) == 'single'){
                if(!$this->find_right("read","date_single",$group)){
                    echo "Прав на просмотр нет<br>";
                    echo "<a href='".$_SERVER['HTTP_REFERER']."'>Вернуться</a>";
                    exit;
                }
            }elseif($this->uri->segment(4) == 'tandem'){
                if(!$this->find_right("read","date_tandem",$group)){
                    echo "Прав на просмотр нет<br>";
                    echo "<a href='".$_SERVER['HTTP_REFERER']."'>Вернуться</a>";
                    exit;
                }
            }

        if($query_delete)
            if(!$this->find_right("delete",$this->uri->segment(1),$group)){
                echo "Прав на удаление нет<br>";
                echo "<a href='".$_SERVER['HTTP_REFERER']."'>Вернуться</a>";
                exit;
                //header('Location: /admin/welcome');
            }

        if(!$this->find_right("read",$this->uri->segment(1),$group)){
            echo "Прав на чтение нет<br>";
            echo "<a href='".$_SERVER['HTTP_REFERER']."'>Вернуться</a>";
            exit;
            //header('Location: /admin/welcome');
        }

    }

    public function find_right($right,$controller,$group){
        if($controller == 'welcome' || $controller == 'login' || empty($controller))
            return true;
        $group = array_shift($this->db->get_where('groups',array('name'=>$group))->result_array());
        $group['rights'] = (array) json_decode($group['rights']);
        foreach($group['rights'] as $id=>$row){
            $group['rights'][$id] = (array)$row;
        }
        $rights = $group['rights'];
        if(isset($rights[$controller][$right]))
            return true;
        return false;
    }
}
