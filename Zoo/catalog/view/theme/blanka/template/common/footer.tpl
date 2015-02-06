<div id="footer">
<div class="clsfooter">
<div class="topFooter clearfix">
  <?php if ($informations) { ?>
  <div class="column">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <div class="column">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
	  </div>
	   <div class="column fbcolumn"> 
	    <h3>Facebook</h3>
  <div class="facebook"><div class="fb-like-box" data-href="http://www.facebook.com/loftytemplates" data-width="292" data-height="250" data-show-faces="true" data-stream="false" data-border-color="#272727" data-header="false"></div></div>
  
  <div class="facebook tab_facebook"><div class="fb-like-box" data-href="http://www.facebook.com/loftytemplates" data-width="230" data-height="250" data-show-faces="true" data-stream="false" data-border-color="#272727" data-header="false"></div></div>
  </div>
  </div>
  
  
  <div id="footer-mobl">
  <?php if ($informations) { ?>
   <ul><li> <h3><?php echo $text_information; ?>  <div class="arw"></div> </h3>
     <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul></li>
	
  <?php } ?>

   <li> <h3><?php echo $text_service; ?><div class="arw"></div> </h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul></li>

   <li> <h3><?php echo $text_extra; ?> <div class="arw"></div> </h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul></li>
	
  
    <li><h3><?php echo $text_account; ?><div class="arw"></div> </h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul></li>
 
 <li><h3>Follow Us <div class="arw"></div> </h3>
 <ul><li><img src="catalog/view/theme/shopper/image/twitter.png" alt="" /></li>
 <li><img src="catalog/view/theme/shopper/image/fb.png" alt=""/></li>
 <li><img src="catalog/view/theme/shopper/image/google+.png" alt="" /></li></ul></li>
 </ul>
 </div>
  
  
  
  
  <div class="centerFooter">
  <div class="clscenterFooter">
  <div class="call"><img src="catalog/view/theme/blanka/image/call.png" /><span>1800-555-3838</span></div>
  <div class="messageF"><img src="catalog/view/theme/blanka/image/message.png" /><span>info@yourstore.com</span></div>
  <div class="socialNetwork">
  <ul>
  <li class="fb"><a href="https://www.facebook.com/"></a></li>
  <li class="rss"><a href="https://www.facebook.com/"></a></li>
  <li class="twt"><a href="https://www.facebook.com/"></a></li>
  <li class="googlepl"><a href="https://www.facebook.com/"></a></li>
  <li class="icon"><a href="https://www.facebook.com/"></a></li> </ul></div>
  </div>
  </div>
  
  <div class="bottomFooter">
  <div id="powered"><?php echo $powered; ?></div>
  <div class="footerMenu"> 
  <ul>
  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
  <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
  </ul>
  
  </div>
  
  
  </div>
</div>
</div>



<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
</div>
</body></html>