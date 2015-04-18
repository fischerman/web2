<?php
class DefaultTemplate extends Template{
	public function getName() {
		return "default";
	}

	public function beforeRender() {
		require("template/defaultHeader.tpl");
	}

	public function afterRender() {
		require("template/defaultFooter.tpl");
	}
}