<!-- Begin MailChimp Signup Form -->
	<div class="mc_embed_signup clearfix">
	<form action="<?php if ($type == 1) {?>/index.php?route=account/newsletter<?php } else { ?>http://<?php echo $app;?>.us2.list-manage.com/subscribe/post?u=<?php echo $api_key;?>&amp;id=<?php echo $list_id;?><?php } ?>"
		class="validate" id="mc-embedded-subscribe-form" method="post" name="mc-embedded-subscribe-form" 
		novalidate="" target="_blank">
			<label for="mce-EMAIL">Newsletter</label> 
			<div>
			<input class="email" id="mce-EMAIL" name="EMAIL" placeholder="Input your email address" required="" type="email" value=""> 
			<input class="button" id="mc-embedded-subscribe" name="subscribe" type="submit" value="Subscribe">&nbsp;
			<input type="hidden" value="1" name="newsletter">
			</div>
	</form>
	</div>
<!--End mc_embed_signup-->
