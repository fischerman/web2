<div class="new-thread">
	<div class="idea-title">
		<div class="container">
			<h3><i class="fa fa-lightbulb-o"></i> <a href="/idea/<?=$data['idea']['ideaId'] ?>"><?=$data['idea']['ideaName'] ?></a></h3>
		</div>
	</div>
	<div class="container">
		<h2>New topic</h2>
		<form action="#" method="post">
			<input type="text" name="title" placeholder="Title"/>
			<textarea rows="7" name="content" placeholder="Content"></textarea>
			<input type="submit" value="Create topic"/>
		</form>
	</div>
</div>