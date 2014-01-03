<div id="content">
	<div class="content-bg">
		<!-- start contacts block -->
		<div class="big-block">
        <h1><?php echo Kohana::lang('makercities.about.about_maker_cities'); ?></h1>
        <hr />
        <div style="text-align: justify">
        	<?php echo Kohana::lang('makercities.about.maker_cities_description'); ?>
		</div>

        <h1>About IFTF</h1>
        <hr />
        <div style="text-align: justify">
        <p><a href="http://iftf.org/" target="_blank">The Institute for the Future</a> is an independent, nonprofit strategic research group with 45 years of forecasting experience. The core of our work is identifying emerging trends and discontinuities that will transform global society and the global marketplace.</p>
        <p>We provide our members with insights into business strategy, design process, innovation, and social dilemmas. Our research spans a broad territory of deeply transformative trends, from health and health care to technology, the workplace, and human identity.</p>
        <p>The Institute for the Future is located in Palo Alto, California.</p>
        </div>

      <div id="about">
        <h1>Created by</h1>
        <hr />
        <div class="item category-maker-works">
          <img src="<?php echo url::site();?>/themes/panopticon/images/creator-images/dean.jpg" />
          <h4>Dean Putney</h4>
          Project Management<br/>
          Game Design<br/>
          Software Development
        </div>
        <div class="item category-maker-governance">
          <img src="<?php echo url::site();?>/themes/panopticon/images/creator-images/jason.jpg" />
          <h4>Jason Tester - IFTF</h4>
          Game Design<br/>
          Project Management
        </div>
        <div class="item category-maker-neighborhoods">
          <img src="<?php echo url::site();?>/themes/panopticon/images/creator-images/sq.jpg" />
          <h4>SQ</h4>
          Software Development<br/>
          Design
        </div>
        <div class="item category-maker-production">
          <img src="<?php echo url::site();?>/themes/panopticon/images/creator-images/star.jpg" />
          <h4>Star St. Germain</h4>
          User Interface Design<br/>
          Icon Design
        </div>
        <div class="item category-maker-bodies">
          <img src="<?php echo url::site();?>/themes/panopticon/images/creator-images/nic.jpg" />
          <h4>Nicolas Weidinger - IFTF</h4>
          Icon Design<br/>
          Game Design
        </div>
      </div>
			<div id="contact_us" class="contact">
        		<h1>Contact Us</h1>
        		<hr />
				<?php
				if ($form_error)
				{
					?>
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
					<?php
				}

				if ($form_sent)
				{
					?>
					<!-- green-box -->
					<div class="green-box">
						<h3><?php echo Kohana::lang('ui_main.contact_message_has_send'); ?></h3>
					</div>
					<?php
				}								
				?>
				<?php print form::open(NULL, array('id' => 'contactForm', 'name' => 'contactForm')); ?>
				<div class="report_row">
					<strong><?php echo Kohana::lang('ui_main.contact_name'); ?>:</strong><br />
					<?php print form::input('contact_name', $form['contact_name'], ' class="text"'); ?>
				</div>
				<div class="report_row">
					<strong><?php echo Kohana::lang('ui_main.contact_email'); ?>:</strong><br />
					<?php print form::input('contact_email', $form['contact_email'], ' class="text"'); ?>
				</div>
				<div class="report_row">
					<strong><?php echo Kohana::lang('ui_main.contact_phone'); ?>:</strong><br />
					<?php print form::input('contact_phone', $form['contact_phone'], ' class="text"'); ?>
				</div>
				<div class="report_row">
					<strong><?php echo Kohana::lang('ui_main.contact_subject'); ?>:</strong><br />
					<?php print form::input('contact_subject', $form['contact_subject'], ' class="text"'); ?>
				</div>								
				<div class="report_row">
					<strong><?php echo Kohana::lang('ui_main.contact_message'); ?>:</strong><br />
					<?php print form::textarea('contact_message', $form['contact_message'], ' rows="4" cols="40" class="textarea long" ') ?>
				</div>		
				<div class="report_row">
					<strong><?php echo Kohana::lang('ui_main.contact_code'); ?>:</strong><br />
					<?php print $captcha->render(); ?><br />
					<?php print form::input('captcha', $form['captcha'], ' class="text"'); ?>
				</div>
				<div class="report_row">
					<input name="submit" type="submit" value="<?php echo Kohana::lang('ui_main.contact_send'); ?>" class="btn_submit" />
				</div>
				<?php print form::close(); ?>
			</div>
			
		</div>
		<!-- end contacts block -->
	</div>
</div>