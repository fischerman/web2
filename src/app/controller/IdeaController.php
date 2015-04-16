<?php
class IdeaController extends Controller {
	public function incomingRequest($req, Response $res) {

		$res->view = "dashboard";
	}
}