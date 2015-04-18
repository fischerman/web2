<?php

$router = new Router($engine);

$router->addMiddleware(new SessionMiddleware());
$router->addMiddleware(new DatabaseMiddleware());

$router
->addRoute("/dashboard", [
	"controller" => new DashboardController(),
	"view" => "dashboard"
])
->addRoute("/idea/:id", [
	"controller" => new IdeaController(),
	"view" => "idea"
])
->addRoute("/login", [
	"controller" => new LoginController()
])
->addRoute("/welcome", [
	"view" => "welcome"
])
->addRoute("/thread/:id", [
	"controller" => new ThreadController(),
	"view" => "thread"
])
->addRoute("/impress", []);

$router->add404([
	"view" => "404"
]);

$router->processRequest();