<div class="box clsbox">
  <div class="box-heading"><span>Featured</span>  Product</div>
  <div class="box-content clearfix">
    <div class="box-product ">
      <?php foreach ($products as $product) { ?>
      <div>
	  <div class="viewHover">
	<div class="viewfront">
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
		
		</div>
		
		<div class="viewback">
		
		<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"></a></div>
      <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"> </a></div>
	   <div class="cart"><input type="button" value="" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
	   
	   </div>
		
		</div>
       <div class="pro-detail"> <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
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
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
       </div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
