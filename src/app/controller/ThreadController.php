<?php
class ThreadController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {
		$db = $req['db'];
		$threadId = intval($req["params"]["id"]);
		if($_SERVER['REQUEST_METHOD'] == 'POST') { // create a new post to the thread
			try {
				$stmt = $db->prepare("INSERT INTO post (thread, content, createdBy, createdAt) VALUES (:id, :content, :creator, now())");
				$stmt->bindParam(':id', $threadId);
				$stmt->bindParam(':content', $_POST['content']);
				$stmt->bindParam(':creator', $_SESSION["userId"]);
				$stmt->execute();
				$postId = $db->lastInsertId();
				if(isset($_GET['json'])) {
					$res->template = "json"; // change template to json

					$stmt = $db->prepare("SELECT * FROM post JOIN users ON userId = createdBy WHERE postId = :id");
					$stmt->bindParam(':id', $postId);
					$stmt->execute();
					$data['post'] = $stmt->fetch();
					$data['post']['createdAt'] = date('M d, Y', strtotime($data['post']['createdAt']));

					return; // return to avoid other queries
				}
			} catch (Exception $e) {
				die("Failed");
			}
		}
		$stmt = $db->prepare("SELECT * FROM threads JOIN users ON userId = createdBy JOIN ideas ON ideaId = idea WHERE threadId = :id");
		$stmt->bindParam(':id', $threadId);
		$stmt->execute();
		$row = $stmt->fetch();
		$data['thread'] = $row;

		$stmt = $db->prepare("SELECT * FROM post JOIN users ON userId = createdBy WHERE thread = :id");
		$stmt->bindParam(':id', $threadId);
		$stmt->execute();
		$threads = [];
		while($row = $stmt->fetch()) {
			$threads[] = $row;
		}
		$data['posts'] = $threads;

	}
}