
  <script src="catalog/view/theme/blanka/js/modernizr.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> 
	 <script defer src="catalog/view/theme/blanka/js/jquery.flexslider.js"></script>

<div id="banner<?php echo $module; ?>" class="banner clearfix">
<div class="bannerHeader"><h3>Ajax shop by price <br />slider</h3></div>
<div class="bannerContent"><p>Make every category of your webstore look special by different color schemes</p></div>
<div class="flexslider">
<ul  class="slides">
  <?php foreach ($banners as $banner) { ?>
  <li>
  <?php if ($banner['link']) { ?>
  <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
  <?php } else { ?>
  <div><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>

  <?php } ?>
 <div class="showme"><a href="<?php echo $banner['link']; ?>">Showme</a></div> </li>   

  <?php } ?>
  </ul>
  </div>
</div>


 <script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>


<script type="text/javascript"><!--
$(document).ready(function() {
	$('#banner<?php echo $module; ?> div:first-child').css('display', 'block');
});

var banner = function() {
	$('#banner<?php echo $module; ?>').cycle({
		before: function(current, next) {
			$(next).parent().height($(next).outerHeight());
		}
	});
}

setTimeout(banner, 2000);
//--></script>