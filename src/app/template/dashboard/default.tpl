<div class="dashboard">
	<div class="container">
		<div class="top-banner">
			<div class="message">
				<h2>Share your idea</h2>
			</div>
			<div class="create">
				<input type="button" value="Create"/>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="new-ideas">
			<h2>New ideas</h2>
			<table class="idea-list">
				<tbody>
					<?php foreach ($data["newest_ideas"] as $idea): ?>
						<tr>
							<td class="stat">12<br/>views</td>
							<td class="stat">14<br/>threads</td>
							<td class="stat">7<br/>up</td>
							<td>
								<div class="description">
									<div><a href="/idea/<?=$idea['ideaId']?>"><?=$idea['ideaName'] ?></a></div>
									<div><span>created at <?=date('M d', strtotime($idea['createdAt'])) ?> by</span></div>
								</div>
							</td>
						</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
		</div>
		<div class="hottest-ideas">
			<h2>Hottest ideas</h2>
			<table class="idea-list">
				<tbody>
					<?php foreach ($data["hottest_ideas"] as $idea): ?>
						<tr>
							<td class="stat">12<br/>views</td>
							<td class="stat">14<br/>threads</td>
							<td class="stat">7<br/>up</td>
							<td>
								<div class="description">
									<div><a href="/idea/<?=$idea['ideaId']?>"><?=$idea['ideaName'] ?></a></div>
									<div><span>created at <?=date('M d', strtotime($idea['createdAt'])) ?> by</span></div>
								</div>
							</td>
						</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>