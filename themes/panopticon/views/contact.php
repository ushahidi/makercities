<div id="content">
	<div class="content-bg">
		<!-- start contacts block -->
		<div class="big-block">
        <h1><?php echo Kohana::lang('makercities.about.about_maker_cities'); ?></h1>
        <hr />
        <div style="text-align: justify">
        	<?php echo Kohana::lang('makercities.about.maker_cities_description'); ?>
		</div>


        <h1>ABOUT MAKER CITIES</h1>
        <div style="text-align: justify">
<p>Maker Cities is a massively multiplayer game that empowers people to imagine and make the future of their city. </p>

<p>In the game, players submit ideas about how the maker movement might impact society at large: how we learn, govern, eat, and live. Players collaborate to refine each others’ ideas, and make and share simple prototypes to showcase their idea to the world.</p>

<p>Unlike some conventional approaches to thinking about the future that focus only on analytical approaches, Maker Cities allows people to build future ideas together inside a game. Sometimes the best way to imagine creative responses, shift our thinking, rekindle optimism and move towards action is by gaming and having fun and Maker Cities provides a platform for this to happen.</p>

<p>Every idea counts. We hope you will join us.</p>
        </div>



        <h1>ABOUT IFTF</h1>

        <div style="text-align: justify">
        <p>The <a href="http://iftf.org/" target="_blank">Institute for the Future</a> is an independent, nonprofit strategic research group with 45 years of forecasting experience. IFTF works with organizations of all kinds to help them make better, more informed decisions about the future. IFTF provides the foresight to create insights that lead to action.</p>
        <p>We provide our members with insights into business strategy, design process, innovation, and social dilemmas. Our research spans a broad territory of deeply transformative trends, from health and health care to technology, the workplace, and human identity. The Institute for the Future is located in Palo Alto, California.</p>
        </div>



        <h1>TERMS &amp; CONDITIONS</h1>

        <div style="text-align: justify">

<p><b>Public, Sharable, and Reusable</b></p>

<p>Maker Cities is a public good. Everything created or contributed here is added to a public database that can be freely accessed by anyone, anywhere.</p>

<p>Maker Cities operates under principles of the Creative and Science Commons. All content created in Maker Cities is automatically published under the Creative Commons Attribution-Noncommercial-Share Alike 3.0 license.</p>

<p><b>Privacy</b></p>

<p>Our privacy policy is simple. We won’t share your contact or private information with anyone outside the Institute for the Future. IFTF may contact you to alert you to future games, however you are not obliged to participate in any further activity.</p>

<p><b>We may quote you</b></p>

<p>Anything you create on the Maker Cities platform may be quoted in whole or in part in forecasts or future reports by the Institute for the Future. Anything we quote will be attributed to your Maker Cities player name.</p>


       
        </div>


<h1>CREDITS</h1>

        <div style="text-align: justify">

<p>Maker Cities was developed by the <a href="http://iftf.org/" target="_blank">Institute for the Future</a> in collaboration with Dean Putney and SQ Sunseri.</p>



       
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