<?php
class SessionMiddleware extends Middleware {
	public function incomingRequest(&$req) {
		session_start();
	}
}