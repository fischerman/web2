<?php
class IdeaController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {
		if(substr($_SERVER['REQUEST_URI'], strlen($_SERVER['REQUEST_URI'])-1) != "/") {
			header('Location: /idea/' . $req["params"]["id"] . '/');
			die();
		}
		$db = $req['db'];
		$stmt = $db->prepare("SELECT * FROM ideas JOIN users ON userId = ideas.createdBy WHERE ideaId = :id");
		$id = intval($req["params"]["id"]);
		$stmt->bindParam(':id', $id);
		$stmt->execute();
		$row = $stmt->fetch();
		$data['idea'] = $row;

		$stmt = $db->prepare("SELECT * FROM threads WHERE idea = :id");
		$id = intval($req["params"]["id"]);
		$stmt->bindParam(':id', $id);
		$stmt->execute();
		$threads = [];
		while($row = $stmt->fetch()) {
			$threads[] = $row;
		}
		$data['threads'] = $threads;
	}
}