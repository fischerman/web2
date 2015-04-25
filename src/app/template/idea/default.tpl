<div class="details-sec">
    <div class="container">
      <div class="main">
        <div class="description">
          <h3>Idea Description</h3>
          <div class="details-desc-content">
            <h1><?=$data["idea"]["ideaName"] ?></h1>

            <p>
              <img class="logo" src="/assets/lightbulb.jpg" />
              <?=$data["idea"]["description"] ?>
          	</p>
            <p>
              <a href="#">Make description change proposal</a>
            </p>
          </div>
        </div>
        <div class="discuss">
          <h2>Discuss</h2>
          <?php if(!empty($data['threads'])): ?>
            <table class="threads">
            	<?php foreach($data['threads'] as $thread):  ?>
  	            <tr>
  	              <td class="comments">12</td>
  	              <td class="title"><a href="/thread/<?=$thread['threadId'] ?>"><?=$thread['threadName'] ?></a></td>
  	            </tr>
        	    <?php endforeach; ?>
            </table>
          <?php else: ?>
            <p class="no-topics">No topics created</p>
          <?php endif; ?>
          <a class="button" href="newthread">New topic</a>
        </div>
      </div>
      <div class="side">
        <div class="box">
          <h3>Creator</h3>
          <div class="details-creator-content">
            <ul>
              <li><span>Name:</span> <a href="#"><?=$data["idea"]["userName"]?></a></li>
              <li><span>Faculty:</span> <?=$data["idea"]["faculty"]?></li>
              <li><span>Function:</span> <?=$data["idea"]["function"]?></li>
            </ul>
          </div>
        </div>
        <div class="box">
          <h3>Statistik</h3>
          <div class="details-creator-content">
            <ul>
              <li><span>Views:</span> 13</li>
              <li><span>Discussion:</span> 9</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>