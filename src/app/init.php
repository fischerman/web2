<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

function __autoload($className) {
	require_once('controller/'.$className.'.php');
}

require_once('lib/dumbledore/dumbledore.php');

require_once('Session.php');

require_once('routes.php');