<div class="search-sec">
	<div class="container">
		<h2>
			Search results for '<?=$_GET['q'] ?>'
		</h2>
		<?php if(!empty($data['results'])): ?>
			<?php foreach ($data['results'] as $key => $result): ?>
				<div class="result">
					<a href="/idea/<?=$result['ideaId']?>/"><h3><?=$result['ideaName'] ?></h3></a>
					<p>
						<?=$result['description'] ?>
					</p>
				</div>
			<?php endforeach; ?>
		<?php else: ?>
			<div class="data-placeholder">
				No results
			</div>
		<?php endif; ?>
	</div>
</div>