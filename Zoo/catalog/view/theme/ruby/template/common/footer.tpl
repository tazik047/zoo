<?php if (!isset($_REQUEST['ajax'])) {?>
<?php 
if (isset($_SERVER['SCRIPT_FILENAME']))
{
	$_theme_include_path = dirname($_SERVER['SCRIPT_FILENAME']) . '/catalog/view/theme/ruby/';
} else if (isset($_SERVER['DOCUMENT_ROOT']))
{
	$_theme_include_path = $_SERVER['DOCUMENT_ROOT'] . '/catalog/view/theme/ruby/';
}
else $_theme_include_path = dirname(__FILE__) . '/../../';

$settings_file_name = 'settings.inc';
$settings_css_file_name = 'editor_settings.css';
/*demo*/if ($_SERVER['SERVER_NAME'] == 'gloss2.nicolette.ro') {$settings_file_name = 'settings2.inc';$settings_css_file_name = 'editor_settings2.css';}

include($_theme_include_path . 'nico_theme_editor/' . $settings_file_name);
$last_modification_ts = filemtime($_theme_include_path . 'nico_theme_editor/' . $settings_file_name);


if (isset($_nico_settings['settings']['first_visit_message']) && !empty($_nico_settings['settings']['first_visit_message'])) { ?>


<div id="first_visit_message"><?php echo html_entity_decode($_nico_settings['settings']['first_visit_message']);?><a id="first_message_close" href="#close">Close</a></div>
<?php } ?>	
<?php if (!isset($_nico_settings['settings']['responsive_css']) || $_nico_settings['settings']['responsive_css'] != 'true') { ?>
<link rel="stylesheet" id="responsive_css" type="text/css" href="catalog/view/theme/ruby/stylesheet/responsive.css" />
<?php } ?>
<?php  if (isset($_nico_settings['options']['#social_band']['display']) && $_nico_settings['options']['#social_band']['display'] == 'block') {?>
<div id="social_band">
	<div id="social_about">
		<h3>About</h3>
		<div>
			<?php if (isset($_nico_settings['settings']['about_text']) && !empty($_nico_settings['settings']['about_text'])) echo $_nico_settings['settings']['about_text']; else echo 'You can change this text from the panel settings. Theme settings > About text<br/><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';?>
		</div>
	</div>
	<div id="social_twitter">
		<h3>Twitter</h3>
		<div>
			<ul id="twitter_update_list"><li>Twitter feed loading</li></ul>			
			<script type="text/javascript" src="catalog/view/theme/ruby/js/twitterFetcher_v9_min.js"></script>
			<script>twitterFetcher.fetch('<?php if (isset($_nico_settings['settings']['twitter_profile_id']) && !empty($_nico_settings['settings']['twitter_profile_id'])) echo $_nico_settings['settings']['twitter_profile_id']; else echo '256524641194098690';?>', 'twitter_update_list', <?php if (isset($_nico_settings['settings']['twitter_count']) && !empty($_nico_settings['settings']['twitter_count'])) echo $_nico_settings['settings']['twitter_count']; else echo '2';?>, true, true, false);</script> 
			<!--
			<script type="text/javascript" src="https://api.twitter.com/1/statuses/user_timeline.json?screen_name=<?php if (isset($_nico_settings['settings']['twitter_profile_id']) && !empty($_nico_settings['settings']['twitter_profile_id'])) echo $_nico_settings['settings']['twitter_profile_id']; else echo 'NicoleThemes';?>&amp;callback=twitterCallback2&amp;count=<?php if (isset($_nico_settings['settings']['twitter_count']) && !empty($_nico_settings['settings']['twitter_count'])) echo $_nico_settings['settings']['twitter_count']; else echo '3';?>"></script>			
			-->
			<a href="http://twitter.com/#!/<?php if (isset($_nico_settings['settings']['twitter_profile_id']) && !empty($_nico_settings['settings']['twitter_profile_id'])) echo $_nico_settings['settings']['twitter_profile_id']; else echo 'NicoleThemes';?>" id="twitter_follow">Follow us on twitter</a>
		</div>
	</div>
	<div id="social_facebook">
		<h3>Facebook</h3>
		<div>
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "https://connect.facebook.net/en_US/all.js#xfbml=1";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
		<div class="fb-like-box" data-href="https://www.facebook.com/<?php if (isset($_nico_settings['settings']['fb_profile_id']) && !empty($_nico_settings['settings']['fb_profile_id'])) echo $_nico_settings['settings']['fb_profile_id']; else echo '201498429982413';?>" data-width="250" data-color-scheme="light"  data-show-faces="true" data-stream="false" data-header="false" data-border-color="#fff"></div>
		</div>		
	</div>
</div>
<?php }?>



<div id="footer">
	<div id="dogf"></div>
  <div>
 <?php if ($informations) { ?>
  <div class="column first">
	<div>
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
    </div>
  </div>
  <?php } ?>
  <div class="column">
    <div>
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
    </div>
  </div>
  <div class="column">
    <div>
	<h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
    </div>
  </div>
  <div class="column">
    <div>
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
    </div>
  </div>
  
  <div class="column">
    <div>
	<div id="powered" class="clearfix">
		<span>
			<?php echo $powered; ?>
		</span>

		<ul class="payment-icons">
			<li><img src="catalog/view/theme/ruby/image/visa.png" alt="Visa"/></li>
			<li><img src="catalog/view/theme/ruby/image/paypal.png" alt="Paypal"/></li>
			<li><img src="catalog/view/theme/ruby/image/cirrus.png" alt="Cirrus"/></li>
			<li><img src="catalog/view/theme/ruby/image/mastercard.png" alt="Mastercard"/></li>
			<li><img src="catalog/view/theme/ruby/image/american_express.png" alt="American Express"/></li>
		</ul>
	</div>  
    </div>
  </div>



</div>
</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<div id="scroll_top"><a href="/"></a></div>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<?php
if (isset($_nico_settings['settings']['custom_css']) && !empty($_nico_settings['settings']['custom_css'])) { ?>
<style><?php echo html_entity_decode($_nico_settings['settings']['custom_css']);?></style>
<?php } ?>	
<?php
if (isset($_nico_settings['settings']['notification_hide_timeout']) && !empty($_nico_settings['settings']['notification_hide_timeout'])) { ?>
<script>var notification_hide_timeout = <?php echo html_entity_decode($_nico_settings['settings']['notification_hide_timeout']);?>;</script>
<?php } ?>	
<link class="_editor_css" href='catalog/view/theme/ruby/nico_theme_editor/<?php echo $settings_css_file_name;?>?ts=<?php echo $last_modification_ts;?>' rel='stylesheet' type='text/css'/>
</body></html><?php } ?>
