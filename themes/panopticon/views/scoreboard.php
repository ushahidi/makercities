<script type="text/javascript">
$(document).ready(function() {
	$('#info-x, #info-panel', window.top.document).removeClass('loading');

	var categories = [ 'works', 'governance', 'neighborhoods', 'production', 'bodies', 'learning' ],
		catnum = 0;

	$('#all-cities a.city').each(function() {
		$(this).addClass('category-maker-' + categories[catnum]);
		catnum = (catnum < categories.length - 1) ? catnum + 1 : 0;
	});

	$('#all-cities').on('click', 'a.city', function(e) {
		window.top.leaderboardSearch($(this).find('.city-name').text());
		return false;
	});
});
</script>

<div id="content">
	<div id="all-cities" class="content-bg">
		<div class="big-block">
        <h1><?php echo Kohana::lang('makercities.scoreboard.header'); ?></h1>
        <hr />
        <p><?php echo Kohana::lang('makercities.scoreboard.description'); ?></p>
        <?php echo $scoreboard; ?>
		</div>
	</div>
</div>
