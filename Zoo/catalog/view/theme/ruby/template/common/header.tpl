<?php if (!isset($_GET['ajax']) && !isset($_POST['ajax'])) {?><!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<?php 
if (isset($_SERVER['SCRIPT_FILENAME']))
{
	$_theme_include_path = dirname($_SERVER['SCRIPT_FILENAME']) . '/catalog/view/theme/ruby/';
}
else if (isset($_SERVER['DOCUMENT_ROOT']))
{
	$_theme_include_path = $_SERVER['DOCUMENT_ROOT'] . '/catalog/view/theme/ruby/';
}
else $_theme_include_path = dirname(__FILE__) . '/../../';

$settings_file_name = 'settings.inc';
$settings_css_file_name = 'editor_settings.css';
/*demo*/if ($_SERVER['SERVER_NAME'] == 'ruby2.nicolette.ro') {$settings_file_name = 'settings2.inc';$settings_css_file_name = 'editor_settings2.css';}
global $last_modification_ts;
$last_modification_ts = filemtime($_theme_include_path . 'nico_theme_editor/' . $settings_file_name);
include($_theme_include_path . 'nico_theme_editor/' . $settings_file_name);
?>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=10.0; user-scalable=1;" />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="apple-touch-icon" href="/apple-touch-icon.png">

  <!--[if lt IE 9]>
  <script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ruby/stylesheet/stylesheet.css" />
<link class="_editor_css" href='catalog/view/theme/ruby/nico_theme_editor/<?php echo $settings_css_file_name;?>?ts=<?php echo $last_modification_ts;?>' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ruby/stylesheet/dropkick.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script>window.jQuery || document.write("<script src='catalog/view/theme/ruby/js/jquery-1.8.3.min.js'><\/script>")</script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<!-- script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script -->
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/theme/ruby/js/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ruby/js/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/theme/ruby/js/jquery.dropkick-1.0.0.js"></script>
<script type="text/javascript" src="catalog/view/theme/ruby/js/common.js"></script>
<script type="text/javascript" src="catalog/view/theme/ruby/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="catalog/view/theme/ruby/js/jquery.dlmenu.js"></script>
<script type="text/javascript" src="catalog/view/theme/ruby/js/ruby.js"></script>
<?php foreach ($scripts as $script) { if (strpos($script, 'nivo.slider') == false) {?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } } ?>
<?php echo $google_analytics; ?>
</head>
<body>

<!--<?php include($_theme_include_path . '/nico_theme_editor/editor.inc');?>-->
<link href='https://fonts.googleapis.com/css?family=Montserrat|Open+Sans:200,300,400,600,700&amp;subset=<?php echo CHARSET;?>' rel='stylesheet' type='text/css' />
<div id="container">
  <?php if ($logo) { ?>
	<div id="logo">
		<a href="<?php echo $home; ?>">
			<!--<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />-->
		<span><?php echo $name; ?></span>
		</a>
	</div>
  <?php } ?>

<!--header start-->
<div id="header">
  
<?php function _opencart_menu(&$categories)
{
?>
	<?php foreach ($categories as $category) { ?>
	<li><a href="<?php echo $category['href']; ?>" <?php if ($category['children']) {?> class="parent"<?php } ?>><?php echo $category['name']; ?></a>
	  <?php if ($category['children']) { ?>
		<?php if (isset($category['thumb'])) {?><div class="img"><img src="<?php echo $category['thumb'];?>"></div><?php }?>  
		<ul class="submenu cols<?php echo $category['column'];?>">
		  <?php for ($i = 0; $i < count($category['children']);$i++) { ?>
		  <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
		  <?php } ?>
		</ul>
	  <?php } ?>
	  
	</li>
	<?php } ?>
<?php };?>	

  <?php if (!isset($_nico_settings['settings']['menu_search']) || $_nico_settings['settings']['menu_search'] == 'left') {?>
  <div id="search" class="clearfix">
	  <?php if (isset($search)) {?>
	  <input type="text" name="search" placeholder="<?php if (isset($text_search)) echo $text_search; ?>" value="<?php if (isset($search)) echo $search; ?>" />
	  <?php } else {?>
		<?php if (isset($filter_name)) { ?>
			<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /> 
		<?php } else { ?>
			<input type="text" id="search_input" name="filter_name" value="<?php echo $text_search;?>"/>
		<?php } ?>
	  <?php }?>	
	  <div class="button-search"></div>
  </div>
  <?php } ?>
  
  $column_left

  <div class="clearfix lang">
  <?php if (!isset($_nico_settings['settings']['menu_language']) || $_nico_settings['settings']['menu_language'] == 'left') {?>
  <?php echo $language; ?>
  <?php } ?>

  <?php if (!isset($_nico_settings['settings']['menu_currency']) || $_nico_settings['settings']['menu_currency'] == 'left') {?>
  <?php echo $currency; ?>
  <?php } ?>
  </div>
    
  <div id="welcome">
	<?php if (!$logged) { ?>
	<?php echo $text_welcome; ?>
	<?php } else { ?>
	<?php echo $text_logged; ?>
	<?php } ?>
  </div>
  <!-- <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div> -->


    <ul class="sicons">
      <?php if (isset($_nico_settings['settings']['twitter']) && !empty($_nico_settings['settings']['twitter']))  { ?><li><a target="_blank" href="<?php 
		echo "#"/*$_nico_settings['settings']['twitter']*/;?>" id="twitter">
      <span><img src="catalog/view/theme/ruby/image/twitter.png" alt="Twitter"/></span></a></li>
      <?php }?>
      <?php if (isset($_nico_settings['settings']['facebook']) && !empty($_nico_settings['settings']['facebook']))  { ?><li><a target="_blank" href="<?php 
		echo "#";/*$_nico_settings['settings']['facebook'];*/?>" id="facebook">
      <span><img src="catalog/view/theme/ruby/image/facebook.png" alt="Facebook"/></span></a></li>
      <?php }?>
      <?php if (isset($_nico_settings['settings']['google']) && !empty($_nico_settings['settings']['google']))  { ?><li><a target="_blank" href="<?php 
		echo "#"/*$_nico_settings['settings']['google']*/;?>" id="google">
      <span><img src="catalog/view/theme/ruby/image/google.png" alt="Google"/></span></a></li>
      <?php }?>
      <?php if (isset($_nico_settings['settings']['instagram']) && !empty($_nico_settings['settings']['instagram']))  { ?><li><a target="_blank" href="<?php 
		echo $_nico_settings['settings']['instagram'];?>" id="instagram">
      <span><img src="catalog/view/theme/ruby/image/instagram.png" alt="Instagram"/></span></a></li>
      <?php }?>
      <?php if (isset($_nico_settings['settings']['pinterest']) && !empty($_nico_settings['settings']['pinterest']))  { ?><li><a target="_blank" href="<?php 
		echo $_nico_settings['settings']['pinterest'];?>" id="pinterest">
      <span><img src="catalog/view/theme/ruby/image/pinterest.png" alt="Pinterest"/></span></a></li>
      <?php }?>
      <?php if (isset($_nico_settings['settings']['rss']) && !empty($_nico_settings['settings']['rss']))  { ?><li><a target="_blank" href="<?php 
		echo $_nico_settings['settings']['rss'];?>" id="rss">
      <span><img src="catalog/view/theme/ruby/image/rss.png" alt="Rss"/></span></a></li>
      <?php }?>
    </ul>
</div>
<!--header end-->

<div id="header-top">

	<div id="menu" class="clearfix not_mobile">
	  <div class="menu">
		<?php	
		$current_lang = $this->language->get('code');
		function generate_menu(&$categories, &$current_lang, &$opencart_categories)
		{
		?>	 
		<ul class="submenu">
		<?php 
		if (isset($categories))
		foreach($categories as $category)
		{
			if (isset($category['categories'])) _opencart_menu($opencart_categories); else {
		?>
		<li>
			<a href="<?php if(isset($category['url'])) echo $category['url'];?>"  <?php if (isset($category['children'])) {?> class="parent"<?php } ?>>
			<?php if (isset($category['text'][$current_lang])) echo $category['text'][$current_lang];else if (isset($category['text'][key($category['text'])])) echo $category['text'][key($category['text'])];?>
			</a>
		<?php if (isset($category['children'])) { echo generate_menu($category['children'], $current_lang, $opencart_categories);}?>
		</li>
		<?php } } ?>
		 </ul>	
		<?php } generate_menu($_nico_settings['menu'], $current_lang, $categories);?>	  
	  </div>
	</div>


	<div id="dl-menu" class="dl-menuwrapper">
		<button class="dl-trigger">Open Menu</button>
		<?php	
		$current_lang = $this->language->get('code');
		$first_level = true;
		function generate_mobile_menu(&$categories, &$current_lang, &$opencart_categories, &$first_level)
		{
		?>	 
		<ul<?php if ($first_level) {echo ' class="dl-menu"';$first_level = false;}?>>
		<?php 
		foreach($categories as $category)
		{
			if (isset($category['categories'])) _opencart_menu($opencart_categories); else {
		?>
		<li>
		<a href="<?php if (isset($category['url'])) echo $category['url'];?>">
			<?php if (isset($category['text'][$current_lang])) echo $category['text'][$current_lang];else if (isset($category['text'][key($category['text'])])) echo $category['text'][key($category['text'])];?>	
		</a>
		<?php if (isset($category['children'])) { echo generate_menu($category['children'], $current_lang, $opencart_categories);}?>
		</li>
		<?php } } ?>
		 </ul>	
		<?php } generate_mobile_menu($_nico_settings['menu'], $current_lang, $categories, $first_level);?>	  
	</div>



  <?php echo $cart; ?>

  <?php if (isset($_nico_settings['settings']['menu_search']) && $_nico_settings['settings']['menu_search'] == 'top') {?>
  <div id="search" class="clearfix">
	  <?php if (isset($search)) {?>
	  <input type="text" name="search" placeholder="<?php if (isset($text_search)) echo $text_search; ?>" value="<?php if (isset($search)) echo $search; ?>" />
	  <?php } else {?>
		<?php if (isset($filter_name)) { ?>
			<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /> 
		<?php } else { ?>
			<input type="text" id="search_input" name="filter_name" value="<?php echo $text_search;?>"/>
		<?php } ?>
	  <?php }?>	
	  <div class="button-search"></div>
  </div>
  <?php } ?>
  
  <?php if (isset($_nico_settings['settings']['menu_language']) && $_nico_settings['settings']['menu_language'] == 'top') {?>
	<?php echo $language; ?>
  <?php } ?>

  <?php if (isset($_nico_settings['settings']['menu_currency']) && $_nico_settings['settings']['menu_currency'] == 'top') {?>
	<?php echo $currency; ?>
  <?php } ?>



</div>

<?php if (isset($error) && $error) { ?>
    
    <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
    
<?php } ?>
<div id="notification"></div>
<?php }?>
