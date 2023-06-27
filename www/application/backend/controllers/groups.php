<?php
class Groups extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('groups_model');
		$this->load->model('modules_model');
	}

	public function index() {
		$this->templates->assign('groups',$this->groups_model->load_groups());
		$this->templates->display('groups/index.tpl');
	}

	public function add() {
        if(empty($_POST)){
            $this->templates->assign("modules",$this->modules_model->load_modules());
            $this->templates->display("groups/add.tpl");
        }else{
            $this->groups_model->add_group($_POST);
            header('Location: /admin/groups');
        }
	}

	public function edit($Id) {
        if(empty($_POST)){
            $modules = $this->modules_model->load_modules();
            $group = $this->groups_model->load_group($Id);
            foreach($modules as $id=>$module) {
                if(isset($group['rights'][$module['controller']]))
                    $modules[$id]['rights'] = $group['rights'][$module['controller']];
            }
            $this->templates->assign("modules",$modules);
            $this->templates->assign("group",$group);
            $this->templates->display("groups/edit.tpl");
        }else{
            $this->groups_model->update_group($_POST,$Id);
            header('Location: /admin/groups');
        }
	}

	public function delete($Id) {
		$this->groups_model->delete_group($Id);
		header('Location: /admin/groups');
	}
}
?>
