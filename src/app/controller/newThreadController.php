<?php
class NewThreadController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {
		if($_SERVER['REQUEST_METHOD'] == 'POST') {
			var_dump($_POST);
			var_dump($req);
			var_dump($_SESSION);
			try {
				$db = $req['db'];
				$stmt = $db->prepare("INSERT INTO threads (threadName, idea, createdBy, createdAt) VALUES (:name, :idea, :creator, now())");
				$stmt->bindParam(':name', $_POST["title"]);
				$stmt->bindParam(':idea', $req["params"]["id"]);
				$stmt->bindParam(':creator', $_SESSION["userId"]);
				$stmt->execute();
				$id = $db->lastInsertId();

				// INSERT intial post
				$stmt = $db->prepare("INSERT INTO post (thread, content, createdBy, createdAt) VALUES (:id, :content, :creator, now())");
				$stmt->bindParam(':id', $id);
				$stmt->bindParam(':content', $_POST['content']);
				$stmt->bindParam(':creator', $_SESSION["userId"]);
				$stmt->execute();
			} catch(PDOException $e) {
				throw $e;
				die("Failed to create thread");
			}
			header('Location: /thread/' . $id);
			die();
		} else {
			// else load idea title to be displayed
			$db = $req['db'];
			$stmt = $db->prepare("SELECT * FROM ideas WHERE ideaId = :id");
			$id = intval($req["params"]["id"]);
			$stmt->bindParam(':id', $id);
			$stmt->execute();
			$row = $stmt->fetch();
			$data['idea'] = $row;
		}
	}
}