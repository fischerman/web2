<?php
class TemplateEngine {
	private $templates = [];
	private $basePath = "template/";
	private $default;

	public function addTemplate(Template $template, $default = false) {
		$this->templates[$template->getName()] = $template;
		if($default)
			$this->default = $template;
	}

	public function getDefaultTemplate() {
		if(!isset($this->default))
			die('No default template specified');
		return $this->default;
	}

	public function render($templateName, $view, $data) {
		if(!array_key_exists($templateName, $this->templates))
			die("Template doesn't exist");
		$template = $this->templates[$templateName];
		$template->beforeRender();
		require($this->basePath.$view."/".$templateName.".tpl");
		$template->afterRender();
	}
}