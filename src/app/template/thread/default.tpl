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
			<div class="new-post">
				<form>
					<textarea name="content" rows="7" placeholder="Join in"></textarea>
					<div id="post-options" style="display:none">
						<input type="submit" value="Post"/>
					</div>
				</form>
			</div>
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
<script>
	$(".new-post textarea").focus(function () {
		$("#post-options").show("slow");
	});
	$(".new-post form").submit(function(event) {
		console.log($(".new-post form").serializeArray());
		$.ajax({
			url: "?json",
			method: "POST",
			data: $(".new-post form").serialize()
		})
		.done(function(data) {
			console.log(data);
			$(".posts").append('<div class="post" id="' + data.postId + '" style="display:none"><h3>' + data.fullName + ' <span class="date">@' + data.createdAt + '</span></h3><p>' + data.content + '</p></div>');
			$(".posts #" + data.postId).show("slow");
		});
		$(".new-post form")[0].reset();
		event.preventDefault();
	});
	function resetForm() {

	}
</script>