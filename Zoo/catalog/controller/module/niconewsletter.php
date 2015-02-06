<?php
class ControllerModuleNiconewsletter extends Controller {
	protected function index($setting) {
		$this->language->load('module/niconewsletter');

		$this->data = $setting;
		
      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
				
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/niconewsletter.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/niconewsletter.tpl';
		} else {
			$this->template = 'default/template/module/niconewsletter.tpl';
		}

		$this->render();
	}
}
?>
