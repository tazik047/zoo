<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
  <script src="catalog/view/theme/blanka/js/jquery.bxslider.js"></script>
<div class="clsslider">
<div class="slideshow">
<ul class="bxslider">
  <?php foreach ($banners as $banner) { ?>
  
  <li>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
	
	</li>
    <?php } ?>
</ul></div></div>
<!-- jQuery library (served from Google) -->
<script type="text/javascript">
$('.bxslider').bxSlider({
  auto: true,
  autoControls: true
});
</script>

