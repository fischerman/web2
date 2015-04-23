<?php
class LoginController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {
		if($_SERVER['REQUEST_METHOD'] == "POST") {
			// check credentials
			$db = $req["db"];
			$row;
			try {
				$stmt = $db->prepare("SELECT * FROM users WHERE userName = :name AND password = :password");
				$stmt->bindParam(':name', $_POST['name']);
				$stmt->bindParam(':password', $_POST['password']);
				$stmt->execute();
				$row = $stmt->fetch();
			} catch(PDOException $e) {
				die('Failed to execute query');
			}
			if($row) { // user and password match!
				$_SESSION["authenticated"] = true;
				$_SESSION["userId"] = $row["userId"];
				$_SESSION["fullName"] = $row["fullName"];
				header('Location: /dashboard');
				die();
			} else {
				$data["loginFailed"] = true;
				$res->view = 'welcome';
			}
		} else {
			$res->view = 'idea';
		}
	}
}