<?php

$router = new Router();

$router->addMiddleware(new Session());

$router
->addRoute("/", [
	"controller" => new DashboardController()
])
->addRoute("/idea/:id", [
	"controller" => new IdeaController()
])
->addRoute("/welcome", [])
->addRoute("/idea/:id/threads", [])
->addRoute("/threads/:id", [])
->addRoute("/impress", []);

$router->processRequest();