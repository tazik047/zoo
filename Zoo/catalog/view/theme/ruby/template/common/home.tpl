<?php
$start = strpos($header, '<!--header start-->'); 
$end = strpos($header, '<!--header end-->'); 
$new_column_left = str_replace('$column_left', $column_left, substr($header, $start, $end - $start));

echo $new_header = substr($header, 0, $start) . substr($header, $end);
echo $column_right; 
?>
<div id="content"><?php echo $content_top; ?>
<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<?php echo $content_bottom; ?>
</div>
<?php echo $new_column_left?>
<?php echo $footer; ?>
