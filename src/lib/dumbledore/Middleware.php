<?php
abstract class Middleware {
	abstract public function incomingRequest(&$req);
}