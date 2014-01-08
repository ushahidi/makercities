<?php echo $header_nav; ?>

<!-- wrapper -->
<div class="rapidxwpr floatholder">

  <!-- main body -->
  <div id="middle">
    <!-- <div class="background layoutleft"> -->
      
      <!-- header -->
      <div id="header">

        <!-- logo -->
        <div id="logo">
 					<a href="<?php echo url::site();?>">
						<img src="<?php echo url::site();?>themes/panopticon/images/makerCities_logo_small.png" alt="Maker Cities" style="" />
					</a>

          <div id="tagline"><?php echo $site_tagline; ?></div>
        </div>
        <!-- / logo -->
				<div id="game-controls">
          <a id="tutorial-help" href="#tutorial"><?php echo Kohana::lang('makercities.tutorial_button'); ?></a>
          <a id="how-to-play" href="#how-to-play"><?php echo Kohana::lang('makercities.how_to_play'); ?></a>
					<a id="watchintro" href="#intro"><?php echo Kohana::lang('makercities.intro_button'); ?></a>
				</div>
      </div>
      <!-- / header -->
          <!-- / header item for plugins -->
          <?php
              // Action::header_item - Additional items to be added by plugins
            Event::run('ushahidi_action.header_item');
          ?>

      <!-- mainmenu -->
      <!-- <div id="mainmenu" class="clearingfix">
        <ul>
          <?php nav::main_tabs($this_page); ?>
        </ul>

        <?php if ($allow_feed == 1) { ?>
        <div style="float:right;"><a href="<?php echo url::site(); ?>feed/"><img alt="<?php echo htmlentities(Kohana::lang('ui_main.rss'), ENT_QUOTES); ?>" src="<?php echo url::file_loc('img'); ?>media/img/icon-feed.png" style="vertical-align: middle;" border="0" /></a></div>
        <?php } ?>

      </div> -->
      <!-- / mainmenu -->
      
      <div id="panel-wrapper" class="open">
        <ul id="panel-tabs">
          <li class="panel-about"><a href="#about"><?php echo Kohana::lang('makercities.tab_about'); ?></a></li><li class="panel-scoreboard"><a href="#scoreboard"><?php echo Kohana::lang('makercities.tab_scoreboard'); ?></a></li><li class="panel-pins"><a href="#pins"><?php echo Kohana::lang('makercities.tab_latest'); ?></a></li><li class="panel-submit"><a href="#submit"><?php echo Kohana::lang('makercities.tab_submit'); ?></a></li><li class="panel-info"><div id="info-x"></div><a href="#"><?php echo Kohana::lang('makercities.tab_info'); ?></a></li>
        </ul>
        <div id="submit-panel" class="panel">
          <iframe name="reports" src="<?php echo url::site();?>reports/submit?panel" frameborder="0" ></iframe>
        </div>
        <div id="pins-panel" class="panel">          
          <iframe name="pins" src="<?php echo url::site();?>reports?panel" frameborder="0" ></iframe>
        </div>
        <div id="scoreboard-panel" class="panel">
          <iframe src="<?php echo url::site();?>scoreboard" frameborder="0" ></iframe>
        </div>
        <div id="about-panel" class="panel">
          <iframe src="<?php echo url::site();?>contact?panel" frameborder="0" ></iframe>
        </div>
        <div id="info-panel" class="panel">
          <iframe frameborder="0" ></iframe>
        </div>
      </div>