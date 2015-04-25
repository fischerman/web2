<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once('config.php');

function __autoload($className) {
	$regex = "#.+([A-Z][a-z0-9]+)$#";
	$matches = [];
	if(!preg_match($regex, $className, $matches))
		die('Invalid class name: '.$className);
	switch($matches[1]) {
		case "Template":
			require_once('template/'.$className.'.php');
			break;
		case "Controller":
			require_once('controller/'.$className.'.php');
			break;
		case "Middleware":
			require_once('middleware/'.$className.'.php');
			break;
		default:
			die("Invalid class name suffix: ".$className);
	}
}

require_once('lib/dumbledore/dumbledore.php');

$engine = new TemplateEngine();
$engine->addTemplate(new DefaultTemplate(), true);
$engine->addTemplate(new JSONTemplate());

require_once('routes.php');