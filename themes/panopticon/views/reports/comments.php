<?php
$phase_names = Array('proposal', 'stakeholders', 'logistics', 'roadblocks');
$proposal_class = (!$active_allowed) ? ' class="active"' : '';

?>

<ul id="comment-tabs" class="comment-phases2">
	<li id="tab-proposal"<?php echo $proposal_class; ?>>&#9664; <?php echo Kohana::lang('makercities.phases.proposal'); ?></li>
<?php if ($active_allowed) : ?>
	<li id="tab-active" class="active"><?php echo Kohana::lang('makercities.phases.active'); ?> &#9654;</li>
<?php endif; ?>
</ul>
<div id="proposal-comments" class="report-comments">

	<div class="comment proposal header">
		<div class="meta">
			<span class="name"><?php echo Kohana::lang('makercities.phases.proposal'); ?><span class="count">( <?php echo $comment_count[0]; ?> )</span></span>
		</div>
		<div class="words">
			<?php echo Kohana::lang('makercities.phases.proposal_description'); ?>
		</div>
	</div>

	<?php
	foreach($incident_comments as $comment): 
		if ($comment->comment_phase != 0) continue;
	?>
		<div class="comment proposal">
			<div class="meta">
				<span class="name"><?php echo html::specialchars($comment->comment_author); ?></span>
				<div class="date">
					<?php echo date('M j Y', strtotime($comment->comment_date)); ?><br />
					<?php echo date('g:i A', strtotime($comment->comment_date)); ?>
				</div>
			</div>
			<div class="words">
				<?php echo html::specialchars($comment->comment_description); ?>
			</div>
		</div>
	<?php endforeach; ?>

	<?php if ($comment_count[0] == 0) : ?>
		<div class="comment proposal empty">
			<div class="words"><?php echo Kohana::lang('makercities.comments.no_comments.proposal'); ?></div>
		</div>
	<?php endif; ?>

	<?php echo $forms[0]; ?>

</div>

<?php if($active_allowed): ?>

<div id="active-comments" class="report-comments">

<?php
for ($i = 1; $i <= 3; $i++) :
$current_phase = $phase_names[$i];
?>
<div class="phase">
	<div class="comment <?php echo $current_phase; ?> header">
		<div class="meta">
			<span class="name"><?php echo Kohana::lang('makercities.phases.' . $current_phase); ?><span class="count">( <?php echo $comment_count[$i]; ?> )</span></span>
		</div>
		<div class="words">
			<?php echo Kohana::lang('makercities.phases.' . $current_phase .'_description'); ?>
		</div>
	</div>

	<?php
	foreach($incident_comments as $comment): 
		if ($comment->comment_phase != $i) continue;
	?>
		<div class="comment <?php echo $current_phase; ?>">
			<div class="meta">
				<span class="name"><?php echo html::specialchars($comment->comment_author); ?></span>
				<div class="date">
					<?php echo date('M j Y', strtotime($comment->comment_date)); ?><br />
					<?php echo date('g:i A', strtotime($comment->comment_date)); ?>
				</div>
			</div>
			<div class="words">
				<?php echo html::specialchars($comment->comment_description); ?>
			</div>
		</div>
	<?php endforeach; ?>

	<?php if ($comment_count[$i] == 0) : ?>
		<div class="comment <?php echo $current_phase; ?> empty">
			<div class="words"><?php echo Kohana::lang('makercities.comments.no_comments.' . $current_phase); ?></div>
		</div>
	<?php endif; ?>

	<?php echo $forms[$i]; ?>

	</div>
<?php endfor; ?>

</div>

<?php endif; ?>