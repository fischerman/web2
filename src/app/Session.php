<?php
class Session extends Middleware {
	public function incomingRequest($req) {
		session_start();

		echo "session created";
	}
}