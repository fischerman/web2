<?php

$router = new Router($engine);

$router->addMiddleware(new SessionMiddleware());
$router->addMiddleware(new DatabaseMiddleware());

$router
->addRoute("/dashboard", [
	"controller" => new DashboardController(),
	"view" => "dashboard"
])
->addRoute("/idea/new", [
	"controller" => new NewIdeaController(),
	"view" => "newidea"
])
->addRoute("/idea/:id", [
	"controller" => new IdeaController(),
	"view" => "idea"
])
->addRoute("/login", [
	"controller" => new LoginController()
])
->addRoute("/logout", [
	"controller" => new LogoutController()
])
->addRoute("/welcome", [
	"view" => "welcome"
])
->addRoute("/idea/:id/newthread", [
	"controller" => new NewThreadController(),
	"view" => "newthread"
])
->addRoute("/thread/:id", [
	"controller" => new ThreadController(),
	"view" => "thread"
])
->addRoute("/impress", [
	"view" => "impress"
])
->addRoute("/contact", [
	"view" => "contact"
]);

$router->add404([
	"view" => "404"
]);

$router->processRequest();