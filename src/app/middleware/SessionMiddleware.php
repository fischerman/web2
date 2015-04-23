<?php
class SessionMiddleware extends Middleware {
	public function incomingRequest(&$req) {
		session_start();
		if(!isset($_SESSION['authenticated']))
			$_SESSION['authenticated'] = false;
	}
}