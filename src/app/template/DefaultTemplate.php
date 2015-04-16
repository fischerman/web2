<?php
class DefaultTemplate extends Template{
	public function getName() {
		return "default";
	}

	public function beforeRender() {
		echo "Header";
	}

	public function afterRender() {
		echo "Footer";
	}
}