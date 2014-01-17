<div id="intro">
        <div class="inner">

            <div class="modal intro">
                <div id="modal-x" title="Close the intro">&times;</div>

                <img src="themes/panopticon/images/makerCities_logo_small3.png" class="introLogo">

                <h1>What do <span>YOU</span> think makes a MAKER CITY?</h1>

                <div class="modal-inner">


                    <div id="intro-video">
                        <iframe width="560" height="315" src="//www.youtube.com/embed/5RogBsRlIbM" frameborder="0" allowfullscreen></iframe>
                    </div>

                    <div class="introModalYellowRow">
                      <div class="introModalText">
                        We know that the Maker movement is spilling out of garages and workshops into the streets. Makers aren’t just building stuff anymore. They’re starting to remake the systems that shape our lives&mdash;how we learn, how we govern, how we connect and live together in cities.
                      </div>

                      <img src="themes/panopticon/images/vertical_line.png">

                      <div class="introModalInstructions">

                        <ol>
                          <li>Imagine your future idea</li>
                          <li>Add it to the map</li>
                          <li>Explore and support other player's ideas</li>
                          <li>Learn from feedback and refine</li>
                        </ol>

                        <a href="" class="introModaInstructionsLink">Click for more detailed instructions</a>

                      </div>

                      <a href="http://blog.makercities.net/synchronicity-challenge/" class="introModalWeeklyChallenge">
                        <span class="imwc-topRow">Check out the</span>


                        <span class="imwc-bottomRow">Weekly Challenge</span>
                      </a>

                    </div>

                    <div class="introModalBottom">

                      <div class="introModalCTA">
                        <p>Play the game <span>and</span> make the future</p>

                        <a href="#tutorial" id="introTourLink">Tour the game</a>
                      </div>

                      <div class="introModalLoginBox">
                        <a href="#" class="introModalLoginButton">Register</a>
                        <a href="/login/?newaccount" class="introModalLoginLabel">New User</a>
                        <input type="text" class="loginTextInput"><input type="password" class="loginPasswordInput">
                        <input type="submit" name="submit" value="Login" class="introModalLoginButton">
                        <a href="#action" class="introModalLoginLabel forgotPasswordLink">Forgot your password?</a>

                      </div>
                      <br clear="all">

                    </div>


                </div>


    <?php if (!Auth::instance()->logged_in()) : ?>

                    <div id="register-forgot">
                                
                                  <div class="forgot">
                                          <?php echo form::open('login/'); ?>
                                                  <input type="hidden" name="action" value="forgot" />
                                                  <input type="text" id="resetemail" name="resetemail" class="login_text" value="" placeholder="<?php echo Kohana::lang('makercities.intro.forgot_email'); ?>" />
                                                  <input type="submit" name="submit" value="<?php echo Kohana::lang('ui_main.reset_password'); ?>" class="introModalLoginButton" />
                                          <?php echo form::close(); ?>
                                  </div>
                          </div>
                </div><!-- /.modal.login  -->
                <?php endif; ?>
            </div>
        </div>
    </div>

    <script>
      var $registerForgot = $("#register-forgot");
      var $forgotPasswordLink = $(".forgotPasswordLink");

      $forgotPasswordLink.click(function() {

        if($registerForgot.is(':visible')) {
          $registerForgot.hide();
        } else {
          $registerForgot.show();
        }
      });
    </script>