<?php
class IdeaController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {

		$res->view = "dashboard";
	}
}