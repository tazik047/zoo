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
<div id="content">
  <?php echo $content_top; ?>
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
	  
	  <?php if ($products) { 
			/*if (!$categories) { ?><div class="clearfix block"><?}*/?>
	  <div class="product-filter">
		<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>	  
		<!-- <div class="display"><a onclick="display('list');"><img src="catalog/view/theme/ruby/image/list.png"></a> <img src="catalog/view/theme/ruby/image/grid.png"></div> -->
		<div class="limit">
		  <select id="limit_select" onchange="location = this.value;" tabindex="3">
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
		  <select id="sort_select" onchange="location = this.value;" tabindex="4">
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
	   <?php }?>
  </div>
  
  <?php if ($thumb || $description) { ?>
	 <div class="category-info clearfix">
		<?php if ($thumb) { ?>
		<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
		<?php } ?>
		<?php if ($description) { ?>
		<?php echo $description; ?>
		<?php } ?>
	  </div>
  <?php } ?>
   
  <?php /*if (!$categories) { ?></div><?} }*/?>
  
  <?php if ($categories) { ?>
  <div class="category-list clearfix">
    <?php if (count($categories) <= 5) { ?>
    <ul>
      <?php foreach ($categories as $category) { ?>
      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
      <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <div class="product-grid clearfix">
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
        <div class="image">
			<div class="mask">
				<div>
				<div>
				<div class="actions">
					<a class="desc_view quickview" href="<?php echo $product['href']; ?>">Предпросмотр</a>
					<a class="desc_cart" onclick="addToCart('<?php echo $product['product_id']; ?>', 1, event);return false;" href="#"><?php echo $button_cart; ?></a>
				</div>
				</div>
				</div>
			</div>
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
      <?php if ($product['price']) { ?>
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <div class="description"><?php if (isset($product['description'])) {?><?php echo $product['description']; ?><?php } ?></div>
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
      <div class="cart">
        <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>', 1, event);return false" class="button" />
      </div>
      <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
      <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>
    </div>
    <?php } ?>
  </div>
  <div class="pagination clearfix"><?php echo $pagination; ?></div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
</div>
<?php echo $new_column_left?>
<?php echo $footer; ?>
</div>
