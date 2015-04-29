<div class="new-idea">
	<div class="container">
		<form id="new-idea-form" action="#" method="post">
			<input type="text" name="name" placeholder="Idea name"/>
			<textarea rows="10" name="description" placeholder="Put in your description here"></textarea>
			<input type="submit" value="Create">
		</form>
	</div>
</div>
<script type="text/javascript">
	$('#new-idea-form').validate({
		rules: {
			name: "required",
			description: "required"
		}
	});
</script>