<div class="home-banner-sec">
  <div class="container">
    <div class="banner-msg">
      <h1>
        Share<br />
        your ideas
      </h1>
      <h2>
        Collaborate with other DHBW members on ideas.
      </h2>
    </div>
    <div class="banner-login">
      <form action="/login" method="POST">
        <?php if(isset($data['loginFailed'])): ?>
          Try again!
        <?php endif; ?>
        <input type="text" name="name" value="" placeholder="DHBW email"/>
        <input type="password" name="password" value="" placeholder="Password"/>
        <input type="submit" value="Sign in"/>
      </form>
    </div>
  </div>
</div>
<div class="home-banner2-sec">
  <div class="container">
    <div class="grid-12">
      <h1><i class="fa fa-lightbulb-o"></i></h1>
    </div>
    <div class="clear"></div>
  </div>
</div>