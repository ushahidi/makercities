<div id="modal" style="display: none">
	<div class="inner">

    <div class="modal help">

      <div class="helpWindowTop"></div><div class="pad">
         <div class="work section">

          <div class="icon work-imagine"><b><span class="helpWindowNumber">1</span> Imagine + Add</b> Imagine an idea for your city in 2023 and add your future (idea) to the map.</div>
          <div class="icon work-support"><b><span class="helpWindowNumber">2</span> Support</b> Other players support your future and you support others’ futures. After 2 supports, a future moves to the refine stage.</div>
          <div class="icon work-make"><b><span class="helpWindowNumber">3</span> Refine</b> Other players refine your future and you refine others’; after 6 refinement suggestions, a future moves to the make stage.</div>
          <div class="icon work-points"><b><span class="helpWindowNumber">4</span> Make</b> Now anyone can make a prototype (drawing, photo, video) and upload it to the game to help bring any future to life!</div>
          <div class="icon work-start">Be sure to participate in the weekly challenges about the future of coordination, health, and more!</div>
        </div>


      <div class="helpWindowBottom">
        <button id="helpModal-continue" class="btn" data-continue="Play Now">Play Now</button>
      </div>
      </div><div class="helpWindowInfographic"></div>

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