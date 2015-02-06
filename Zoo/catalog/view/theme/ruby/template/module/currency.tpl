<?php if (count($currencies) > 1) { ?>
<div id="currency">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
<select title="<?php echo $text_currency; ?>" class="drop" id="currency_drop" tabindex="2">
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['code'] == $currency_code) { ?>
    <?php if ($currency['symbol_left']) { ?>
    <option title="<?php echo $currency['title']; ?>" value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['symbol_left']; ?></option>
    <?php } else { ?>
    <option title="<?php echo $currency['title']; ?>" value="<?php echo $currency['code']; ?>" selected="selected"><b><?php echo $currency['symbol_right']; ?></option>
    <?php } ?>
    <?php } else { ?>
    <?php if ($currency['symbol_left']) { ?>
    <option value="<?php echo $currency['code']; ?>" title="<?php echo $currency['title']; ?>"><?php echo $currency['symbol_left']; ?></option>
    <?php } else { ?>
    <option value="<?php echo $currency['code']; ?>" title="<?php echo $currency['title']; ?>"><?php echo $currency['symbol_right']; ?></option>
    <?php } ?>
    <?php } ?>
    <?php } ?>
</select>
<input type="hidden" name="currency_code" value="" />
<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
