<?php if ( $user ) : ?>
<!-- start submit comments block -->
<div class="comment-block comment-phase-<?php echo $form['comment_phase']; ?>">

	<?php print form::open(NULL, array('id' => 'commentForm-phase' . $form['comment_phase'], 'name' => 'commentForm')); ?>
		<?php print form::textarea(array('id' => 'comment_description_phase' . $form['comment_phase'], 'name' => 'comment_description'), $form['comment_description'], ' rows="1" cols="40" class="textarea long" placeholder="' . Kohana::lang('makercities.comments.leave_comment') . '" ') ?>
		<div class="clearingfix"></div>
	<?php
	// Action::comments_form - Runs right before the end of the comment submit form
	Event::run('ushahidi_action.comment_form');
	?>
		<input type="hidden" name="comment_phase" value="<?php echo $form['comment_phase']; ?>" />
		<input name="submit" type="submit" value="<?php echo Kohana::lang('ui_main.comment'); ?>" class="btn_submit" />
	<?php print form::close(); ?>
	
</div>
<div class="clearingfix"></div>
<!-- end submit comments block -->
<?php else : ?>
<div class="comment-block">
	<textarea name="comment_description" rows="1" cols="40" class="textarea long" disabled="disabled"><?php echo Kohana::lang('makercities.comments.login_comment'); ?></textarea>
	<div class="clearingfix"></div>
</div>
<?php endif; ?>