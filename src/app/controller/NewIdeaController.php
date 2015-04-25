<?php
class NewIdeaController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {
		if($_SERVER['REQUEST_METHOD'] == 'POST') {
			$db = $req['db'];
			$stmt = $db->prepare("INSERT INTO ideas (ideaName, description, createdBy, createdAt) VALUES (:name, :description, :creator, now())");
			$stmt->bindParam(':name', $_POST["name"]);
			$stmt->bindParam(':description', $_POST["description"]);
			$stmt->bindParam(':creator', $_SESSION["userId"]);
			$stmt->execute();
			$row = $stmt->fetch();
			$id = $db->lastInsertId();

			header('Location: /idea/' . $id);
			die();
		} else {
			// else just return the creation 
		}
	}
}