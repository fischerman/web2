<?php
class ThreadController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {
		$db = $req['db'];
		$stmt = $db->prepare("SELECT * FROM threads JOIN users ON userId = createdBy JOIN ideas ON ideaId = idea WHERE threadId = :id");
		$id = intval($req["params"]["id"]);
		$stmt->bindParam(':id', $id);
		$stmt->execute();
		$row = $stmt->fetch();
		$data['thread'] = $row;

		$stmt = $db->prepare("SELECT * FROM post JOIN users ON userId = createdBy WHERE thread = :id");
		$id = intval($req["params"]["id"]);
		$stmt->bindParam(':id', $id);
		$stmt->execute();
		$threads = [];
		while($row = $stmt->fetch()) {
			$threads[] = $row;
		}
		$data['posts'] = $threads;
	}
}