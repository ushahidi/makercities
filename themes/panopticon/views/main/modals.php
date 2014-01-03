<div id="modal" style="display: none">
	<div class="inner">

    <div class="modal help">
      <div class="pad">
<?php

// Look up "Help" page in DB and display that, otherwise fallback to the original
$help_page = ORM::factory('page')->where('page_tab', 'help')->find();
if ($help_page->loaded) {
  echo $help_page->page_description;
} else {
?>
         <div class="work section">
          <h1><?php echo Kohana::lang('makercities.modal.make_the_future'); ?></h1>

          <div class="icon work-imagine"><b>Imagine</b> an idea for your city in 2023 and plot it on the Maker Cities map.</div>
          <div class="icon work-support">Other players will give you <b>constructive feedback</b> about how to make your idea happen!</div>
          <div class="icon work-make">Once you get enough feedback, <b>MAKE</b> and share something to demonstrate your indea to get people excited about talking!</div>
          <div class="icon work-points">Engage in <b>weekly challenges</b> about the future of transportation, health, and other exciting topics!</div>
          <div class="no-icon work-start"><b>START</b> by exploring the map, Get inspired by ideas that other players have added!</div>
        </div>
<?php } ?>
      </div>

      <div class="bottom">
        <button id="helpModal-continue" class="btn" data-continue="<?php echo Kohana::lang('makercities.modal.submit_title'); ?>"><?php echo Kohana::lang('makercities.modal.submit_title'); ?></button>
      </div>
    </div><!-- /.modal.help  -->

		<div class="modal submit">
      <div class="modal-x" title="Close this"></div>
			<h1 class="checkmark"><?php echo Kohana::lang('makercities.modal.submit_title'); ?></h1>

      <p><?php echo Kohana::lang('makercities.modal.submit_message'); ?></p>

      <button class="btn close">Okay</button>

      <div class="phases">
        <div class="phase unlocked"><?php echo Kohana::lang('makercities.phases.proposal'); ?></div>
        <div class="phase locked"><?php echo Kohana::lang('makercities.phases.active'); ?></div>
        <div class="phase locked"><?php echo Kohana::lang('makercities.phases.certified'); ?></div>
      </div>

      <div class="share">
        <h1><?php echo Kohana::lang('makercities.social.share'); ?></h1>
        <div class="share-icons">
          <a href="http://www.facebook.com/sharer.php?u=http%3A%2F%2F<?php echo $_SERVER['HTTP_HOST']; ?>%2F%23reports%2Fview%2F0" target="_blank" class="facebook" title="Share to Facebook"></a>
          <a href="https://twitter.com/intent/tweet?text=Check+out+this+Future%21+http%3A%2F%2F<?php echo $_SERVER['HTTP_HOST']; ?>%2F%23reports%2Fview%2F0+%23MakerCities" target="_blank" class="twitter" title="Share to Twitter"></a>
        </div>
      </div>

    </div><!-- /.modal.submit  -->

	</div>
</div>