<?php
abstract class Controller {
	abstract public function incomingRequest(&$req, &$data, Response $res);
}