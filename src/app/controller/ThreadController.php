<?php
class ThreadController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {
		$db = $req['db'];
		$stmt = $db->prepare("SELECT * FROM threads WHERE threadId = :id");
		$id = intval($req["params"]["id"]);
		$stmt->bindParam(':id', $id);
		$stmt->execute();
		$row = $stmt->fetch();
		$data['thread'] = $row;

		$stmt = $db->prepare("SELECT * FROM post WHERE thread = :id");
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