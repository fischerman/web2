<html>
  <head>
    <link rel="stylesheet" href="/css/style.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script src="//localhost:35729/livereload.js"></script>
  </head>
  <body>
    <div class="nav-sec">
      <div class="nav-container">
        <div class="nav-in">
        	<div class="left">
        		<h2><i class="fa fa-exchange"></i> Idea Exchange</h2>
          		<input class="search" type="text" placeholder="Suche"/>
        	</div>
        	<div class="right">
        		<span><i class="fa fa-user"></i> it13131</span>
        	</div>
        </div>
        <div class="clear"></div>
      </div>
    </div>
    <div class="content">
    	<?php
    		include($_GET['page']);
    	?>
    </div>
    <div class="footer-sec">
      <div class="footer-container">
        <div class="footer-grid">
          https://github.com/fischerman/web2
        </div>
      </div>
    </div>
  </body>
</html>