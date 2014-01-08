<div id="intro">
	<div class="inner">
		<div class="modal intro">
      <div id="modal-x" title="Close the intro">&times;</div>
			<h1><?php echo Kohana::lang('makercities.intro.title'); ?></h1>

      <div class="modal-inner">
  			<div id="intro-video">
          <iframe width="580" height="326" src="//www.youtube.com/embed/5RogBsRlIbM" frameborder="0" allowfullscreen></iframe>
  			</div>
        
        <?php echo Kohana::lang('makercities.intro.paragraphs'); ?>

      </div>

    <?php if (!Auth::instance()->logged_in()) : ?>
      <div class="login">
  			<div class="col1">
  				<button id="register-button" class="register"><?php echo Kohana::lang('makercities.intro.register'); ?></button>
  			</div>
  			<div class="col2">
  				<?php echo form::open('login/'); ?>
  				<input type="hidden" name="action" value="signin" />
  				<input class="email" type="text" name="username" value="" placeholder="<?php echo Kohana::lang('ui_main.email'); ?>" />
  				<input class="password" type="password" name="password" value="" placeholder="<?php echo Kohana::lang('ui_main.password'); ?>" />
  				<input class="submit" type="submit" name="submit" value="<?php echo Kohana::lang('ui_main.login'); ?>" />
  				<?php echo form::close(); ?>
  				<a href="#forgot" id="forgot-password-link"><?php echo Kohana::lang('ui_main.forgot_password'); ?></a>
  			</div>
  			<div class="col3">
          <?php if (kohana::config('config.allow_openid') == TRUE): ?>
  				<?php echo form::open('login/', array('id'=>"openid_intro_form")); ?>
            <input type="hidden" name="action" value="openid" />
  					<input type="hidden" name="openid_identifier" value="https://www.google.com/accounts/o8/id" />
  						<?php echo Kohana::lang('makercities.intro.social_login'); ?>
              <div class="openid_buttons">
                <a class="zocial icon facebook" title="Login with Facebook" href="/login/facebook"></a>
                <button class="zocial icon google" title="Login with Google"></button>
              </div>
  				<?php echo form::close(); ?>
          <?php endif; ?>
  			</div>
  			<div id="register-forgot">
  				<div class="register">
  					<?php echo form::open('login?newaccount',  array('id' => "usernew_form")); ?>
  						<input type="hidden" name="action" value="new">
  						<?php print form::input('name', NULL, 'class="login_text new_name" placeholder="' . Kohana::lang('makercities.intro.register_realname') . '"'); ?> 
  						<?php print form::input('email', NULL, 'class="login_text new_email" placeholder="' . Kohana::lang('ui_main.email') . '"'); ?> 
  						<?php print form::password('password', NULL, 'class="login_text new_password" placeholder="' . Kohana::lang('ui_main.password') . '"'); ?>
  						<?php print form::password('password_again', NULL, 'class="login_text new_password_again" placeholder="' . Kohana::lang('ui_main.password_again') . '"'); ?>
  						<input type="submit" id="submit" name="submit" value="<?php echo Kohana::lang('ui_main.login_signup');?>" class="login_btn btn_submit new_submit" />
  					<?php echo form::close(); ?>
  				</div>
  				<div class="forgot">
  					<?php echo form::open('login/'); ?>
  						<input type="hidden" name="action" value="forgot" />
  						<input type="text" id="resetemail" name="resetemail" class="login_text" value="" placeholder="<?php echo Kohana::lang('makercities.intro.forgot_email'); ?>" />
  						<input type="submit" name="submit" value="<?php echo Kohana::lang('ui_main.reset_password'); ?>" class="login_btn btn_submit new_submit" />
  					<?php echo form::close(); ?>
  				</div>
  			</div>
      </div><!-- /.modal.login  -->
    <?php endif; ?>
		</div>

	</div>
</div>