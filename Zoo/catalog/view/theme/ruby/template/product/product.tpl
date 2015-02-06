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
}	
else $_theme_include_path = dirname(__FILE__) . '/../../';

include($_theme_include_path . '/nico_theme_editor/settings.inc');
include($_theme_include_path . '/nico_theme_editor/nico_config.inc');

if (isset($_nico_settings['sliders']['Product page']['active']))
{
	$_nico_active = $_nico_settings['sliders']['Product page']['active'];
}
?>
<div id="content" class="clearfix"><?php echo $content_top; ?>

   <div class="breadcrumb product-breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <div class="product-info clearfix<?php if (isset($_nico_settings['settings']['thumbs_location']) && $_nico_settings['settings']['thumbs_location'] == 'left') { ?> left_thumb<?php } ?>">
	      <?php if ($thumb || $images) { ?>
			<div class="left">



<?php
if (!isset($_nico_active) || $_nico_active == 'Cloud zoom') 
{?>
		<link href="catalog/view/theme/ruby/js/cloud-zoom.css" rel="stylesheet" type="text/css" />
		<script src="catalog/view/theme/ruby/js/cloud-zoom.1.0.3.js" type="text/javascript"></script>		
		<script>
		$(document).ready(function() {
		$.fn.CloudZoom.defaults = {
			zoomWidth:"<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['zoomWidth']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['zoomWidth'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['Width of the zoom window']['default'];
			 /*Width of the zoom window auto*/
			 ?>",
			zoomHeight:"<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['zoomHeight']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['zoomHeight'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['Height of the zoom window']['default'];
			 /*Height of the zoom window auto*/
			 ?>",
			position:"<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['position']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['position'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['Position']['default'];
			 /*Position right*/
			 ?>",
			adjustX:<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['adjustX']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['adjustX'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['X position']['default'];
			 /*X position 0*/
			 ?>,
			adjustY:<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['adjustY']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['adjustY'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['Y position']['default'];
			 /*Y position 0*/
			 ?>,
			adjustY:"<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['adjustY']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['adjustY'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['Tint color']['default'];
			 /*Tint color */
			 ?>",
			tintOpacity:<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['tintOpacity']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['tintOpacity'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['Tint opacity']['default'];
			 /*Tint opacity 0.5*/
			 ?>,
			lensOpacity:<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['lensOpacity']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['lensOpacity'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['Lens opacity']['default'];
			 /*Lens opacity 0.5*/
			 ?>,
			titleOpacity:<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['titleOpacity']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['titleOpacity'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['Soft focus']['default'];
			 /*Soft focus 0.5*/
			 ?>,
			smoothMove:<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['smoothMove']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['smoothMove'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['Smooth move']['default'];
			 /*Smooth move 3*/
			 ?>,
			showTitle:<?php
			 if (isset($_nico_settings['sliders']['Product page']['Cloud zoom']['showTitle']))
			 echo $_nico_settings['sliders']['Product page']['Cloud zoom']['showTitle'];
			 else echo $nico_sliders['Product page']['Cloud zoom']['Show title']['default'];
			 /*Show title true*/
			 ?>};			
		
		     $('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
			});
		</script>
		
		  <?php
		  if (!$thumb) 
		  { 
			  $image= current($images); 
			  $popup = $image['popup'];
			  $heading_title = '';
			  if (isset($image['heading_title'])) $heading_title = $image['heading_title'];
			  $thumb = $image['popup'];
		  }?>
		  <div class="image"><a class="cloud-zoom" rel="adjustX:0, adjustY:0" id='zoom1' href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
		  <?php if ($images) { ?>
		  <div class="image-additional">
			<?php foreach ($images as $image) { ?>
			<a href="<?php echo $image['popup']; ?>" 
			class="cloud-zoom-gallery"
			rel="useZoom: 'zoom1', smallImage: '<?php echo $image['popup']; ?>'"
			title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
			<?php } ?>
			<a href="<?php echo $popup; ?>" 
			class="cloud-zoom-gallery"
			rel="useZoom: 'zoom1', smallImage: '<?php echo $popup; ?>'"
			title="<?php echo $heading_title; ?>"><img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
		  </div>
		  <?php } ?><?php 
}
  else if($_nico_settings['sliders']['Product page']['active'] == 'Flexslider')
{?>
				<div id="slider" class="flexslider">
				  <ul class="slides">
				  <?php $images_count= 0;if ($images) foreach ($images as $image) {  $images_count++?>
					<li class="gallery_image">
						<img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
					</li>
					<?php }?>
				  </ul>
				</div>
				<div id="carousel" class="flexslider">
				  <ul class="slides">
				  <?php if ($images && $images_count > 1) foreach ($images as $image) {  ?>
					<li class="gallery_image">
						<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
					</li>
					<?php }?>
				  </ul>
				</div>	
					<link rel="stylesheet" type="text/css" href="catalog/view/theme/ruby/stylesheet/flexslider.css"/>
					<!-- script src="catalog/view/theme/ruby/js/jquery.easing.1.3.js"  type="text/javascript"></script -->
					<script src="catalog/view/theme/ruby/js/jquery.flexslider.js" type="text/javascript"></script>
						<script type="text/javascript">
						 $(document).ready( function(){	
							 
								  // The slider being synced must be initialized first
								  $('#carousel').flexslider({
									animation:"<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['animation']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['animation'];
									 else echo $nico_sliders['Product page']['Flexslider']['Animation type']['default'];
									 /*Animation type slide*/
									 ?>",
									easing:"<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['easing']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['easing'];
									 else echo $nico_sliders['Product page']['Flexslider']['Easing animation']['default'];
									 /*Easing animation */
									 ?>",
									direction:"<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['direction']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['direction'];
									 else echo $nico_sliders['Product page']['Flexslider']['Direction']['default'];
									 /*Direction horizontal*/
									 ?>",
									startAt:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['startAt']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['startAt'];
									 else echo $nico_sliders['Product page']['Flexslider']['Start at']['default'];
									 /*Start at 0*/
									 ?>,
									initDelay:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['initDelay']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['initDelay'];
									 else echo $nico_sliders['Product page']['Flexslider']['Initial delay (miliseconds)']['default'];
									 /*Initial delay (miliseconds) 0*/
									 ?>,
									slideshowSpeed:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['slideshowSpeed']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['slideshowSpeed'];
									 else echo $nico_sliders['Product page']['Flexslider']['Slideshow speed']['default'];
									 /*Slideshow speed 7000*/
									 ?>,
									animationSpeed:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['animationSpeed']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['animationSpeed'];
									 else echo $nico_sliders['Product page']['Flexslider']['Animation speed']['default'];
									 /*Animation speed 600*/
									 ?>,
									prevText:"<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['prevText']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['prevText'];
									 else echo $nico_sliders['Product page']['Flexslider']['Previous text']['default'];
									 /*Previous text Previous*/
									 ?>",
									nextText:"<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['nextText']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['nextText'];
									 else echo $nico_sliders['Product page']['Flexslider']['Next text']['default'];
									 /*Next text Next*/
									 ?>",
									pauseText:"<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['pauseText']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['pauseText'];
									 else echo $nico_sliders['Product page']['Flexslider']['Pause text']['default'];
									 /*Pause text Pause*/
									 ?>",
									playText:"<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['playText']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['playText'];
									 else echo $nico_sliders['Product page']['Flexslider']['Play text']['default'];
									 /*Play text Play*/
									 ?>",
									pausePlay:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['pausePlay']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['pausePlay'];
									 else echo $nico_sliders['Product page']['Flexslider']['Show pause/play']['default'];
									 /*Show pause/play false*/
									 ?>,
									controlNav:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['controlNav']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['controlNav'];
									 else echo $nico_sliders['Product page']['Flexslider']['Show navigation control']['default'];
									 /*Show navigation control true*/
									 ?>,
									slideshow:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['slideshow']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['slideshow'];
									 else echo $nico_sliders['Product page']['Flexslider']['Slideshow']['default'];
									 /*Slideshow true*/
									 ?>,
									animationLoop:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['animationLoop']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['animationLoop'];
									 else echo $nico_sliders['Product page']['Flexslider']['Animation loop']['default'];
									 /*Animation loop true*/
									 ?>,
									randomize:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['randomize']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['randomize'];
									 else echo $nico_sliders['Product page']['Flexslider']['Randomize']['default'];
									 /*Randomize false*/
									 ?>,
									smoothHeight:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['smoothHeight']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['smoothHeight'];
									 else echo $nico_sliders['Product page']['Flexslider']['Smooth height']['default'];
									 /*Smooth height true*/
									 ?>,
									useCSS:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['useCSS']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['useCSS'];
									 else echo $nico_sliders['Product page']['Flexslider']['Use CSS3 transitions if available']['default'];
									 /*Use CSS3 transitions if available true*/
									 ?>,
									pauseOnHover:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['pauseOnHover']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['pauseOnHover'];
									 else echo $nico_sliders['Product page']['Flexslider']['Pause on hover']['default'];
									 /*Pause on hover true*/
									 ?>,
									pauseOnAction:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['pauseOnAction']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['pauseOnAction'];
									 else echo $nico_sliders['Product page']['Flexslider']['Pause on action']['default'];
									 /*Pause on action true*/
									 ?>,
									touch:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['touch']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['touch'];
									 else echo $nico_sliders['Product page']['Flexslider']['Touch support']['default'];
									 /*Touch support true*/
									 ?>,
									video:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['video']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['video'];
									 else echo $nico_sliders['Product page']['Flexslider']['Video support']['default'];
									 /*Video support false*/
									 ?>,
									mousewheel:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['mousewheel']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['mousewheel'];
									 else echo $nico_sliders['Product page']['Flexslider']['Mousewheel support']['default'];
									 /*Mousewheel support false*/
									 ?>,
									keyboard:<?php
									 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['keyboard']))
									 echo $_nico_settings['sliders']['Product page']['Flexslider']['keyboard'];
									 else echo $nico_sliders['Product page']['Flexslider']['Keyboard support']['default'];
									 /*Keyboard support false*/
									 ?>,
									asNavFor: '#slider',
									itemWidth: 100,
									controlNav: false,
									animation: "slide"
								  });
								  
								  $('#slider').flexslider({
										animation:"<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['animation']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['animation'];
										 else echo $nico_sliders['Product page']['Flexslider']['Animation type']['default'];
										 /*Animation type slide*/
										 ?>",
										easing:"<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['easing']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['easing'];
										 else echo $nico_sliders['Product page']['Flexslider']['Easing animation']['default'];
										 /*Easing animation */
										 ?>",
										direction:"<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['direction']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['direction'];
										 else echo $nico_sliders['Product page']['Flexslider']['Direction']['default'];
										 /*Direction horizontal*/
										 ?>",
										startAt:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['startAt']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['startAt'];
										 else echo $nico_sliders['Product page']['Flexslider']['Start at']['default'];
										 /*Start at 0*/
										 ?>,
										initDelay:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['initDelay']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['initDelay'];
										 else echo $nico_sliders['Product page']['Flexslider']['Initial delay (miliseconds)']['default'];
										 /*Initial delay (miliseconds) 0*/
										 ?>,
										slideshowSpeed:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['slideshowSpeed']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['slideshowSpeed'];
										 else echo $nico_sliders['Product page']['Flexslider']['Slideshow speed']['default'];
										 /*Slideshow speed 7000*/
										 ?>,
										animationSpeed:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['animationSpeed']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['animationSpeed'];
										 else echo $nico_sliders['Product page']['Flexslider']['Animation speed']['default'];
										 /*Animation speed 600*/
										 ?>,
										prevText:"<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['prevText']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['prevText'];
										 else echo $nico_sliders['Product page']['Flexslider']['Previous text']['default'];
										 /*Previous text Previous*/
										 ?>",
										nextText:"<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['nextText']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['nextText'];
										 else echo $nico_sliders['Product page']['Flexslider']['Next text']['default'];
										 /*Next text Next*/
										 ?>",
										pauseText:"<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['pauseText']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['pauseText'];
										 else echo $nico_sliders['Product page']['Flexslider']['Pause text']['default'];
										 /*Pause text Pause*/
										 ?>",
										playText:"<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['playText']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['playText'];
										 else echo $nico_sliders['Product page']['Flexslider']['Play text']['default'];
										 /*Play text Play*/
										 ?>",
										pausePlay:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['pausePlay']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['pausePlay'];
										 else echo $nico_sliders['Product page']['Flexslider']['Show pause/play']['default'];
										 /*Show pause/play false*/
										 ?>,
										controlNav:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['controlNav']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['controlNav'];
										 else echo $nico_sliders['Product page']['Flexslider']['Show navigation control']['default'];
										 /*Show navigation control true*/
										 ?>,
										slideshow:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['slideshow']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['slideshow'];
										 else echo $nico_sliders['Product page']['Flexslider']['Slideshow']['default'];
										 /*Slideshow true*/
										 ?>,
										animationLoop:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['animationLoop']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['animationLoop'];
										 else echo $nico_sliders['Product page']['Flexslider']['Animation loop']['default'];
										 /*Animation loop true*/
										 ?>,
										randomize:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['randomize']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['randomize'];
										 else echo $nico_sliders['Product page']['Flexslider']['Randomize']['default'];
										 /*Randomize false*/
										 ?>,
										smoothHeight:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['smoothHeight']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['smoothHeight'];
										 else echo $nico_sliders['Product page']['Flexslider']['Smooth height']['default'];
										 /*Smooth height true*/
										 ?>,
										useCSS:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['useCSS']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['useCSS'];
										 else echo $nico_sliders['Product page']['Flexslider']['Use CSS3 transitions if available']['default'];
										 /*Use CSS3 transitions if available true*/
										 ?>,
										pauseOnHover:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['pauseOnHover']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['pauseOnHover'];
										 else echo $nico_sliders['Product page']['Flexslider']['Pause on hover']['default'];
										 /*Pause on hover true*/
										 ?>,
										pauseOnAction:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['pauseOnAction']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['pauseOnAction'];
										 else echo $nico_sliders['Product page']['Flexslider']['Pause on action']['default'];
										 /*Pause on action true*/
										 ?>,
										touch:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['touch']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['touch'];
										 else echo $nico_sliders['Product page']['Flexslider']['Touch support']['default'];
										 /*Touch support true*/
										 ?>,
										video:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['video']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['video'];
										 else echo $nico_sliders['Product page']['Flexslider']['Video support']['default'];
										 /*Video support false*/
										 ?>,
										mousewheel:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['mousewheel']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['mousewheel'];
										 else echo $nico_sliders['Product page']['Flexslider']['Mousewheel support']['default'];
										 /*Mousewheel support false*/
										 ?>,
										keyboard:<?php
										 if (isset($_nico_settings['sliders']['Product page']['Flexslider']['keyboard']))
										 echo $_nico_settings['sliders']['Product page']['Flexslider']['keyboard'];
										 else echo $nico_sliders['Product page']['Flexslider']['Keyboard support']['default'];
										 /*Keyboard support false*/
										 ?>,
										sync: "#carousel",
								  });
								 
							});
						</script>  				
<?php } else if($_nico_settings['sliders']['Product page']['active'] == 'Opencart default gallery') {?>			
	<?php if ($thumb) { ?>
	  <?php
	  if (!$thumb) 
	  { 
		  $image= current($images); 
		  $popup = $image['popup'];
		  $heading_title = '';
		  if (isset($image['heading_title'])) $heading_title = $image['heading_title'];
		  $thumb = $image['popup'];
	  }?>	
      <div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
      <?php } ?>
      <?php if ($images) { ?>
      <div class="image-additional">
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
<?php }?>
			<?php if ($products && (isset($_nico_settings['settings']['product_page_related']) && $_nico_settings['settings']['product_page_related'] == 'gallery')) { ?>
			<div class="box">
			<div class="box-heading"><?php echo $tab_related; ?></div>
			<div class="box-product">
				  <?php $_counter = 0;foreach ($products as $product) { ?>
				  <div<?php 
							$_counter++;
							$_mod = $_counter % 2;
							if ($_mod == 0) echo ' class="last"';
							if ($_mod == 1) echo ' class="first"';
					?>>
					<?php if ($product['thumb']) { ?>
					<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
					<?php } ?>
					<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
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
					<div class="cart">
					<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>', 1, event);return false;" class="button" />
				  </div>
				  </div>
				  <?php } ?>
				</div>
			</div>    
			<?php } ?>				
			</div>	
    <?php } ?>
    <div class="right">
		<h1><?php echo $heading_title; ?></h1>
      <div class="description">
        <?php if ($manufacturer) { ?>
        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span> <?php echo $stock; ?></div>
      <?php if ($price) { ?>
        <div class="price"><?php /* echo $text_price; */?>
        <?php if (!$special) { ?>
        <span class="price-p"><?php echo $price; ?></span>
        <?php } else { ?>
        <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
        <?php } ?>
        <br />
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
        <?php } ?>
        <?php if ($discounts) { ?>
        <br />
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if (isset($profiles) && $profiles): ?>
      <div class="option">
          <h2><span class="required">*</span><?php echo $text_payment_profile ?></h2>
          <br />
          <select name="profile_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($profiles as $profile): ?>
              <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
              <?php endforeach; ?>
          </select>
          <br />
          <br />
          <span id="profile-description"></span>
          <br />
          <br />
      </div>
      <?php endif; ?>
      <?php /*if ($options && (!isset($_GET['ajax']) && !isset($_POST['ajax']))) */{ ?>
      <div class="options">
        <div><?php echo $text_option; ?></div><br/>
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <table class="option-image">
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <br />
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
	  
      <div class="review">
   	    <?php if ($review_status) { ?>
        <div><img src="catalog/view/theme/ruby/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a></div>
         <?php } ?>
			<div class="share">
			  <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
			  <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
			</div>
      </div>
	
      <div class="cart">
        <div>
          <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button" />
          &nbsp;<?php echo $text_qty; ?>
          <input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
          <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
        </div>
		
		
        <!-- <div class="product_wish_compare"><span>&nbsp;&nbsp;&nbsp;<?php echo $text_or; ?>&nbsp;&nbsp;&nbsp;</span></div> -->
        <div class="product_wish_compare">
			<a id="product_page_whishlist" onclick="addToWishList('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a>
           <a id="product_page_compare" onclick="addToCompare('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></a>
		</div>
		  
		  
		  
        <?php if ($minimum > 1) { ?>
        <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>
      </div>

  <?php $_tags_label_shown = false;if ($tags && is_array($tags) && count($tags) > 0) { ?>
  <div class="tags">
    <?php for ($i = 0; $i < count($tags); $i++) { if ($tags[$i]['tag'] != '' && $_tags_label_shown == false) {$_tags_label_shown = true;?>
    <b><?php echo $text_tags; ?></b>
    <?php } if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>

	<?php if (isset($_nico_settings['settings']['product_description']) && $_nico_settings['settings']['product_description'] == 'bottom') { ?></div></div><?php } ?>
	<div id="tabs" class="htabs"><a href="#tab-description"><?php echo $tab_description; ?></a>
    <?php if ($attribute_groups) { ?>
    <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status) { ?>
    <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
    <?php if ($products && isset($_nico_settings['settings']['product_page_related']) && $_nico_settings['settings']['product_page_related'] == 'tab') { ?>
    <a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
    <?php } ?>
  </div>
  <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <?php if ($review_status) { ?>
  <div id="tab-review" class="tab-content">
    <div id="review"></div>
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="" />
    <br />
    <br />
    <b><?php echo $entry_review; ?></b>
    <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span><?php echo $entry_good; ?></span><br />
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="" />
    <br /><br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  </div>
  <?php } ?>
  <?php if ($products && isset($_nico_settings['settings']['product_page_related']) && $_nico_settings['settings']['product_page_related'] == 'tab') { ?>
  <div id="tab-related" class="tab-content">
    <div class="box-product">
      <?php $_counter = 0;foreach ($products as $product) { ?>
      <div<?php 
				$_counter++;
				$_mod = $_counter % 2;
				if ($_mod == 0) echo ' class="last"';
				if ($_mod == 1) echo ' class="first"';
		?>>
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
        <?php } ?>        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
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
		<div class="cart">
        <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>', 1, event);return false;" class="button" />
      </div>
	  </div>
      <?php } ?>
    </div>
  </div>
 
 <?php } ?>
 
<?php if (!isset($_nico_settings['settings']['product_description']) || $_nico_settings['settings']['product_description'] == 'right') { ?></div></div><?php } ?>
 

<?php if ($products && (!isset($_nico_settings['settings']['product_page_related']) ||  (isset($_nico_settings['settings']['product_page_related']) && $_nico_settings['settings']['product_page_related'] == 'under'))) { ?>
<div class="box">
<div class="box-heading"><?php echo $tab_related; ?></div>
<div class="box-product">
      <?php $_counter = 0;foreach ($products as $product) { ?>
      <div<?php 
				$_counter++;
				$_mod = $_counter % 4;
				if ($_mod == 0) echo ' class="last"';
				if ($_mod == 1) echo ' class="first"';
		?>>
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
        <?php } ?>        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
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
		<div class="cart">
        <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>', 1, event);return false;" class="button" />
      </div>
	  </div>
      <?php } ?>
    </div>
</div>    
<?php } ?>


<?php echo $content_bottom; ?>
</div>
<?php echo $new_column_left?>



<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/ruby/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			    if (notification_hide_timeout > 0) var t=setTimeout(function(){$('#notification img').click()}, notification_hide_timeout);
			}	
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/ruby/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/ruby/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<?php echo $footer; ?>
