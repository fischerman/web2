<?php
class Router {
	private $middleware = [];
	private $routes = [];
	private $r404;
	private $engine;

	function __construct(TemplateEngine $engine) {
		$this->engine = $engine;
	}

	public function addRoute($url, $options) {
		$this->routes[$url] = $options;
		return $this;
	}

	public function add404($options) {
		$this->r404 = $options;
	}

	public function addMiddleware(Middleware $mid) {
		$this->middleware[] = $mid;
	}

	public function processRequest() {
		$req = [];
		foreach ($this->middleware as $mid) {
			$mid->incomingRequest($req);
		}
		// find the first route
		$route;
		foreach ($this->routes as $url => $routeOptions) {
			$splittedRouteUrl = explode("/", $url);
			$regex = [];
			$params = [];
			foreach ($splittedRouteUrl as $key => $urlPart) {
				// check if url part is a parameter
				if(substr($urlPart, 0, 1) == ':') {
					$regex[] = "([a-z0-9]+)";
					$params[] = substr($urlPart, 1);
				} else {
					$regex[] = $urlPart;
				}
			}
			$regex = implode('/', $regex);
			$requestUri = $_SERVER['REQUEST_URI'];
			$requestUri = explode("?", $requestUri)[0];
			if(substr($requestUri, strlen($requestUri) -1) == "/")	// remove trailing slash for comparison
				$requestUri = substr($requestUri, 0, strlen($requestUri) - 1);
			$matches = [];
			if(preg_match("#^".$regex."$#", $requestUri, $matches)) {
				$route = $routeOptions;
				$req["params"] = [];
				foreach ($params as $i => $name) {
					$req["params"][$name] = $matches[$i + 1];
				}
				break;
			}
			else
				continue;
		}
		if(!isset($route)) {
			if(isset($this->r404))
				$this->engine->render("default", $this->r404["view"], []);
			else
				die('No route found and no 404 provided');
		} else {
			$data = [];

			// call controller only if provided
			$res = new Response();
			if(isset($route["controller"]))
				$route["controller"]->incomingRequest($req, $data, $res);

			// compute view, options succeeds controller!
			$view;
			if(array_key_exists("view", $route))
				$view = $route["view"];
			else if (isset($res->view))
				$view = $res->view;
			else
				die("No view specified");

			$template;
			if(array_key_exists("template", $route))
				$template = $route["template"];
			else if (isset($res->template))
				$template = $res->template;
			else
				$template = $this->engine->getDefaultTemplate()->getName();

			$this->engine->render($template, $view, $data);
		}
	}
}