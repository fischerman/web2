<?php
abstract class Controller {
	abstract public function incomingRequest($req, Response $res);
}