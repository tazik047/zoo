<?php echo str_replace('$column_left', $column_left, $header); ?><?php echo $column_right; ?>
<div id="content" class="blog">
	<?php echo $content_top; ?>
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<h2 class="title"><?php echo $title; ?></h2>
	<div class="date"><?php echo $date; ?></div>
	<div class="post"><?php echo $text; ?></div>
	<?php if ($previous_item) { ?>
	<div><a href="<?php echo $previous_item['href']; ?>" title="<?php echo $button_previous_item; ?>"><?php echo $button_previous_item; ?></a></div>
	<?php } ?>
	<?php if ($next_item) { ?>
	<div><a href="<?php echo $next_item['href']; ?>" title="<?php echo $button_next_item; ?>"><?php echo $button_next_item; ?></a></div>
	<?php } ?>
	<?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
