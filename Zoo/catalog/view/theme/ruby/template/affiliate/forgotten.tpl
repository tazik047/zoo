<?php
$start = strpos($header, '<!--header start-->'); 
$end = strpos($header, '<!--header end-->'); 
$new_column_left = str_replace('$column_left', $column_left, substr($header, $start, $end - $start));

echo $new_header = substr($header, 0, $start) . substr($header, $end);
echo $column_right; 
?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <p><?php echo $text_email; ?></p>
    <h2><?php echo $text_your_email; ?></h2>
    <div class="content">
      <table class="form">
        <tr>
          <td><?php echo $entry_email; ?></td>
          <td><input type="text" name="email" value="" /></td>
        </tr>
      </table>
    </div>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="right">
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
    </div>
  </form>
  </div>
<?php echo $new_column_left?>
<?php echo $footer; ?>
