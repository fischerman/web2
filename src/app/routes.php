<?php

$router = new Router();

$router->addMiddleware();

$router
->addRouter("/", new Object())
->addRoute("/welcome", new Object())
->addRouter("/idea/:id", new Object())
->addRouter("/idea/:id/threads", new Object())
->addRouter("/threads/:id", new Object())
->addRouter("/impress", new Object())

?>