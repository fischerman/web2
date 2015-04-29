<div class="container">
	<h1>Contact</h1>
	<p>
		Gesch&auml;ftsf&uuml;hrer: <br/>
		Bj&ouml;rn Fischer <br/>
		Addresse <br />
	</p>
	<p>
		<h2>Contact service</h2>
		<form id="contact-form">
			<input type="text" placeholder="Name"/>
			<input type="text" placeholder="E-Mail"/>
			<textarea rows="6" placeholder="Put in your message"></textarea>
			<input type="submit" value="Send"/>
		</form>
	</p>
</div>
<script type="text/javascript">
	$('#contact-form').submit(function(event) {
		event.preventDefault();
		alert("Thank you for your message. We will take care of it!");
	});
</script>