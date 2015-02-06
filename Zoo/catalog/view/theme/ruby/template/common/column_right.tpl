<?php if (!isset($_REQUEST['ajax'])) {?><?php if ($modules) { ?>
<div id="column-right">
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</div>
<?php } ?>
<?php }?>
