<html>
  <head>
    <link rel="stylesheet" href="/static/css/style.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script src="//localhost:35729/livereload.js"></script>
  </head>
  <body>
    <div class="nav-sec">
      <div class="nav-container">
        <div class="nav-in">
        	<div class="left">
        		<h2><a href="/dashboard"><i class="fa fa-exchange"></i> Idea Exchange</a></h2>
          		<input class="search" type="text" placeholder="Suche"/>
        	</div>
        	<div class="right">
            <?php if($_SESSION['authenticated']): ?>
        		  <span>
                <i class="fa fa-user"></i> 
                <?=$_SESSION['fullName'] ?>
                <a href="/logout"><i class="fa fa-sign-out"></i></a>
              </span>
            <?php else: ?>
              <span><a href="/welcome">Login</a></span>
            <?php endif; ?>
        	</div>
        </div>
        <div class="clear"></div>
      </div>
    </div>
    <div class="content">