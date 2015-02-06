<?php 
if (isset($_SERVER['SCRIPT_FILENAME']))
{
	$_theme_include_path = dirname($_SERVER['SCRIPT_FILENAME']) . '/catalog/view/theme/ruby/';
} else if (isset($_SERVER['DOCUMENT_ROOT']))
{
	$_theme_include_path = $_SERVER['DOCUMENT_ROOT'] . '/catalog/view/theme/ruby/';
}
else $_theme_include_path = dirname(__FILE__) . '/../../';

include($_theme_include_path . 'nico_theme_editor/settings.inc');
include($_theme_include_path . 'nico_theme_editor/nico_config.inc');

$lang = $this->language->get('code');

/*demo only*///if (isset($_GET['slider']) && $_GET['slider'] == 'camera') $_nico_settings['sliders']['Homepage']['active'] = 'Camera slider';
/*demo only*///if (isset($_GET['slider']) && $_GET['slider'] == 'nivo') $_nico_settings['sliders']['Homepage']['active'] = 'Nivo slider';

if (isset($_nico_settings['sliders']['Homepage']['active']))
{
	$_nico_active = $_nico_settings['sliders']['Homepage']['active'];
}
if (!isset($_nico_active) || $_nico_active == 'Thumbflip') {?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ruby/stylesheet/thumbflip.css"/>
<script src="catalog/view/theme/ruby/js/jquery.mousewheel.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/ruby/js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="catalog/view/theme/ruby/js/jquery.flip.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/ruby/js/thumbflip.js" type="text/javascript"></script>
<script>
rotate_delay =  <?php  
			 if (isset($_nico_settings['sliders']['Homepage']['Thumbflip']['slideshowSpeed']))
			 echo $_nico_settings['sliders']['Homepage']['Thumbflip']['slideshowSpeed'];
			 else echo $nico_sliders['Homepage']['Thumbflip']['Slideshow speed']['default'];?>;
var show_tf_zoom = <?php if (!isset($_nico_settings['sliders']['Homepage']['Thumbflip']['tf_zoom']) || (isset($_nico_settings['sliders']['Homepage']['Thumbflip']['tf_zoom']) && $_nico_settings['sliders']['Homepage']['Thumbflip']['tf_zoom'] == 'true')) echo 'true';else echo 'false';?>;
</script>

<div id="tf_loading" class="tf_loading"></div>
<div id="tf_bg" class="tf_bg">
	<?php $_slide_counter = 0;foreach ($banners as $banner) { ?>
	<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" longdesc="<?php echo $banner['image']; ?>" />
	<?php $_slide_counter++;} ?>	
	<div class="tf_pattern"></div>
</div>

<div id="tf_prev" class="tf_prev<?php if (isset($_nico_settings['sliders']['Homepage']['Thumbflip']['showArrowBack']) && $_nico_settings['sliders']['Homepage']['Thumbflip']['showArrowBack'] == 'true') echo ' back'?>"><div></div></div>
<div id="tf_next" class="tf_next<?php if (isset($_nico_settings['sliders']['Homepage']['Thumbflip']['showArrowBack']) && $_nico_settings['sliders']['Homepage']['Thumbflip']['showArrowBack'] == 'true') echo ' back'?>"><div></div></div>


<div id="tf_thumbs" class="tf_thumbs">
	<?php if (!isset($_nico_settings['sliders']['Homepage']['Thumbflip']['tf_zoom']) || (isset($_nico_settings['sliders']['Homepage']['Thumbflip']['tf_zoom']) && $_nico_settings['sliders']['Homepage']['Thumbflip']['tf_zoom'] == 'true')) {?><span id="tf_zoom" class="tf_zoom"></span> <?php }?>
	<img src="<?php echo $banners[0]['image'];?>" alt="Thumb1"/>
</div>


<div id="tf_content_wrapper" class="tf_content_wrapper">
	<?php $_slide_counter = 0;foreach ($banners as $banner) { ?>
    <div class="tf_content" id="content<?php echo $_slide_counter;?>" <?php if ($_slide_counter == 0) {?>style="display:block;"<?php }?>>
		 <div class="ei-title">
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter]['title'])) {?><h2><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter]['title'];?></h2><?php }?>
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter]['description'])) {?><p><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter]['description'];?></p><?php }?>
				<?php if ($banner['link']) { ?><a href="<?php echo $banner['link'];?>"><?php  
						 if (isset($_nico_settings['sliders']['Homepage']['Thumbflip']['linkText']))
						 echo $_nico_settings['sliders']['Homepage']['Thumbflip']['linkText'];
						 else echo $nico_sliders['Homepage']['Thumbflip']['Link text']['default'];?></a><?php }?>
		</div>
    </div>
	<?php $_slide_counter++;}?>
</div>



<style>
<?php  
	 if (isset($_nico_settings['sliders']['Homepage']['Thumbflip']['showThumb']) && $_nico_settings['sliders']['Homepage']['Thumbflip']['showThumb'] == 'false') echo '.tf_thumbs{display:none} ';
	 if (isset($_nico_settings['sliders']['Homepage']['Thumbflip']['showArrows']) && $_nico_settings['sliders']['Homepage']['Thumbflip']['showArrows'] == 'false') echo '#tf_next,#tf_prev{display:none} ';
	 if (isset($_nico_settings['sliders']['Homepage']['Thumbflip']['buttonBackground'])) echo '.tf_content a{background:#' . $_nico_settings['sliders']['Homepage']['Thumbflip']['buttonBackground'] . '}';
?>
</style>
<?php } else if ($_nico_active == 'Flexslider')  {?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ruby/stylesheet/flexslider.css"/>
<script src="catalog/view/theme/ruby/js/jquery.easing.1.3.js"  type="text/javascript"></script>
<script src="catalog/view/theme/ruby/js/jquery.flexslider.js"  type="text/javascript"></script>
<div class="slideshow" style="position:relative">
	<div id="slideshow<?php echo $module; ?>">
	  <ul class="slides">
		<?php $_slide_counter = 0;foreach ($banners as $banner) { ?>
		<li>
			<?php if ($banner['link']) { ?>
			<a href="<?php echo $banner['link']; ?>">
				<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter])) {?><p class="flex-caption"><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter++]['title'];?></p><?php }?>
			</a>
			<?php } else { ?>
				<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter])) {?><p class="flex-caption"><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter++]['title'];?></p><?php }?>
			<?php } ?>
		</li>
		<?php } ?>
	   </ul>
	</div>
</div>

<script type="text/javascript">


$(document).ready( function(){	
	 	$('#slideshow<?php echo $module; ?>').flexslider({
			animation:"<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['animation']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['animation'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Animation type']['default'];
			 /*Animation type slide*/
			 ?>",
			easing:"<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['easing']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['easing'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Easing animation']['default'];
			 /*Easing animation */
			 ?>",
			direction:"<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['direction']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['direction'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Direction']['default'];
			 /*Direction horizontal*/
			 ?>",
			startAt:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['startAt']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['startAt'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Start at']['default'];
			 /*Start at 0*/
			 ?>,
			initDelay:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['initDelay']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['initDelay'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Initial delay (miliseconds)']['default'];
			 /*Initial delay (miliseconds) 0*/
			 ?>,
			slideshowSpeed:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['slideshowSpeed']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['slideshowSpeed'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Slideshow speed']['default'];
			 /*Slideshow speed 7000*/
			 ?>,
			animationSpeed:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['animationSpeed']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['animationSpeed'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Animation speed']['default'];
			 /*Animation speed 600*/
			 ?>,
			prevText:"<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['prevText']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['prevText'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Previous text']['default'];
			 /*Previous text Previous*/
			 ?>",
			nextText:"<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['nextText']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['nextText'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Next text']['default'];
			 /*Next text Next*/
			 ?>",
			pauseText:"<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['pauseText']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['pauseText'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Pause text']['default'];
			 /*Pause text Pause*/
			 ?>",
			playText:"<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['playText']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['playText'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Play text']['default'];
			 /*Play text Play*/
			 ?>",
			pausePlay:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['pausePlay']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['pausePlay'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Show pause/play']['default'];
			 /*Show pause/play false*/
			 ?>,
			controlNav:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['controlNav']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['controlNav'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Show navigation control']['default'];
			 /*Show navigation control true*/
			 ?>,
			slideshow:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['slideshow']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['slideshow'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Slideshow']['default'];
			 /*Slideshow true*/
			 ?>,
			animationLoop:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['animationLoop']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['animationLoop'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Animation loop']['default'];
			 /*Animation loop true*/
			 ?>,
			randomize:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['randomize']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['randomize'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Randomize']['default'];
			 /*Randomize false*/
			 ?>,
			smoothHeight:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['smoothHeight']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['smoothHeight'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Smooth height']['default'];
			 /*Smooth height true*/
			 ?>,
			useCSS:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['useCSS']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['useCSS'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Use CSS3 transitions if available']['default'];
			 /*Use CSS3 transitions if available true*/
			 ?>,
			pauseOnHover:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['pauseOnHover']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['pauseOnHover'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Pause on hover']['default'];
			 /*Pause on hover true*/
			 ?>,
			pauseOnAction:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['pauseOnAction']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['pauseOnAction'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Pause on action']['default'];
			 /*Pause on action true*/
			 ?>,
			touch:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['touch']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['touch'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Touch support']['default'];
			 /*Touch support true*/
			 ?>,
			video:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['video']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['video'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Video support']['default'];
			 /*Video support false*/
			 ?>,
			mousewheel:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['mousewheel']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['mousewheel'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Mousewheel support']['default'];
			 /*Mousewheel support false*/
			 ?>,
			keyboard:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Flexslider']['keyboard']))
			 echo $_nico_settings['sliders']['Homepage']['Flexslider']['keyboard'];
			 else echo $nico_sliders['Homepage']['Flexslider']['Keyboard support']['default'];
			 /*Keyboard support false*/
			 ?>
 	});
});		  
</script>		
<?php 
}
  else if($_nico_settings['sliders']['Homepage']['active'] == 'Nivo slider')
{?>
<div class="slideshow nivo">
  <div id="slideshow<?php echo $module; ?>" class="nivoSlider">
    <?php $_slide_counter = 0;foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>" alt="<?php echo $banner['title']; ?>"><img src="<?php echo $banner['image']; ?>"  alt="<?php echo $banner['title']; ?>" title="#slideshow<?php echo $module; ?>-caption-<?php echo $_slide_counter++;?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="#slideshow<?php echo $module; ?>-caption-<?php echo $_slide_counter++;?>" />
    <?php } ?>
    <?php } ?>
  </div>
  
  <?php $_slide_counter = 0;if (isset($_nico_settings['slider_text'][$lang])) foreach ($_nico_settings['slider_text'][$lang] as $index => $slide) { ?>
	<div id="slideshow<?php echo $module; ?>-caption-<?php echo $_slide_counter++;?>" class="nivo-html-caption"><?php echo $slide['title'];?></div>
  <?php }?>
</div>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ruby/js/nivo-slider.css" media="screen" />
<script src="catalog/view/theme/ruby/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#slideshow<?php echo $module; ?>').nivoSlider({
				effect:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['effect']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['effect'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Effect']['default'];
				 /*Effect random*/
				 ?>",
				slices:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['slices']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['slices'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Slices']['default'];
				 /*Slices 15*/
				 ?>,
				boxCols:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['boxCols']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['boxCols'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Box columns']['default'];
				 /*Box columns 8*/
				 ?>,
				boxRows:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['boxRows']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['boxRows'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Box rows']['default'];
				 /*Box rows 4*/
				 ?>,
				animSpeed:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['animSpeed']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['animSpeed'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Animation speed']['default'];
				 /*Animation speed 500*/
				 ?>,
				pauseTime:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['pauseTime']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['pauseTime'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Pause time']['default'];
				 /*Pause time 3000*/
				 ?>,
				startSlide:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['startSlide']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['startSlide'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Start slide number']['default'];
				 /*Start slide number 0*/
				 ?>,
				prevText:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['prevText']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['prevText'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Prev text']['default'];
				 /*Prev text Prev*/
				 ?>",
				nextText:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['nextText']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['nextText'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Next text']['default'];
				 /*Next text Next*/
				 ?>",
				directionNav:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['directionNav']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['directionNav'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Next & Prev navigation']['default'];
				 /*Next & Prev navigation true*/
				 ?>,
				controlNav:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['controlNav']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['controlNav'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Show pagination control']['default'];
				 /*Show pagination control true*/
				 ?>,
				controlNavThumbs:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['controlNavThumbs']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['controlNavThumbs'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Use thumbnails for navigation']['default'];
				 /*Use thumbnails for navigation false*/
				 ?>,
				pauseOnHover:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['pauseOnHover']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['pauseOnHover'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Stop animation while hovering']['default'];
				 /*Stop animation while hovering true*/
				 ?>,
				manualAdvance:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['manualAdvance']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['manualAdvance'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Force manual transitions']['default'];
				 /*Force manual transitions false*/
				 ?>,
				randomStart:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Nivo slider']['randomStart']))
				 echo $_nico_settings['sliders']['Homepage']['Nivo slider']['randomStart'];
				 else echo $nico_sliders['Homepage']['Nivo slider']['Start on a random slide']['default'];
				 /*Start on a random slide true*/
				 ?>
   		});
});
--></script>
<?php 
}
  else if($_nico_settings['sliders']['Homepage']['active'] == 'Elastic slider')
{?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ruby/stylesheet/ei-slider.css"/>
<script src="catalog/view/theme/ruby/js/jquery.easing.1.3.js"  type="text/javascript"></script>
<script src="catalog/view/theme/ruby/js/jquery.eislideshow.js" type="text/javascript"></script>
<div class="slideshow">
  <div id="slideshow<?php echo $module; ?>" class="ei-slider" style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px;">
	<ul class="ei-slider-large" >
    <?php $_slide_counter = 0;foreach ($banners as $banner) { ?>
    <li>
		<?php if ($banner['link']) { ?>
		<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
		<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter])) {?>
		 <div class="ei-title">
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter]['title'])) {?><h2><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter]['title'];?></h2><?php }?>
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter]['subtitle'])) {?><h3><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter]['subtitle'];?></h3><?php }?>
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter]['description'])) {?><p><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter]['description'];?></p><?php }?>
		</div>
		<?php $_slide_counter++;}?>
    <?php } else { ?>
		 <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
		<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter])) {?>
		 <div class="ei-title">
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter]['title'])) {?><h2><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter]['title'];?></h2><?php }?>
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter]['subtitle'])) {?><h3><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter]['subtitle'];?></h3><?php }?>
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter]['description'])) {?><p><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter]['description'];?></p><?php }?>
		</div>
		<?php $_slide_counter++;}?>
    <?php } ?>
    </li>
    <?php } ?>
    </ul>

	<ul class="ei-slider-thumbs">
    <li class="ei-slider-element">Current</li>		
    <?php foreach ($banners as $banner) { ?>
    <li>
		<?php if ($banner['link']) { ?>
		<a href="<?php echo $banner['link']; ?>"></a>
		<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } else { ?>
		<a href="#"></a>
        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    </li>
    <?php } ?>
    </ul>
  </div>
</div>
<script type="text/javascript">
	$(function() {
		$('.ei-slider').eislideshow({
			animation:"<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Elastic slider']['animation']))
			 echo $_nico_settings['sliders']['Homepage']['Elastic slider']['animation'];
			 else echo $nico_sliders['Homepage']['Elastic slider']['Animation']['default'];
			 /*Animation sides*/
			 ?>",
			autoplay:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Elastic slider']['autoplay']))
			 echo $_nico_settings['sliders']['Homepage']['Elastic slider']['autoplay'];
			 else echo $nico_sliders['Homepage']['Elastic slider']['Autoplay']['default'];
			 /*Autoplay true*/
			 ?>,
			slideshow_interval:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Elastic slider']['slideshow_interval']))
			 echo $_nico_settings['sliders']['Homepage']['Elastic slider']['slideshow_interval'];
			 else echo $nico_sliders['Homepage']['Elastic slider']['Slideshow interval']['default'];
			 /*Slideshow interval 3000*/
			 ?>,
			speed:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Elastic slider']['speed']))
			 echo $_nico_settings['sliders']['Homepage']['Elastic slider']['speed'];
			 else echo $nico_sliders['Homepage']['Elastic slider']['Speed']['default'];
			 /*Speed 800*/
			 ?>,
			easing:"<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Elastic slider']['easing']))
			 echo $_nico_settings['sliders']['Homepage']['Elastic slider']['easing'];
			 else echo $nico_sliders['Homepage']['Elastic slider']['Easing animation']['default'];
			 /*Easing animation */
			 ?>",
			titleFactor:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Elastic slider']['titleFactor']))
			 echo $_nico_settings['sliders']['Homepage']['Elastic slider']['titleFactor'];
			 else echo $nico_sliders['Homepage']['Elastic slider']['Title factor']['default'];
			 /*Title factor 0.60*/
			 ?>,
			titlespeed:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Elastic slider']['titlespeed']))
			 echo $_nico_settings['sliders']['Homepage']['Elastic slider']['titlespeed'];
			 else echo $nico_sliders['Homepage']['Elastic slider']['Title speed']['default'];
			 /*Title speed 800*/
			 ?>,
			titleeasing:"<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Elastic slider']['titleeasing']))
			 echo $_nico_settings['sliders']['Homepage']['Elastic slider']['titleeasing'];
			 else echo $nico_sliders['Homepage']['Elastic slider']['Title easing animation']['default'];
			 /*Title easing animation */
			 ?>",
			thumbMaxWidth:<?php
			 if (isset($_nico_settings['sliders']['Homepage']['Elastic slider']['thumbMaxWidth']))
			 echo $_nico_settings['sliders']['Homepage']['Elastic slider']['thumbMaxWidth'];
			 else echo $nico_sliders['Homepage']['Elastic slider']['Thumb max width']['default'];
			 /*Thumb max width 150*/
			 ?>
 		});
	});
</script>
<?php 
}
  else if($_nico_settings['sliders']['Homepage']['active'] == 'Camera slider')
{?>

	<link rel='stylesheet' id='camera-css'  href='catalog/view/theme/ruby/stylesheet/camera.css' type='text/css' media='all'> 
    <script type='text/javascript' src='catalog/view/theme/ruby/js/jquery.mobile.customized.min.js'></script>
    <script type='text/javascript' src='catalog/view/theme/ruby/js/jquery.easing.1.3.js'></script> 
    <script type='text/javascript' src='catalog/view/theme/ruby/js/camera.js'></script> 
    
	<div  id="slideshow<?php echo $module; ?>">
        <div class="camera_wrap camera_emboss camera_white_skin"  style=" height: <?php echo $height; ?>px;" >
			<?php $_slide_counter = 0;foreach ($banners as $banner) { ?>
				<div data-thumb="<?php echo $banner['image']; ?>" data-src="<?php echo $banner['image']; ?>" <?php if ($banner['link']) { ?>data-link="<?php echo $banner['link']; ?>"<?php }?>>
				<?php if (isset($_nico_settings['slider_text'][$lang][$_slide_counter])) {?><div class="camera-caption fadeIn">
					<h2><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter]['title'];?></h2>
					<h3><?php echo $_nico_settings['slider_text'][$lang][$_slide_counter++]['description'];?></h3>
					<?php if ($banner['link']) { ?><a href="<?php echo $banner['link'];?>"><?php  
						 if (isset($_nico_settings['sliders']['Homepage']['Thumbflip']['linkText']))
						 echo $_nico_settings['sliders']['Homepage']['Thumbflip']['linkText'];
						 else echo $nico_sliders['Homepage']['Thumbflip']['Link text']['default'];?></a><?php }?>
				</div><?php }?>
            </div>
            <?php }?>
        </div>
    </div>


    <script>
		jQuery(function(){
			jQuery('#slideshow<?php echo $module; ?> > div').camera({
				alignment:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['alignment']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['alignment'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Alignment']['default'];
				 /*Alignment center*/
				 ?>",
				autoAdvance:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['autoAdvance']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['autoAdvance'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Auto advance']['default'];
				 /*Auto advance true*/
				 ?>,
				mobileAutoAdvance:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['mobileAutoAdvance']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['mobileAutoAdvance'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Mobile auto advance']['default'];
				 /*Mobile auto advance true*/
				 ?>,
				barDirection:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['barDirection']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['barDirection'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Bar direction']['default'];
				 /*Bar direction leftToRight*/
				 ?>",
				barPosition:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['barPosition']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['barPosition'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Bar position']['default'];
				 /*Bar position bottom*/
				 ?>",
				cols:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['cols']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['cols'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Columns']['default'];
				 /*Columns 6*/
				 ?>,
				easing:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['easing']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['easing'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Easing animation']['default'];
				 /*Easing animation easeInOutExpo*/
				 ?>",
				mobileEasing:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['mobileEasing']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['mobileEasing'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Mobile easing animation']['default'];
				 /*Mobile easing animation easeInOutExpo*/
				 ?>",
				fx:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['fx']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['fx'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Animation type']['default'];
				 /*Animation type random*/
				 ?>",
				mobileFx:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['mobileFx']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['mobileFx'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Mobile animation type']['default'];
				 /*Mobile animation type random*/
				 ?>",
				gridDifference:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['gridDifference']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['gridDifference'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Grid difference']['default'];
				 /*Grid difference 250*/
				 ?>,
				height:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['height']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['height'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Height']['default'];
				 /*Height 50%*/
				 ?>",
				hover:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['hover']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['hover'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Pause on hover']['default'];
				 /*Pause on hover true*/
				 ?>,
				loader:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['loader']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['loader'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Loader']['default'];
				 /*Loader pie*/
				 ?>",
				loaderColor:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['loaderColor']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['loaderColor'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Loader color']['default'];
				 /*Loader color #eeeeee*/
				 ?>",
				loaderBgColor:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['loaderBgColor']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['loaderBgColor'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Loader background color']['default'];
				 /*Loader background color #222222*/
				 ?>",
				loaderOpacity:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['loaderOpacity']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['loaderOpacity'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Loader opacity']['default'];
				 /*Loader opacity 0.8*/
				 ?>,
				loaderPadding:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['loaderPadding']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['loaderPadding'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Loader padding']['default'];
				 /*Loader padding 2*/
				 ?>,
				loaderStroke:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['loaderStroke']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['loaderStroke'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Loader stroke']['default'];
				 /*Loader stroke 7*/
				 ?>,
				minHeight:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['minHeight']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['minHeight'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Min height']['default'];
				 /*Min height 200px*/
				 ?>",
				navigation:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['navigation']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['navigation'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Navigation']['default'];
				 /*Navigation true*/
				 ?>,
				navigationHover:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['navigationHover']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['navigationHover'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Navigation hover']['default'];
				 /*Navigation hover true*/
				 ?>,
				mobileNavHover:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['mobileNavHover']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['mobileNavHover'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Mobile navigation hover']['default'];
				 /*Mobile navigation hover true*/
				 ?>,
				opacityOnGrid:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['opacityOnGrid']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['opacityOnGrid'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Opacity on grid']['default'];
				 /*Opacity on grid false*/
				 ?>,
				overlayer:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['overlayer']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['overlayer'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Overlayer']['default'];
				 /*Overlayer true*/
				 ?>,
				pagination:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['pagination']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['pagination'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Pagination']['default'];
				 /*Pagination true*/
				 ?>,
				pauseOnClick:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['pauseOnClick']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['pauseOnClick'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Pause on click']['default'];
				 /*Pause on click true*/
				 ?>,
				playPause:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['playPause']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['playPause'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Play pause']['default'];
				 /*Play pause true*/
				 ?>,
				pieDiameter:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['pieDiameter']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['pieDiameter'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Pie diameter']['default'];
				 /*Pie diameter 38*/
				 ?>,
				piePosition:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['piePosition']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['piePosition'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Pie position']['default'];
				 /*Pie position rightTop*/
				 ?>",
				portrait:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['portrait']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['portrait'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Portrait']['default'];
				 /*Portrait false*/
				 ?>,
				rows:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['rows']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['rows'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Rows']['default'];
				 /*Rows 4*/
				 ?>,
				slicedCols:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['slicedCols']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['slicedCols'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Sliced cols']['default'];
				 /*Sliced cols 12*/
				 ?>,
				slicedRows:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['slicedRows']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['slicedRows'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Sliced rows']['default'];
				 /*Sliced rows 8*/
				 ?>,
				slideOn:"<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['slideOn']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['slideOn'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Slide on']['default'];
				 /*Slide on random*/
				 ?>",
				thumbnails:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['thumbnails']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['thumbnails'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Thumbnails']['default'];
				 /*Thumbnails false*/
				 ?>,
				time:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['time']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['time'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Time']['default'];
				 /*Time 7000*/
				 ?>,
				transPeriod:<?php
				 if (isset($_nico_settings['sliders']['Homepage']['Camera slider']['transPeriod']))
				 echo $_nico_settings['sliders']['Homepage']['Camera slider']['transPeriod'];
				 else echo $nico_sliders['Homepage']['Camera slider']['Trans period']['default'];
				 /*Trans period 1500*/
				 ?>,				
				 imagePath: '../image/'
			});
		});
   </script>
<?php } ?>
