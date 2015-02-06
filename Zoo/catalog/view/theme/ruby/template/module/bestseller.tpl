<?php 
if (isset($_SERVER['SCRIPT_FILENAME']))
{
	$_theme_include_path = dirname($_SERVER['SCRIPT_FILENAME']) . '/catalog/view/theme/ruby/';
} else if (isset($_SERVER['DOCUMENT_ROOT']) && file_exists($_SERVER['DOCUMENT_ROOT'] . '/catalog/view/theme/ruby/'))
{
	$_theme_include_path = $_SERVER['DOCUMENT_ROOT'] . '/catalog/view/theme/ruby/';
}	
else $_theme_include_path = dirname(__FILE__) . '/../../';

include($_theme_include_path . '/nico_theme_editor/settings.inc');
?>
<div class="box clearfix">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div>
		<?php if ($product['special']) { ?><div class="product_sale">
			<?php if (isset($_nico_settings['settings']['sale_text']) && !empty($_nico_settings['settings']['sale_text'])) echo $_nico_settings['settings']['sale_text']; 
			else 
			{
			    if (!function_exists('toInt')) 
			    {
				function toInt($str)
				{
				    return (int)preg_replace("/([^0-9\\.])/i", "", $str);
				}
			    }
			    echo '-' . round(((toInt($product['price']) - toInt($product['special'])) / toInt($product['price'])) * 100) . '%';
			}?>
		</div><?php } ?>		
        <?php if ($product['thumb']) { ?>
        <div class="image">
			<div class="mask">
				<div>
				<div>
				<div class="actions">
					<a class="desc_view ajax_right" href="<?php echo $product['href']; ?>">Quickview</a>
					<a class="desc_cart" onclick="addToCart('<?php echo $product['product_id']; ?>', 1, event);return false;" href="#"><?php echo $button_cart; ?></a>
				</div>
				</div>
				</div>
			</div>
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <div class="description"><?php if (isset($product['description'])) {?><?php echo $product['description']; ?><?php } ?></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/ruby/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>', 1, event);return false;" class="button" /></div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
