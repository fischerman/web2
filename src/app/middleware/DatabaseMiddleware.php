<?php
class DatabaseMiddleware extends Middleware {
	public function incomingRequest(&$req) {
		try {
			$req["db"] = new PDO(constant("DB_DSN"), constant("DB_USER"));
		} catch(PDOException $e) {
			die('Failed to connect to DB');
		}
	}
}