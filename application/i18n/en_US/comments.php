<?php
$lang = array(
	'captcha' => array(
		'default' => 'Please enter a valid security code.',
		'required' => 'Please enter the security code.',
		'valid' => 'You entered the wrong security code.',
	) ,
	'comment_author' => array(
		'length' => 'The name field must be at least 3 characters long.',
		'required' => 'The name field is required.',
	) ,
	'comment_description' => array(
		'required' => 'The comments field is required.',
	) ,
	'comment_email' => array(
		'email' => 'The Email field does not appear to contain a valid email address.',
		'length' => 'The Email field must be at least 4 and no more 64 characters long.',
		'required' => 'The Email field is required if the checkbox is checked.',
	),
	'comment_phase' => array(
		'comments_closed' => 'ERROR: Comments are closed.',
		'proposal_closed' => 'ERROR: The proposal period has ended, comments are no longer accepted.',
		'active_closed' => 'ERROR: The active proposal period is not currently enabled, comments are not allowed.',
		'comment_limit' => "ERROR: You've already left a comment for this type.",
	)
);
?>
