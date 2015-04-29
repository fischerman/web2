<?php
class DatabaseMiddleware extends Middleware {
	public function incomingRequest(&$req) {
		try {
			$req["db"] = new PDO(constant("DB_DSN"), constant("DB_USER"), constant("DB_PASS"));
			$req["db"]->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		} catch(PDOException $e) {
			die('Failed to connect to DB');
		}
	}
}