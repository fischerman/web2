<div class="thread">
	<div class="idea-title">
		<div class="container">
			<h3><i class="fa fa-lightbulb-o"></i> <a href="/idea/<?=$data['thread']['idea'] ?>"><?=$data['thread']['ideaName'] ?></a></h3>
		</div>
	</div>
	<div class="container">
		<div class="thread-title">
			<h1><?=$data['thread']['threadName'] ?></h1>
			<span>Question</span>
		</div>
		<div class="main">
			<div class="posts">
				<?php foreach($data['posts'] as $post): ?>
					<div class="post">
						<h3><?=$post['fullName'] ?> <span class="date">@<?=date('M d, Y', strtotime($post['createdAt'])) ?></span></h3>
						<p><?=$post['content'] ?></p>
					</div>
				<?php endforeach; ?>
			</div>
			<textarea rows="7" placeholder="Join in"></textarea>
		</div>
		<div class="side">
			<div class="thread-statistic">
				<h3>Statistic</h3>
				<div class="statistic-content">
					<ul>
						<li><span>Comments:</span> <?=count($data['posts']) ?></li>
						<li><span>Created by:</span> <?=$data['thread']['fullName']?></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>