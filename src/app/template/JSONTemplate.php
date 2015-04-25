<?php
class JSONTemplate extends Template{
	public function getName() {
		return "json";
	}

	public function beforeRender() {
		header('Content-Type: application/json');
	}

	public function afterRender() {
		
	}
}