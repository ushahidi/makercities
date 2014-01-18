<?php
$phases = Array('', 'proposal', 'active', 'certified');
$cat_classes = Array(
	'maker works' => 'maker-works',
	'maker governance' => 'maker-governance',
	'maker neighborhoods' => 'maker-neighborhoods',
	'maker production' => 'maker-production',
	'maker bodies' => 'maker-bodies',
	'maker learning' => 'maker-learning'
);
$main_category = '';
$categories = '';
foreach ($incident_category as $category) {
	$full_category = strtolower(Category_Lang_Model::category_title($category->category_id));
	$real_category = preg_replace("/ level \d/", '', $full_category);
	$main_category = ($cat_classes[$real_category]) ? $cat_classes[$real_category] : $real_category;

	$full_category = str_replace($real_category, $main_category, $full_category);

	$real_category = str_replace('maker ', '', $real_category);

	$full_category = preg_replace("/(level) (\d)/", '\1\2', $full_category);
	$phase = preg_replace("/.*level(\d)/", '\1', $full_category);
	$cur_phase = Kohana::lang('makercities.phases.' . $phases[$phase]);
}

$support_icon_class = '';
if ($logged_in) {
	$support_title = Kohana::lang('makercities.support_icon');

	if ($is_own_future) {
		$support_icon_class = ' voted';
		$support_title = Kohana::lang('makercities.support_icon_own');
	} else if ($already_voted) {
		$support_icon_class = ' voted';
		$support_title = Kohana::lang('makercities.support_icon_already');
	}

} else {
	$support_icon_class = ' voted';
	$support_title = Kohana::lang('makercities.support_icon_login');
}


?>
<div id="main" class="report_detail category-<?php echo $main_category; ?>">
	<h1><?php echo htmlentities($incident_title, ENT_QUOTES, "UTF-8"); ?></h1>

	<div class="future-location" title="<?php echo html::specialchars($incident_location); ?>">
		<span class="city name"><?php echo html::specialchars($city_name); ?> - </span>
		<span class="username"><?php echo Kohana::lang('makercities.submitted_by'); ?> <?php echo html::specialchars($username); ?> <?php echo Kohana::lang('makercities.on'); ?> <?php echo $incident_dateadd; ?></span>
	</div>

		<div class="description">


			<p><?php echo nl2br($incident_description); ?></p>

						<div class="share-icons" data-tooltip="<?php echo Kohana::lang('makercities.social.tooltip'); ?>" data-tooltip-pos="right">
				<a href="<?php echo $facebook_share_link; ?>" target="_blank" class="facebook" title="<?php echo Kohana::lang('makercities.social.facebook.share'); ?>"></a>
				<a href="<?php echo $twitter_share_link; ?>" target="_blank" class="twitter" title="<?php echo Kohana::lang('makercities.social.twitter.share'); ?>"></a>
			</div>
		</div>


<div class="report_row"><p style="color:#ec008a;font-weight:bold;text-transform:uppercase;font-size:18px;">NOW it's your turn...</p></div>

	<?php if (!isset($_COOKIE['hide_phase_tooltips']) && $phase < 4) : ?>
	<div id="phase-tooltips">
	<?php if ($phase == 1) : ?>
		<div class="proposal-tooltip arrow_box bottom"><div class="tooltip-x"></div>If this future intrigues you, click the heart in the circle below to SUPPORT it and help it move on to the REFINE stage!</div>
	<?php elseif ($phase == 2) : ?>
		<div class="active-tooltip arrow_box bottom"><div class="tooltip-x"></div><?php echo Kohana::lang('makercities.phases.active_tooltip'); ?></div>
	<?php elseif ($phase == 3) : ?>
		<div class="active-tooltip arrow_box bottom"><div class="tooltip-x"></div>Create a prototype - a concept image, comic strip, map, video interview, Arduino project, or any kind of made media or object that helps other players better understand this idea!</div>

	<?php endif; ?>


	</div>
	<?php endif; ?>

	<div id="progress"<?php if (isset($_COOKIE['hide_phase_tooltips'])) : ?> class="tooltips"<?php endif; ?>>
		<div class="progress-circle category-<?php echo $main_category; ?> level1<?php if ($phase == 1) : ?> current<?php endif;?>" data-tooltip="<?php echo preg_replace("/<a.*?>(.*?)<\/a>/", "<b>$1</b>", Kohana::lang('makercities.phases.proposal_tooltip')); ?>" data-tooltip-pos="left">
			<div class="phase">1. SUPPORT</div>
			<div>this future</div>
		</div>
		<div class="progress-circle category-<?php echo $main_category; ?> level2<?php if ($phase == 2) : ?> current<?php endif;?>" data-tooltip="<?php echo preg_replace("/<a.*?>(.*?)<\/a>/", "<b>$1</b>", Kohana::lang('makercities.phases.active_tooltip')); ?>" data-tooltip-pos="top">
			<div class="phase">2. REFINE</div>
			<div>Suggest changes</div>
		</div>
		<div class="progress-circle category-<?php echo $main_category; ?> level3<?php if ($phase == 3) : ?> current<?php endif;?>" data-tooltip="Create a prototype - a concept image, comic strip, map, video interview, Arduino project, or any kind of made media or object that helps other players better understand this idea!" data-tooltip-pos="top">
			<div class="phase">3. MAKE</div>
			<div>Prototype</div>
		</div>
	</div>

	<div class="future-box supporters category-<?php echo $main_category; ?>">
		<div class="support-icon<?php echo $support_icon_class; ?>" data-id="<?php echo $incident_id; ?>" title="<?php echo $support_title; ?>"></div>
		<div class="name"><?php echo Kohana::lang('makercities.supporters'); ?></div>
		<div id="support-percentage" data-rating="<?php echo $incident_rating; ?>" data-needed="<?php echo $required_rating; ?>" data-text="<?php echo $rating_text; ?>" title="<?php echo $rating_title; ?>">
			<div class="percentage-bar" style="width: <?php echo $rating_percent; ?>%;"></div>
		</div>
	</div>

	<?php if ($phase_num == 0) : ?>
	<div class="future-box certification daysleft<?php echo $days_left; ?> category-<?php echo $main_category; ?>">
    <div class="certification-icon" data-id="<?php echo $incident_id; ?>"></div>
		<?php echo $supporters_needed; ?>
	</div>
	<?php else : ?>
	<div class="future-box certification category-<?php echo $main_category; ?>">
    <div class="certification-icon" data-id="<?php echo $incident_id; ?>"></div>
		<div class="name smaller"><?php echo Kohana::lang('makercities.certification'); ?></div>
		<div id="certification-percentage" data-rating="<?php echo $certified_count; ?>" data-needed="<?php echo $certified_threshold; ?>" data-text="<?php echo $certification_text; ?>" title="<?php echo $certification_title; ?>">
			<div class="percentage-bar" style="width: <?php echo $certified_percent; ?>%;"></div>
		</div>
	</div>
	<?php endif; ?>

<div class="clearingfix"></div>

	<br>

	<!-- start report description -->
			<div class="report-description-text">
				<!-- start news source link -->
				<?php if( count($incident_news) > 0 ) { ?>
				<div class="credibility">
				<h5><?php echo Kohana::lang('ui_main.reports_news');?></h5>
						<?php
							foreach( $incident_news as $incident_new)
							{
								?>
								<a href="<?php echo $incident_new; ?> " target="_blank"><?php
								echo $incident_new;?></a>
								<br/>
								<?php
							}
				?>
				</div>
				<?php } ?>
				<!-- end news source link -->

				<!-- start additional fields -->
				<?php if(strlen($custom_forms) > 0) { ?>
				<div class="credibility">
				<h5><?php echo Kohana::lang('ui_main.additional_data');?></h5>
				<?php

					echo $custom_forms;

				?>
				<br/>
				</div>
				<?php } ?>
				<!-- end additional fields -->

				<?php if ($features_count)
				{
					?>
					<br /><br /><h5><?php echo Kohana::lang('ui_main.reports_features');?></h5>
					<?php
					foreach ($features as $feature)
					{
						echo ($feature->geometry_label) ?
						 	"<div class=\"feature_label\"><a href=\"javascript:getFeature($feature->id)\">$feature->geometry_label</a></div>" : "";
						echo ($feature->geometry_comment) ?
							"<div class=\"feature_comment\">$feature->geometry_comment</div>" : "";
					}
				}?>
			</div>

		<div class="clearingfix"></div>

		<?php 
		//upload field for make stage
		if ($phase == 3) : ?>

		<div class="description">

			<h3>Make a Protoype!</h3>
			<p>Create a prototype- a concept image, comic strip, map, video interview, arduino project, or any kind of made media or object that helps other players better understand this idea!  Host your project on Flickr, Facebook, YouTube, Vimeo, Instagram, or Instructables, and share the link here!  Submissions will be highlighted on the Maker Cities blog, on Twitter, and more.</p>

			<div id="media-content">
				<div class="item file">
					<input type="text" name="protoype-link" value="Paste your URL here" style="width" />
					<button class="pm">Add prototype</button>
				</div>			
			</div>

		</div>

		<?php endif;?>

		    <?php
		    // if there's media, show it
		    if (
		    	count($incident_photos) > 0 ||
		    	count($incident_videos) > 0 ||
				count($incident_news)   > 0 ||
				strlen($custom_forms)   > 0 ||
				$features_count
		    	) : ?>
		<div class="media">
			<h3><?php echo Kohana::lang('ui_main.media'); ?></h3>

			<?php
			// Action::report_display_media - Add content just above media section
		    Event::run('ushahidi_action.report_display_media', $incident_id);
			?>

			<!-- start report media -->
			<div class="<?php if( count($incident_photos) > 0 || count($incident_videos) > 0){ echo "report-media clearingfix";}?>">
		    <?php
		    // if there are images, show them
		    if( count($incident_photos) > 0 )
		    {
				echo '<div id="report-images">';
				foreach ($incident_photos as $photo)
				{
					echo '<a class="photothumb" rel="lightbox-group1" href="'.$photo['large'].'"><img alt="'.htmlentities($incident_title, ENT_QUOTES, "UTF-8").'" src="'.$photo['thumb'].'"/></a> ';
				};
				echo '</div>';
		    }

		    // if there are videos, show those too
		    if( count($incident_videos) > 0 )
		    {
		      echo '<div id="report-video"><ol>';

	          // embed the video codes
	          foreach( $incident_videos as $incident_video)
	          {
	            echo '<li>';
	            $videos_embed->embed($incident_video,'');
	            echo '</li>';
	          };
	  			echo '</ol></div>';

		    }
		    ?>
			</div>


		</div>
		<?php endif; // media ?>

		<?php
			$comments_header = ($active_allowed) ? Kohana::lang('ui_main.active_comments') : Kohana::lang('ui_main.prototype_comments');
			$comment_class_names = Array();
			if ($proposal_allowed) $comment_class_names[] = 'proposal-allowed';
			if ($active_allowed) $comment_class_names[] = 'active-allowed';
			$comment_class_names = (count($comment_class_names) > 0) ? ' class="' . implode(' ', $comment_class_names) . '"' : '';
		
			if(!$active_allowed) :
		?>

<p style="color: #fff800;">Please log in to support this future!</p>

		<?php else : ?>

		<div id="comments"<?php echo $comment_class_names; ?>>
			<h3><?php echo $comments_header; ?><!-- <a href="javascript:void(0);" id="builds-tutorial-link">(?)</a>--></h3>
			<!-- <div class="builds-tutorial arrow_box top"><?php echo Kohana::lang('ui_main.builds_tutorial'); ?></div> -->
		<?php
            // Action::report_extra - Allows you to target an individual report right after the description
            Event::run('ushahidi_action.report_extra', $incident_id);

			// Filter::comments_block - The block that contains posted comments
			Event::run('ushahidi_filter.comment_block', $comments);
			echo $comments;
		?>

		<?php
			// Filter::comments_form_block - The block that contains the comments form
			Event::run('ushahidi_filter.comment_form_block', $comments_form);
			echo $comments_form;
		?>

		</div>
				<?php endif; ?>

</div>