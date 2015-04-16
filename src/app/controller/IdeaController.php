<?php
class IdeaController extends Controller {
	public function incomingRequest($req) {
		echo "Idea Controller for ". $req["params"]["id"];
	}
}