<?php 
/**
 * MakerCities view page.
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     API Controller
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>
			<div class="bg">

				<h2>
					<?php admin::settings_subtabs("makercities"); ?>
				</h2>
				<?php print form::open(); ?>
				<div class="report-form">
					<?php
					if ($form_error) {
					?>
						<!-- red-box -->
						<div class="red-box">
							<h3><?php echo Kohana::lang('ui_main.error');?></h3>
							<ul>
							<?php
							foreach ($errors as $error_item => $error_description)
							{
								// print "<li>" . $error_description . "</li>";
								print (!$error_description) ? '' : "<li>" . $error_description . "</li>";
							}
							?>
							</ul>
						</div>
					<?php
					}

					if ($form_saved) {
					?>
						<!-- green-box -->
						<div class="green-box">
							<h3><?php echo Kohana::lang('ui_main.configuration_saved');?></h3>
						</div>
					<?php
					}
					?>				
					<div class="head">
						<h3><?php echo Kohana::lang('settings.sms.title');?></h3>
						<input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings');?>" />
					</div>
					<!-- column -->
		
					<div class="settings_holder">
						<div class="row">
							<h4><?php echo Kohana::lang('makercities.proposal_length');?> 1: <span><?php echo Kohana::lang('makercities.proposal_length_2');?></span></h4>
							<?php print form::input('proposal_length', $form['proposal_length'], ' class="text title_2"'); ?>
						</div>
						<div class="row">
							<h4><?php echo Kohana::lang('makercities.active_threshold');?> 2: <span><?php echo Kohana::lang('makercities.active_threshold_2');?></span></h4>
							<?php print form::input('active_threshold', $form['active_threshold'], ' class="text title_2"'); ?>
						</div>
            <div class="row">
              <h4><?php echo Kohana::lang('makercities.certified_threshold');?> 3: <span><?php echo Kohana::lang('makercities.certified_threshold_2');?></span></h4>
              <?php print form::input('certified_threshold', $form['certified_threshold'], ' class="text title_2"'); ?>
            </div>
            <div class="row">
              <h4><?php echo Kohana::lang('makercities.supporter_value');?> 3: <span><?php echo Kohana::lang('makercities.supporter_value_2');?></span></h4>
              <?php print form::input('supporter_value', $form['supporter_value'], ' class="text title_2"'); ?>
            </div>
            <div class="row">
              <h4><?php echo Kohana::lang('makercities.proposal_comment_value');?> 3: <span><?php echo Kohana::lang('makercities.proposal_comment_value_2');?></span></h4>
              <?php print form::input('proposal_comment_value', $form['proposal_comment_value'], ' class="text title_2"'); ?>
            </div>
            <div class="row">
              <h4><?php echo Kohana::lang('makercities.active_future_comment_value');?> 3: <span><?php echo Kohana::lang('makercities.active_future_comment_value_2');?></span></h4>
              <?php print form::input('active_future_comment_value', $form['active_future_comment_value'], ' class="text title_2"'); ?>
            </div>
            <div class="row">
              <h4><?php echo Kohana::lang('makercities.certified_future_value');?> 3: <span><?php echo Kohana::lang('makercities.certified_future_value_2');?></span></h4>
              <?php print form::input('certified_future_value', $form['certified_future_value'], ' class="text title_2"'); ?>
            </div>
					</div>
		
					<div class="simple_border"></div>
		
					<input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings');?>" />
				</div>
				<?php print form::close(); ?>
			</div>
