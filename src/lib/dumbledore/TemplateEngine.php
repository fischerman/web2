<?php
class TemplateEngine {
	private $templates = [];
	private $basePath = "template/";

	public function addTemplate(Template $template) {
		$this->templates[$template->getName()] = $template;
	}

	public function render($templateName, $view) {
		if(!array_key_exists($templateName, $this->templates))
			die("Template doesn't exist");
		$template = $this->templates[$templateName];
		$template->beforeRender();
		require($this->basePath.$view."/".$templateName.".tpl");
		$template->afterRender();
	}
}