<div id="content">
	<div class="content-bg">

		<?php if ($site_submit_report_message != ''): ?>
			<div class="green-box" style="margin: 25px 25px 0px 25px">
				<h3><?php echo $site_submit_report_message; ?></h3>
			</div>
		<?php endif; ?>

		<!-- start report form block -->
		<?php print form::open(NULL, array('enctype' => 'multipart/form-data', 'id' => 'reportForm', 'name' => 'reportForm', 'class' => 'gen_forms')); ?>
		<input type="hidden" name="latitude" id="latitude" value="<?php echo $form['latitude']; ?>">
		<input type="hidden" name="longitude" id="longitude" value="<?php echo $form['longitude']; ?>">
		<input type="hidden" name="country_name" id="country_name" value="<?php echo $form['country_name']; ?>" />
		<input type="hidden" name="incident_zoom" id="incident_zoom" value="<?php echo $form['incident_zoom']; ?>" />
		<input type="hidden" name="future_category" id="future_category" value="<?php echo Kohana::lang('makercities.categories.maker-works'); ?>" />
		<input type="hidden" name="form_id" id="form_id" value="<?php echo $id?>">
		<?php //Event::run('ushahidi_action.report_form_location', $id); ?>
		<input id="location_name" name="location_name" type="hidden" value="<?php echo Kohana::lang('makercities.reports_location_name'); ?>" />

		<div class="big-block">


				<div class="submit report_row">
					<h2 class="center"><?php echo Kohana::lang('makercities.reg_or_login'); ?></h2>
				</div>


	<?php if ($logged_in) : ?>
			<h1><?php echo Kohana::lang('ui_main.reports_submit_new'); ?></h1>
      <hr>
      <p><?php echo Kohana::lang('makercities.submit_description'); ?>
			<?php if ($form_error): ?>
			<!-- red-box -->
			<div class="red-box">
				<h3>Error!</h3>
				<ul>
					<?php
						foreach ($errors as $error_item => $error_description)
						{
							print (!$error_description) ? '' : "<li>" . $error_description . "</li>";
						}
					?>
				</ul>
			</div>
			<?php endif; ?>
				<div class="report_row">
          <div id="category-select">
            <ul id="category-tabs">
              <li id="tab-maker-works" class="active" title="<?php echo Kohana::lang('makercities.categories.maker-works'); ?>"></li>
              <li id="tab-maker-governance" title="<?php echo Kohana::lang('makercities.categories.maker-governance'); ?>"></li>
              <li id="tab-maker-neighborhoods" title="<?php echo Kohana::lang('makercities.categories.maker-neighborhoods'); ?>"></li>
              <li id="tab-maker-production" title="<?php echo Kohana::lang('makercities.categories.maker-production'); ?>"></li>
              <li id="tab-maker-bodies" title="<?php echo Kohana::lang('makercities.categories.maker-bodies'); ?>"></li>
              <li id="tab-maker-learning" title="<?php echo Kohana::lang('makercities.categories.maker-learning'); ?>"></li>
            </ul>
            <div id="category-descriptions">
              <div id="category-maker-works" class="pane active">
                <h4><?php echo Kohana::lang('makercities.categories.maker-works'); ?></h4>
                <p><?php echo Kohana::lang('makercities.categories.maker-works_description'); ?></p>
              </div>
              <div id="category-maker-governance" class="pane">
                <h4><?php echo Kohana::lang('makercities.categories.maker-governance'); ?></h4>
                <p><?php echo Kohana::lang('makercities.categories.maker-governance_description'); ?></p>
              </div>
              <div id="category-maker-neighborhoods" class="pane">
                <h4><?php echo Kohana::lang('makercities.categories.maker-neighborhoods'); ?></h4>
                <p><?php echo Kohana::lang('makercities.categories.maker-neighborhoods_description'); ?></p>
              </div>
              <div id="category-maker-production" class="pane">
                <h4><?php echo Kohana::lang('makercities.categories.maker-production'); ?></h4>
                <p><?php echo Kohana::lang('makercities.categories.maker-production_description'); ?></p>
              </div>
              <div id="category-maker-bodies" class="pane">
                <h4><?php echo Kohana::lang('makercities.categories.maker-bodies'); ?></h4>
                <p><?php echo Kohana::lang('makercities.categories.maker-bodies_description'); ?></p>
              </div>
              <div id="category-maker-learning" class="pane">
                <h4><?php echo Kohana::lang('makercities.categories.maker-learning'); ?></h4>
                <p><?php echo Kohana::lang('makercities.categories.maker-learning_description'); ?></p>
              </div>
            </div>
          </div>
      			</div>
				<div class="report_row">
					<?php if(count($forms) > 1): ?>
					<div class="row">
						<h4><span><?php echo Kohana::lang('ui_main.select_form_type');?></span>
						<span class="sel-holder">
							<?php print form::dropdown('form_id', $forms, $form['form_id'],
						' onchange="formSwitch(this.options[this.selectedIndex].value, \''.$id.'\')"') ?>
						</span>
						<div id="form_loader" style="float:left;"></div>
						</h4>
					</div>
					<?php endif; ?>
					<?php print form::input('incident_title', Kohana::lang('ui_main.reports_title'), ' class="text long" maxlength="200" data-required="1" data-minlength="3" ' . $disabled); ?>
				</div>
        
        
				<div class="report_row report-findlocation">
					<?php print form::input('location_find', '', ' title="'.Kohana::lang('ui_main.location_example').'" class="findtext" ' . $disabled); ?>
					<div id="find_loading" class="report-find-loading"></div>
					<input type="button" name="button" id="button" value="<?php echo Kohana::lang('ui_main.find_location'); ?>" class="btn_find" <?php echo $disabled?> />

					<div id="find-popup" class="arrow_box top"><?php echo Kohana::lang('ui_main.pinpoint_location'); ?>.</div>
				</div>
        
        
				<div class="report_row">
					<?php print form::textarea('incident_description', Kohana::lang('ui_main.reports_description'), ' rows="10" class="textarea long" data-required="1" ' . $disabled) ?>
				</div>
				<div class="report_row" id="datetime_default" style="display:none">
					<h4>
						<a href="#" id="date_toggle" class="show-more"><?php echo Kohana::lang('ui_main.modify_date'); ?></a>
						<?php echo Kohana::lang('ui_main.date_time'); ?>: 
						<?php echo Kohana::lang('ui_main.today_at')." "."<span id='current_time'>".$form['incident_hour']
							.":".$form['incident_minute']." ".$form['incident_ampm']."</span>"; ?>
						<?php if($site_timezone): ?>
							<small>(<?php echo $site_timezone; ?>)</small>
						<?php endif; ?>
					</h4>
				</div>
				<div class="report_row hide" id="datetime_edit">
					<div class="date-box">
						<h4><?php echo Kohana::lang('ui_main.reports_date'); ?></h4>
						<?php print form::input('incident_date', $form['incident_date'], ' class="text short"'); ?>
						<script type="text/javascript">
							$().ready(function() {
								$("#incident_date").datepicker({ 
									showOn: "both", 
									buttonImage: "<?php echo url::file_loc('img'); ?>media/img/icon-calendar.gif", 
									buttonImageOnly: true 
								});
							});
						</script>
					</div>
					<div class="time">
						<h4><?php echo Kohana::lang('ui_main.reports_time'); ?></h4>
						<?php
							for ($i=1; $i <= 12 ; $i++)
							{
								// Add Leading Zero
								$hour_array[sprintf("%02d", $i)] = sprintf("%02d", $i);
							}
							for ($j=0; $j <= 59 ; $j++)
							{
								// Add Leading Zero
								$minute_array[sprintf("%02d", $j)] = sprintf("%02d", $j);
							}
							$ampm_array = array('pm'=>'pm','am'=>'am');
							print form::dropdown('incident_hour',$hour_array,$form['incident_hour']);
							print '<span class="dots">:</span>';
							print form::dropdown('incident_minute',$minute_array,$form['incident_minute']);
							print '<span class="dots">:</span>';
							print form::dropdown('incident_ampm',$ampm_array,$form['incident_ampm']);
						?>
						<?php if ($site_timezone != NULL): ?>
							<small>(<?php echo $site_timezone; ?>)</small>
						<?php endif; ?>
					</div>
					<div style="clear:both; display:block;" id="incident_date_time"></div>
				</div>

					<!-- Adding event for endtime plugin to hook into -->
				<?php Event::run('ushahidi_action.report_form_frontend_after_time'); ?>



				<?php
				// Action::report_form - Runs right after the report categories
				Event::run('ushahidi_action.report_form');
				?>

				<?php echo $custom_forms ?>

<?php /*
				<div class="report_optional">
					<h3><?php echo Kohana::lang('ui_main.reports_optional'); ?></h3>
					<div class="report_row">
						<h4><?php echo Kohana::lang('ui_main.reports_first'); ?></h4>
						<?php print form::input('person_first', $form['person_first'], ' class="text long"'); ?>
					</div>
					<div class="report_row">
						<h4><?php echo Kohana::lang('ui_main.reports_last'); ?></h4>
						<?php print form::input('person_last', $form['person_last'], ' class="text long"'); ?>
					</div>
					<div class="report_row">
						<h4><?php echo Kohana::lang('ui_main.reports_email'); ?></h4>
						<?php print form::input('person_email', $form['person_email'], ' class="text long"'); ?>
					</div>
					<?php
					// Action::report_form_optional - Runs in the optional information of the report form
					Event::run('ushahidi_action.report_form_optional');
					?>
				</div> 
*/?>
				<div class="add_media report_row">
					<h1><?php echo Kohana::lang('makercities.add_media'); ?></h1>
				</div>

				<div class="report_row">
					<?php echo Kohana::lang('makercities.media_description'); ?>
				</div>

				<div id="media-select">
					<ul id="media-tabs">
						<li id="tab-photo" class="active"><?php echo Kohana::lang('makercities.media_photo'); ?></li>
						<li id="tab-video"><?php echo Kohana::lang('makercities.media_video'); ?></li>
						<li id="tab-press"><?php echo Kohana::lang('makercities.media_news'); ?></li>
					</ul>

					<div id="media-content">
						<div id="media-photo" class="pane active">
							<div class="item file">
								<div class="upload-button">
									<?php echo Kohana::lang('makercities.media_browse'); ?>
									<?php print form::upload('incident_photo[]', '', ' class="hidden-file"'); ?>
								</div>
								<div class="upload-file"></div>
								<button class="pm plus"></button>
							</div>
							<?php print form::input(array('name'=>'photo_id','type'=>'hidden','id'=>'photo_id'), 0); ?>
						</div>
						<div id="media-video" class="pane">
							<div class="item">
								<?php print form::input('incident_video[]', Kohana::lang('makercities.video_url'), ' class="text"' . $disabled); ?>
								<button class="pm plus"></button>
							</div>
							<?php print form::input(array('name'=>'video_id','type'=>'hidden','id'=>'video_id'), 0); ?>
							<?php Event::run('ushahidi_action.report_form_after_video_link'); ?>
						</div>
						<div id="media-press" class="pane">
							<div class="item">
								<?php print form::input('incident_news[]', Kohana::lang('makercities.article_url'), ' class="text"' . $disabled); ?>
								<button class="pm plus"></button>
							</div>
							<?php print form::input(array('name'=>'news_id', 'type'=>'hidden', 'id'=>'news_id'), 0); ?>
						</div>
					</div>

				</div>

				<?php if ($logged_in) : ?>
				<div id="submitErrors" class="report_row"></div>

				<div class="submit report_row">
					<input name="submit" type="submit" value="<?php echo Kohana::lang('makercities.reports_btn_submit'); ?>" class="btn_submit" /> 
				</div>

				<?php endif; ?>
			</div>

		<?php endif; ?>
		</div>
		<?php print form::close(); ?>
		<!-- end report form block -->
</div>
