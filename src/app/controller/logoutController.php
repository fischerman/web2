<?php
class LogoutController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {
		unset($_SESSION['authenticated']);
		unset($_SESSION['userId']);
		unset($_SESSION['fullName']);
		$data['loggedOut'] = true;
		header('Location: /welcome');
		die();
	}
}