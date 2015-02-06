<?php
$start = strpos($header, '<!--header start-->'); 
$end = strpos($header, '<!--header end-->'); 
$new_column_left = str_replace('$column_left', $column_left, substr($header, $start, $end - $start));

echo $new_header = substr($header, 0, $start) . substr($header, $end);
echo $column_right; 
?>
<?php 
	if (isset($_SERVER['SCRIPT_FILENAME']))
	{
		$_theme_include_path = dirname($_SERVER['SCRIPT_FILENAME']) . '/catalog/view/theme/ruby/';
	} else if (isset($_SERVER['DOCUMENT_ROOT']))
	{
		$_theme_include_path = $_SERVER['DOCUMENT_ROOT'] . '/catalog/view/theme/ruby/';
	} else $_theme_include_path = dirname(__FILE__) . '/../../';

	include($_theme_include_path . '/nico_theme_editor/settings.inc');
?>  
<div id="content"><?php echo $content_top; ?>
  <div class="clearfix cat-head">
	  <div class="cat-nav">
		  <div class="cat-header clearfix">
		  <div class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php } ?>
		  </div>
			<h1 class="cat_heading"><?php echo $heading_title; ?></h1>
		  </div>
	  </div>
	  
	  <?php /*if ($categories) { ?>
	  <h2 class="cat_refine clearfix"><?php echo $text_refine; ?></h2>
	  <?php } */?>
	  
	  <div class="product-filter">
		<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>	  
		<!-- <div class="display"><a onclick="display('list');"><img src="catalog/view/theme/ruby/image/list.png"></a> <img src="catalog/view/theme/ruby/image/grid.png"></div> -->
		<div class="limit">
		  <select id="limit_select" onchange="location = this.value;">
			<?php foreach ($limits as $limits) { ?>
			<?php if ($limits['value'] == $limit) { ?>
			<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
			<?php } ?>
			<?php } ?>
		  </select>
		</div>
		
		<div class="sort">
		  <select id="sort_select" onchange="location = this.value;">
			<?php foreach ($sorts as $sorts) { ?>
			<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
			<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
			<?php } ?>
			<?php } ?>
		  </select>
		</div>
	   </div>    
  </div>
  
  
  <?php if ($products) { ?>
  <div class="product-grid" style="border-top:none;">
    <?php $_counter = 0;foreach ($products as $product) { ?>
    <div<?php 
				$_counter++;
				$_mod = $_counter % 5;
				if ($_mod == 0) echo ' class="last"';
				if ($_mod == 1) echo ' class="first"';
		?>>
		<span class="description"><?php if (isset($product['description'])) {?><div><?php echo $product['description']; ?></div><?php } ?>
			<a href="#" value="<?php echo $button_cart; ?>" onclick="addToaddToCart('<?php echo $product['product_id']; ?>', 1, event);return false;" class="desc_cart"><?php echo $button_cart; ?></a>
			<a href="<?php echo $product['href']; ?>"  class="desc_view">Details</a>
		</span>
		  <?php if ($product['special']) { ?><div class="product_sale">
					<?php if (isset($_nico_settings['settings']['sale_text']) && !empty($_nico_settings['settings']['sale_text'])) echo $_nico_settings['settings']['sale_text']; 
			else 
			{
				if (!function_exists('toInt')) 
				{
				function toInt($str)
				{
				    if (preg_match("/[0-9]+[.,]?[0-9]+[.,]?[0-9]*/i",  $str, $matches))
				    return (int)$matches[0];
				}
			    }
			    $price = toInt($product['price']);
			    if ($price > 0) echo '-' . round((($price - toInt($product['special'])) / $price) * 100) . '%';
			}?>
		</div>
		<?php } ?>
      <?php if ($product['thumb']) { ?>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
      <?php } ?>
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <?php if ($product['price']) { ?>
      <div class="price<?php if ($product['special']) { ?> price_sale<?php }?>">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($product['rating']) { ?>
      <div class="rating"><img src="catalog/view/theme/ruby/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
      <?php } ?>
      <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>', 1, event);return false;" class="button" /></div>
      <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
      <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>
    </div>
    <?php } ?>
  </div>
  <div class="pagination clearfix"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
</div>
<?php echo $new_column_left?>
<?php echo $footer; ?>
