<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
  <title><?php echo html::specialchars($page_title.$site_name); ?></title>
  <script type="text/javascript">
    var siteRoot = '<?php echo url::site();?>';
  </script>
  <?php if (!Kohana::config('settings.enable_timeline')) { ?>
    <style type="text/css">
      #graph{display:none;}
      #map{height:480px;}
    </style>
  <?php } ?>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta charset="UTF-8" />
  <meta http-equiv="Content-Language" content="en_US" />
  <meta name="google" value="notranslate" />
  <?php echo $header_block; ?>
  <!-- Google Analytics -->
  <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-40904769-1', 'makercities.net');
    ga('send', 'pageview');

  </script>
  <!-- END Google Analytics -->
  <script type="text/javascript" src="http://maps.stamen.com/js/tile.stamen.js?v1.2.1"></script>
  <link type="text/css" rel="stylesheet" href="<?php echo url::site();?>themes/panopticon/fonts/stylesheet.css" />
  
  <?php
  // Action::header_scripts - Additional Inline Scripts from Plugins
  Event::run('ushahidi_action.header_scripts');

  // Main page only: Include these styles/scripts
  if (count($uri_segments) == 0)
  {
  //echo html::stylesheet(url::file_loc('css').'media/css/openid', '', TRUE);
  //echo html::script(url::file_loc('js').'media/js/openid/openid-jquery', TRUE);
?>
<link type="text/css" rel="stylesheet" href="<?php echo url::site();?>themes/panopticon/main/_main.css" />
<script type="text/javascript" src="<?php echo url::site();?>themes/panopticon/main/main.js"></script>
<?php
  }

  // Add a class to the body tag according to the page URI

  // we're on the home page
  if (count($uri_segments) == 0)
  {
    $body_class = "page-main";
  }
  // 1st tier pages
  elseif (count($uri_segments) == 1)
  {
    $body_class = "page-".$uri_segments[0];
  }
  // 2nd tier pages... ie "/reports/submit"
  elseif (count($uri_segments) >= 2)
  {
    $body_class = "page-".$uri_segments[0]."-".$uri_segments[1];
  }

  if (count($uri_segments) > 0) { // Not the homepage?
  //if(isset($_GET['panel'])){ // Nope, let's always load it!
    $_GET['panel'] = 1;
?>
<link type="text/css" rel="stylesheet" href="<?php echo url::site();?>themes/panopticon/_panel.css" />
<?php
  }
?>
  <script type="text/javascript">
    function escapeRegExp(str) {
      return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
    }

    siteurl = '<?php echo url::site();?>';
    siteurl = escapeRegExp(siteurl);
    if(window.parent != window.top && !window.location.toString().match(siteurl+'([#](.*)?)?$') && !window.location.toString().match(/[\?\&](panel)/)){
      if(window.location.toString().match(/\?/)){
        window.location = window.location.toString()+'&panel';
      }
      else {
        window.location = window.location.toString()+'?panel';
      }
    }
  </script>
</head>
<body id="page" class="<?php echo $body_class; ?>">
<?php
  $header_file = (count($uri_segments) == 0) ? 'main' : 'page';
  if(isset($_GET['panel'])) $header_file = 'panel';
  include_once('partials/header-' . $header_file . '.php');
?>
