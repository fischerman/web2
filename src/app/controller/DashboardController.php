<?php
class DashboardController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {
		$db = $req['db'];
		$stmt = $db->prepare("SELECT * FROM ideas ORDER BY createdAt DESC LIMIT 5");
		$stmt->execute();
		$ideas = [];
		while($row = $stmt->fetch()) {
			$ideas[] = $row;
		}
		$data['newest_ideas'] = $ideas;

		$db = $req['db'];
		$stmt = $db->prepare("SELECT * FROM ideas ORDER BY createdAt DESC LIMIT 5");
		$stmt->execute();
		$ideas = [];
		while($row = $stmt->fetch()) {
			$ideas[] = $row;
		}
		$data['hottest_ideas'] = $ideas;
	}
}