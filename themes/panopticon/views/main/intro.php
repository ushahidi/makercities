<div id="intro">
        <div class="inner">

            <div class="modal intro">
                <div id="modal-x" title="Close the intro">&times;</div>
                <h1>Welcome to Maker Cities!</h1>

                <div class="modal-inner">


                    <div id="intro-video">
                        <iframe width="290" height="163" src="//www.youtube.com/embed/5RogBsRlIbM" frameborder="0" allowfullscreen></iframe>
                    </div>

                    <p>We know that the Maker movement is spilling out of garages and workshops into the streets. Makers aren’t just building stuff anymore. They’re starting to remake the systems that shape our lives&mdash;how we learn, how we govern, and more.</p>
                    <p><b>Compete in weekly challenges</b> co-hosted by major sponsors to come up with cool ideas and make prototypes about the future of the maker movement!</p>

                    <br clear="all">
                </div>


    <?php if (!Auth::instance()->logged_in()) : ?>
                <div class="login">
                    <div class="col1">
                        <button class="welcomePopupButton">Current Challenges</button>
                    </div>
                    <div class="col2">
                        <button class="welcomePopupButton">How to Play</button>
                    </div>
                    <div class="col3">
                        <button class="welcomePopupButton">Login</button>
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