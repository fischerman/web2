<html>
  <head>
    <link rel="stylesheet" href="/static/css/style.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script src="/static/lib/jquery.min.js"></script>
    <script src="/static/lib/jquery.validate.min.js"></script>
  </head>
  <body>
    <div class="nav-sec">
      <div class="nav-container">
        <div class="nav-in">
        	<div class="left">
        		<h2><a href="/dashboard"><i class="fa fa-exchange"></i> Idea Exchange</a></h2>
              <form method="get" action="/search">
          		  <input class="search" type="text" name="q" placeholder="Suche"/>
              </form>
        	</div>
        	<div class="right">
            <?php if($_SESSION['authenticated']): ?>
              <span>
                <a href="/idea/new">
                  <i class="fa fa-plus"></i>
                </a>&nbsp;
                <a href="/profile">
                  <i class="fa fa-user"></i>
                  <?=$_SESSION['fullName'] ?>
                </a>&nbsp;
                <a href="/logout"><i class="fa fa-sign-out"></i></a>
              </span>
            <?php endif; ?>
        	</div>
        </div>
        <div class="clear"></div>
      </div>
    </div>
    <div class="content">
