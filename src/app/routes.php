<?php

$router = new Router($engine);

$router->addMiddleware(new SessionMiddleware());
$router->addMiddleware(new DatabaseMiddleware());

$router
->addRoute("/dash", [
	"controller" => new DashboardController()
])
->addRoute("/idea/:id", [
	"controller" => new IdeaController(),
	"view" => "idea"
])
->addRoute("/welcome", [])
->addRoute("/idea/:id/threads", [])
->addRoute("/threads/:id", [])
->addRoute("/impress", []);

$router->add404([
	"view" => "404"
]);

$router->processRequest();