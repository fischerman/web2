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
<div class="home-explanation-sec">
  <div class="container">
    <div class="explanation-tile">
      <i class="fa fa-cube"></i>
      <h1>Share your own idea.</h1>
      <p>Have an idea and need help with it? Find people to support you and your idea</p>
    </div>
    <div class="explanation-tile">
      <i class="fa fa-cube"></i>
      <h1>Help others</h1>
      <p>Got some free time? Contribute to others ideas. Discuss about certain aspects or start working on an implementation.</p>
    </div>
    <div class="explanation-tile">
      <i class="fa fa-cube"></i>
      <h1>Get inspired</h1>
      <p>Browse on ideas and find out what people are thinking about.</p>
    </div>
    <div class="explanation-tile">
      <i class="fa fa-cube"></i>
      <h1>Collaborate with other students</h1>
      <p>Use this plattform to collaborate in a team.</p>
    </div>
  </div>
</div>