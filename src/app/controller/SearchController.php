<?php
class SearchController extends Controller {
	public function incomingRequest(&$req, &$data, Response $res) {
		$db = $req['db'];
		$stmt = $db->prepare("SELECT * FROM ideas WHERE ideaName like CONCAT('%', :q,'%')");
		$stmt->bindParam(':q', $_GET['q']);
		$stmt->execute();
		$results = [];
		while($row = $stmt->fetch()) {
			$results[] = $row;
		}
		$data['results'] = $results;
	}
}