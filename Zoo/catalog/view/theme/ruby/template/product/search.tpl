<?php /*$_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest'*/ if (!isset($_GET['ajax']) && !isset($_POST['ajax']) && !isset($_SERVER['HTTP_X_REQUESTED_WITH'])) {?>
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
<div id="content" class="search_page"><?php echo $content_top; ?>
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
  
  <b><?php echo $text_critea; ?></b>
  <div class="content">
    <p><?php echo $entry_search; ?>

      <?php if (isset($search) && $search) { ?>
      <input type="text" name="search" value="<?php echo $search; ?>" />
      <?php } else if (isset($search)) { ?>
      <input type="text" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
      <?php } else { ?>
		  <?php if (isset($filter_name)) { ?>
		  <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
		  <?php } else { ?>
		  <input type="text" name="filter_name" value="" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
		  <?php } ?>
      <?php } ?>
	  <?php if (isset($search))	{?>
      <select name="category_id">
        <option value="0"><?php echo $text_category; ?></option>
        <?php foreach ($categories as $category_1) { ?>
        <?php if ($category_1['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_1['children'] as $category_2) { ?>
        <?php if ($category_2['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_2['children'] as $category_3) { ?>
        <?php if ($category_3['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php } ?>
      </select>
     <?php } else { ?>
      <select name="filter_category_id">
        <option value="0"><?php echo $text_category; ?></option>
        <?php foreach ($categories as $category_1) { ?>
        <?php if ($category_1['category_id'] == $filter_category_id) { ?>
        <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_1['children'] as $category_2) { ?>
        <?php if ($category_2['category_id'] == $filter_category_id) { ?>
        <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_2['children'] as $category_3) { ?>
        <?php if ($category_3['category_id'] == $filter_category_id) { ?>
        <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php } ?>
      </select>
      <?php } ?>
      <?php if (isset($sub_category) && $sub_category) { ?>
      <input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
      <?php } else if (isset($sub_category)) { ?>
      <input type="checkbox" name="sub_category" value="1" id="sub_category" />
      <?php } else {?>
		  <?php if (isset($filter_sub_category)) { ?>
		  <input type="checkbox" name="filter_sub_category" value="1" id="sub_category" checked="checked" />
		  <?php } else { ?>
		  <input type="checkbox" name="filter_sub_category" value="1" id="sub_category" />
		  <?php } ?>
	  <?php } ?>	
      <label for="sub_category"><?php echo $text_sub_category; ?></label>
    </p>

    <?php if (isset($description) && $description) { ?>
    <input type="checkbox" name="description" value="1" id="description" checked="checked" />
	<?php } else if (isset($description)) { ?>
    <input type="checkbox" name="description" value="1" id="description" />
    <?php } else { ?>
		<?php if (isset($filter_description)) { ?>
		<input type="checkbox" name="filter_description" value="1" id="description" checked="checked" />
		<?php } else { ?>
		<input type="checkbox" name="filter_description" value="1" id="description" />
		<?php } ?>
	<?php } ?>
    <label for="description"><?php echo $entry_description; ?></label>
  </div>
  <div class="buttons">
    <div class="right"><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" /></div>
  </div>
  <h2 class="margin-bottom"><?php echo $text_search; ?></h2>
  <?php if ($products) { ?>
  <div class="product-grid ">
    <?php $_counter = 0;foreach ($products as $product) { ?>
    <div>
      <?php if ($product['special']) { ?><div class="product_sale"><?php if (isset($_nico_settings['settings']['sale_text']) && !empty($_nico_settings['settings']['sale_text'])) echo $_nico_settings['settings']['sale_text']; 
		else echo 'sale';?></div><?php } ?>
      <?php if ($product['thumb']) { ?>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
      <?php } ?>
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <?php if ($product['price']) { ?>
      <div class="price <?php if ($product['special']) { ?> price_sale<?php }?>">
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
      <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
      <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
      <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>
    </div>
    <?php } ?>
  </div>
    <div class="pagination clearfix"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
<?php echo $content_bottom; ?>
</div>
<?php echo $new_column_left?>
<script type="text/javascript"><!--

$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('#content input[name=\'filter_name\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	if ($('#content input[name=\'search\']').length)
    {
		var search = $('#content input[name=\'search\']').attr('value');
	
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}

		var category_id = $('#content select[name=\'category_id\']').attr('value');
	
		if (category_id > 0) {
			url += '&category_id=' + encodeURIComponent(category_id);
		}
	
		var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');
	
		if (sub_category) {
			url += '&sub_category=true';
		}
		
		var filter_description = $('#content input[name=\'description\']:checked').attr('value');
	
		if (filter_description) {
			url += '&description=true';
		}
    } else 
	{
 
		var filter_name = $('#content input[name=\'filter_name\']').attr('value');
	
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}

		var filter_category_id = $('#content select[name=\'filter_category_id\']').attr('value');
	
		if (filter_category_id > 0) {
			url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
		}
	
		var filter_sub_category = $('#content input[name=\'filter_sub_category\']:checked').attr('value');
	
		if (filter_sub_category) {
			url += '&filter_sub_category=true';
		}
		
		var filter_description = $('#content input[name=\'filter_description\']:checked').attr('value');
	
		if (filter_description) {
			url += '&filter_description=true';
		} 
    }

	location = url;
});
</script>
<?php echo $footer; ?>
<?php } else { echo json_encode($products); }?>
