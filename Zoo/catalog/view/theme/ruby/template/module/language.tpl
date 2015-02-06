<?php if (count($languages) > 1) { ?>
<div id="language">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
<select title="<?php echo $text_language; ?>" class="drop" id="language_drop" tabindex="1">
<?php foreach ($languages as $language) { ?>
		<option value="<?php echo $language['code']; ?>" img="image/flags/<?php echo $language['image']; ?>" <?php if ($language_code == $language['code']) echo 'selected="selected"';?>> 
			<?php /*<img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>"> */?>
			<?php echo $language['name']; ?>
		</option>
		<?php } ?>
</select>		
    <input type="hidden" name="language_code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
