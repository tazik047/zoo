<?php
/*
 * Nico open cart theme editor module
 * Copyright Tunaru Nicoleta
 * All rights reserved
 */

define('DEMO', false);
define('CHARSET', 'all');

require_once(DIR_SYSTEM . 'library/user.php');
$user = new User($this->registry);
define('HAS_PERMISSION', $user->hasPermission('modify', 'design/layout'));
$dirname = dirname(__FILE__);
//$last_modification_ts = filemtime(dirname(__FILE__) . '/settings.inc');


if (HAS_PERMISSION || DEMO)
{
	$settings_file_name = 'settings.inc';
	$settings_css_file_name = 'editor_settings.css';
	/*demo*/if ($_SERVER['SERVER_NAME'] == 'ruby2.nicolette.ro') {$settings_file_name = 'settings2.inc';$settings_css_file_name = 'editor_settings2.css';}
	include(dirname(__FILE__) . '/' . $settings_file_name);

	if ($_POST && HAS_PERMISSION)
	{
		if (isset($_POST['_nico_save_theme']))
		{
			unset($_POST['_nico_save_theme']);
			
			if (!isset($_nico_settings)) $_nico_settings = array();
			
			unset($_nico_settings['slider_text']);
			unset($_nico_settings['menu']);
			
/*			if (isset($_POST['menu']))
			{
				//$_POST['menu'] = array_merge($_POST['menu']);
				var_dump($_POST['menu']);

				//array_walk_recursive($fruits, 'test_print');

			}
*/				
			$_nico_settings = array_merge_recursive($_nico_settings, $_POST);
			
			$css = '';


			if (isset($_nico_settings['styles'])) foreach($_nico_settings['styles'] as $group => &$css_file)
			{
				if (is_array($css_file)) 
				{
					$css_file = end($css_file);
					//$_nico_settings['styles'][$group] = $css_file;
				}
			}			
			

			if (isset($_nico_settings['styles'])) 
			{
				foreach($_nico_settings['styles'] as $group => $cssfile) 
				if (!empty($cssfile))
				{
					//echo $cssfile;
					$css .= "\n\n/* " . $group . ' - ' . $cssfile . " */\n\n";
					$css .= file_get_contents($dirname. '/styles/' . $cssfile);
				}
			}

			if (isset($_nico_settings['options'])) foreach($_nico_settings['options'] as $selector => &$data)
			{
				$attributes = '';
				foreach ($data as $attribute => &$value)
				{
					if (is_array($value)) 
					{
						$value = end($value);
					}
						//$_nico_settings['colors'][$selector][$attribute] = $value;
					$attributes .= $attribute . ':' . $value .';';
				}
				if ($attributes) $css .= $selector . '{' . $attributes . "}\n";
			}			
			
			if (isset($_nico_settings['colors'])) foreach($_nico_settings['colors'] as $selector => &$data)
			{
				foreach ($data as $attribute => &$color)
				{
					if (is_array($color)) 
					{
						$color = end($color);
						$_nico_settings['colors'][$selector][$attribute] = $color;
					}
					$css .= $selector . '{' . $attribute . ':' . $color . "}\n";
				}
			}

			$fonts = array();
			if (isset($_nico_settings['fonts'])) foreach($_nico_settings['fonts'] as $selector => &$font)
			{
				if (isset($font['font-family']) && is_array($font['font-family'])) 
				{
					$font['font-family'] = end($font['font-family']);
				}
				
				if (isset($font['size']) && is_array($font['size'])) 
				{
					$font['size'] = end($font['size']);
				}
				
				$font_size = '';
				$font_family = '';
				
				if (isset($font['font-family']) && !empty($font['font-family'])) 
				{
					$font_family = 'font-family:\'' . $font['font-family'] . '\';';
				}
				
				if (isset($font['size']) && !empty($font['size'])) 
				{
					$font_size = 'font-size:' . $font['size'] . 'px';
				}
				
				if (!empty($font_family) || !empty($font_size))
				{
					$css .= $selector . '{' .$font_family . $font_size . '}' ."\n";
					if (isset($font['font-family'])) $fonts[] = urlencode($font['font-family']);
				}
			}

			if ((isset($_nico_settings['background-image']) && $_nico_settings['background-image'] != 'disabled') || isset($_nico_settings['background-style']))
			{	
				if (is_array($_nico_settings['background-image'])) 
				{
					$_nico_settings['background-image'] = end($_nico_settings['background-image']);
				}

				if (isset($_nico_settings['background-style']) && is_array($_nico_settings['background-style'])) 
				{
					$_nico_settings['background-style'] = end($_nico_settings['background-style']);
				}

				$background_style = '';
				if (isset($_nico_settings['background-style'])) switch($_nico_settings['background-style'])
				{
					case 'repeat':
						$background_style = 'background-repeat:repeat';
					break;
					case 'repeat-x':
						$background_style = 'background-repeat:repeat-x';
					break;
					case 'repeat-y':
						$background_style = 'background-repeat:repeat-y';
					break;
					case 'stretch':
						$background_style = 'background-size:100%;background-size:cover';
					break;
					case 'no-repeat':
						$background_style = 'background-repeat:no-repeat';
					break;
				}
				
				$css .= 'body { background-image: '. urldecode($_nico_settings['background-image']) . ';' . $background_style . "}\n\n";	
			}
			
			if (isset($_nico_settings['sliders'])) foreach($_nico_settings['sliders'] as $page => &$sliders)
			{
				if (isset($sliders)) foreach($sliders as $slider => &$options)
				{
					if ($slider == 'active')
					{
						if (is_array($options)) 
						{
							$options = end($options);
						}
					} else
					foreach($options as $_name => &$data)
					{
						if (is_array($data)) 
						{
							$data = end($data);
							//$_nico_settings['sliders'][$page][$slider][$_name] = $data;
						}
					}
				}
			}
			
			if (isset($_nico_settings['settings'])) foreach($_nico_settings['settings'] as $selector => &$data)
			{
				if (is_array($data)) 
				{
					$data = end($data);
					//$_nico_settings['settings'][$selector] = $data;
				}
			}			
			
			if (isset($fonts) && !empty($fonts))
			{
				$fonts = array_unique($fonts);
				$font_names = implode( '|', $fonts);

				if (!empty($font_names))
				$css = '@import url(https://fonts.googleapis.com/css?family=' . $font_names . '&subset=' . CHARSET . ");\n\n" . $css;	
			}
			
			file_put_contents(dirname(__FILE__) . '/' . $settings_css_file_name, html_entity_decode($css));
			file_put_contents(dirname(__FILE__) . '/' . $settings_file_name, 
			'<?php $_nico_settings  = ' . var_export($_nico_settings, true) . ';');
			die('saved');
			
		} else if (isset($_POST['_nico_reset_theme']))
		{
			file_put_contents($dirname . '/editor_settings.css', '');
			file_put_contents($dirname. '/settings.inc', '');
			die('saved');
		}
	}
	
	include('nico_config.inc');
	$editor_path = 'catalog/view/theme/ruby/nico_theme_editor/';

	$nico_languages = $this->model_localisation_language->getLanguages();
?>	
<link href='<?php echo $editor_path;?>editor_panel.css' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="<?php echo $editor_path;?>colorpicker/js/colorpicker.js"></script>
<link rel="stylesheet" href="<?php echo $editor_path;?>colorpicker/css/colorpicker.css" type="text/css" />
<script src="<?php echo $editor_path;?>jquery.jstree.js"></script>
<script>
var _nico_demo = <?php if (DEMO || !HAS_PERMISSION) echo 'true'; else echo 'false';?>;
var _editor_path = "<?php echo $editor_path;?>";
var lang = [<?php
	$first = true;
	foreach ($nico_languages as $lang)
	{
		if ($first) { $first = false;} else echo ',';
		echo '"' . $lang['code'] . '"';
	}
?>];
var current_lang = '<?php echo $this->language->get('code');?>';
var is_writable = <?php if (is_writable($dirname. '/settings.inc')) echo 'true'; else echo 'false';?>;
</script>
<script src="<?php echo $editor_path;?>editor.js"></script>

	<div id="nico_theme_editor">
		<a href="#" id="show_hide_editor" class="no_mobile">Customize theme</a>

		<a href="#" id="nico_save_settings" class="no_mobile">Save settings</a>
		<div id="nico_zoom"  class="no_mobile">
			<a href="#" id="nico_zoom_bottomscreen" title="Bottom screen">Bottom screen</a>
			<a href="#" id="nico_zoom_halfscreen" title="Half screen">Half screen</a>
			<a href="#" id="nico_zoom_fullscreen" title="Full screen">Full screen</a>
		</div>
		
		<a href="#" id="nico_reset" class="no_mobile">Reset to default theme settings</a>

		<ul class="nico_tabs">
			<li class="selected">Styles</li>
			<li>Colors</li>
			<li>Fonts</li>
			<li>Sliders &amp; Gallery</li>
			<li>Options</li>
			<li>Settings</li>
			<li>Menu editor</li>
			<li>Slider text</li>
			<li>Background</li>
		 </ul>
		 
		
	 <div class="nico_tab">
		 <div>
			<?php 
			$current_group = '';
			$pattern_dir = $dirname . '/styles';
			if (is_dir($pattern_dir)) {
				if ($dh = opendir($pattern_dir)) 
				{
					while (($file = readdir($dh)) !== false) 
					{
						if ($file[0] != '.' && strrpos($file, '.css') != false) 
						{
							if (!preg_match('@([a-zA-Z_]+)-([a-zA-Z_]+)\.css@', $file, $matches)) continue;
							
							$group = $matches[1];
							$group_title = ucfirst(str_replace('_', ' ', $matches[1]));
							$_name = str_replace('_', ' ', $matches[2]);
							$image = str_replace('.css', '.png', $file);
							$_nico_styles[$group][] = array('name' => $_name, 'image' => $image, 'file' => $file);
						}
					}
					closedir($dh);
					ksort($_nico_styles);
				 }	
				 
				 foreach($_nico_styles as $group => $_nico_styles)
				 {
							?>  <div style="display:inline-block;margin-right:10px;">
								<h2><span><?php echo ucfirst(str_replace('_', ' ',$group));?></span></h2>
								 <div class="style">
									 <div class="value <?php echo $group;?>" file="" group="<?php echo $group;?>"css=""></div>
									 <div class="name">Default style</div>
								</div>
					<?php foreach ($_nico_styles as $style) 
					{?>
					 <div class="style">
						 <div class="value <?php echo $group;if (isset($_nico_settings['styles'][$group]) && $style['file'] == $_nico_settings['styles'][$group]) echo ' selected';?>" group="<?php echo $group;?>" file="<?php echo $style['file'];?>" css="<?php echo $editor_path . 'styles/' . $style['file'];?>" style="background-image:url('<?php echo $editor_path . 'styles/' . $style['image']?>');"></div>
						 <div class="name"><?php echo ucfirst($style['name']);?></div>
					</div>
					<?php } ?></div><?php } }?>			 
			</div>
		 </div>				 
			
		 <div class="nico_tab">
			 <div>
<?php foreach ($nico_colors as $_name => $options) {
			if (is_array($options))
			{?>			 
			 <div class="color">
				 <div class="value" selector="<?php echo $options[0];?>" attribute="<?php echo $options[1];?>" default="<?php if (isset($_nico_settings['colors'][$options[0]][$options[1]])) echo $_nico_settings['colors'][$options[0]][$options[1]];?>"></div>
				 <div class="name"><?php echo $_name;?></div>
			 </div>
<?php } else { ?><h2><span><?php echo $options;?></span></h2><?php } }?> 
			</div>
		 </div>
		 <div class="nico_tab">
			<div>
<?php foreach ($nico_fonts as $_name => $option) {			
			if (!empty($option))
			{?>			 
			 <div class="font">
				 <div class="name"><?php echo $_name;?></div>
				 <div class="value">
					 <select class="_font_select" selector="<?php echo $option;?>" default="<?php if (isset($_nico_settings['fonts'][$option]['font-family'])) echo $_nico_settings['fonts'][$option]['font-family'];?>">
					 </select>
					 <select class="_font_select_size" selector="<?php echo $option;?>" default="<?php if (isset($_nico_settings['fonts'][$option]['size'])) echo $_nico_settings['fonts'][$option]['size'];?>">
					 </select>
				 </div>
			 </div>
<?php } else { ?><h2><span><?php echo $_name;?></span></h2><?php } }?> 
			</div>
		 </div>
		 
		 

	
		 	<div class="nico_tab sliders">
			<div>
				<?php $_first = array();foreach($nico_sliders as $page => $sliders) 
				{
				?>
					<h2><?php echo $page;?></h2>
					<div>
				<?php 
				    foreach($sliders as $slider => $options)
				    {
					   ?>
					   <div class="label_option">
					   <input type="radio" name="<?php echo $page;?>" _name="<?php echo $page;?>" page="<?php echo $page;?>" 
					   value="<?php echo $slider;?>" id="<?php echo $page . '_' . $slider;?>"
					   <?php if ((isset($_nico_settings['sliders'][$page]['active']) && $_nico_settings['sliders'][$page]['active'] == $slider) || (!isset($_nico_settings['sliders'][$page]['active']) && !isset($_first[$page]))) {echo 'checked="checked"';};?>>
					   <label for="<?php echo $page . '_' . $slider;?>"><?php echo $slider;?></label>
					   </div>
						   <div class="slider_container"<?php if ((isset($_nico_settings['sliders'][$page]['active']) && $_nico_settings['sliders'][$page]['active'] == $slider) || (!isset($_nico_settings['sliders'][$page]['active']) && !isset($_first[$page]))) {$_first[$page] = true;echo ' style="display:block"';};?>>
						   <?php
						   foreach($options as $_name => $option)
						   { ?>
								 <div class="slider">
									 <div class="name"><?php echo $_name;?></div>
									 <div class="value">
									<?php switch ($option['type']) {
									case 'text':
									case 'href':?>
										<input type="text" name="<?php echo $page . '['  . $slider . '[' . $option['name'] . ']]' ;?>" _name="<?php echo $option['name'];?>"
										slider="<?php echo $slider;?>" page="<?php echo $page?>"
										value="<?php if (isset($_nico_settings['sliders'][$page][$slider][$option['name']])) 
												echo $_nico_settings['sliders'][$page][$slider][$option['name']]; else echo $option['default']; ?>"/>
								<?php  break;
									case 'color':?>
										<div class="color">
										<div class="value" selector="" slider="<?php echo $slider;?>" page="<?php echo $page?>"
												slider="<?php echo $slider;?>" page="<?php echo $page?>"
												_name="<?php echo $option['name'];?>"
												attribute="<?php if (isset($_nico_settings['sliders'][$page][$slider][$option['name']])) 
												echo $_nico_settings['sliders'][$page][$slider][$option['name']]; else echo $option['default'];?>">
										</div>
										</div>
									<?php break;
										  case 'textarea': 
									?>
										<textarea name="<?php echo $page . '['. $slider . '[' . $_name . ']]';?>" _name="<?php echo $_name;?>"> slider="<?php echo $slider;?>" page="<?php echo $page?>"
										if (isset($_nico_settings['sliders'][$page][$slider][$option['name']])) 
										echo $_nico_settings['sliders'][$page][$slider][$option['name']];?></textarea>
									<?php break;
										  case 'select': 
									?>
									
										<select name="<?php echo $page . '['. $slider . '[' . $_name . ']]';?>" _name="<?php echo $option['name'];?>" slider="<?php echo $slider;?>" page="<?php echo $page?>">
										<?php foreach ($option['options'] as $opt) { ?>
										<option value="<?php echo $opt;?>" <?php if ((isset($_nico_settings['sliders'][$page][$slider][$option['name']]) && 
										 $_nico_settings['sliders'][$page][$slider][$option['name']] == $opt) || $opt == $option['default'])  echo 'selected="selected"';?>><?php echo $opt;?></option><?php } ?>
										</select>
									<?php break;
										  case 'bool': 
									?>
										<input type="radio" name="<?php echo $page . '['. $slider . '[' . $option['name'] . ']]';?>" _name="<?php echo $option['name'];?>" id="<?php echo $page . '_' . $_name . '_' . $option['name'] . '_yes';?>" 
										value="true" slider="<?php echo $slider;?>" page="<?php echo $page?>"
										<?php if ((isset($_nico_settings['sliders'][$page][$slider][$option['name']]) 
												&& $_nico_settings['sliders'][$page][$slider][$option['name']] != 'false') 
												|| (isset($option['default']) && $option['default'] != 'false')) 
												echo 'checked="true"';?>/>
										<label for="<?php echo $page . '_' . $_name . '_' . $option['name'] . '_yes';?>">yes</label>

										<input type="radio" name="<?php echo $page . '['. $slider . '[' . $option['name'] . ']]';?>" _name="<?php echo $option['name'];?>" id="<?php echo $page . '_' . $_name . '_' . $option['name'] . '_no';?>" 
										value="false" slider="<?php echo $slider;?>" page="<?php echo $page?>"
										<?php if ((isset($_nico_settings['sliders'][$page][$slider][$option['name']]) 
												&& $_nico_settings['sliders'][$page][$slider][$option['name']] == 'false')
												 || (!isset($_nico_settings['sliders'][$page][$slider][$option['name']]) && isset($option['default']) && $option['default'] == 'false')) 
												echo 'checked="true"';?>/>
										<label for="<?php echo $page . '_' . $_name . '_' . $option['name'] . '_no';?>" >no</label>
									<?php break;
									   }
									?>
									 </div>
								 </div>
						   <?php
						   } ?>
						   </div>
						  <?php 
					   }?></div>
				<?php } ?>
		 </div>
		</div>

		 <div class="nico_tab">
			<div>
<?php foreach ($nico_options as $_name => $options) {
				if (is_array($options))
			{?>			 
			<div class="option">
				 <div class="name"><?php echo $_name;?></div>
				<select class="value" selector="<?php echo $options[0];?>" attribute="<?php echo $options[1];?>" name="<?php echo $options[1];?>"><?php 
					foreach ($options[2] as $title => $value) {?><option value="<?php echo $value;?>"<?php if (isset($_nico_settings['options'][$options[0]][$options[1]]) 
							&& $_nico_settings['options'][$options[0]][$options[1]] == $value) echo ' selected="selected"';?>><?php echo $title;?></option><?php }?>			 			 						
				</select>
			</div>
<?php } else { ?><h2><span><?php echo $options;?></span></h2><?php } }?> 
		 </div>
	</div>
	
	 <div class="nico_tab">
			<div>
<?php foreach ($nico_settings as $_name => $setting) {
			if (is_array($setting))
			{?>			 
			 <div class="setting">
				 <div class="name"><label title="<?php echo $_name;?>"><?php echo $_name;?></label></div>
				 <div class="value">
				<?php switch ($setting[2]) {
			    case 'text':
			    case 'href':?>
					<input type="text" name="<?php echo $setting[1];?>" selector="<?php echo $setting[0];?>"  attribute="<?php echo $setting[2];?>"
					value="<?php if (isset($_nico_settings['settings'][$setting[1]])) 
							echo $_nico_settings['settings'][$setting[1]];?>"/>
				<?php break;
				 	  case 'textarea': 
				?>
					<textarea name="<?php echo $setting[1];?>" selector="<?php echo $setting[0];?>" attribute="<?php echo $setting[2];?>"><?php 
					if (isset($_nico_settings['settings'][$setting[1]])) 
					echo $_nico_settings['settings'][$setting[1]];?></textarea>
				<?php break;
				 	  case 'checkbox': 
				?>
					<input type="checkbox" name="<?php echo $setting[1];?>" selector="<?php echo $setting[0];?>"  attribute="<?php echo $setting[2];?>"
					<?php if (isset($_nico_settings['settings'][$setting[1]]) 
							&& $_nico_settings['settings'][$setting[1]] != 'false') 
							echo 'value="true" checked="checked"'; else echo 'value="false"';?>/>
				<?php break;
				 	  case 'select': 
				?>
					<select name="<?php echo $setting[1];?>" selector="<?php echo $setting[0];?>"  attribute="<?php echo $setting[2];?>">
					<?php 
						foreach($setting[3] as $_name => $value)
						{?>
							<option value="<?php echo $value;?>"<?php if (isset($_nico_settings['settings'][$setting[1]]) 
							&& $_nico_settings['settings'][$setting[1]] == $value) echo ' selected="selected"';?>><?php echo $_name;?></option><?php	
						}
					?>
					</select>
				<?php break;
				   }
				?>
				 </div>
			 </div>
<?php } else { ?><h2><span><?php echo $setting;?></span></h2><?php } }?> 
		 </div>
	</div>


	
		 <div class="nico_tab nico_menu">
			<div>
				<p>Click on a menu item to edit language text or url, add or remove menu items or reorder them by drag and drop.</p>
			<div id="nico_menu">
			<?php	
			$current_lang = $this->language->get('code');
			function _nico_generate_menu(&$categories, &$current_lang, &$nico_languages)
			{
			?>	 
		    <ul>
 			<?php 
 			if (isset($categories))
 			foreach($categories as $category)
			{
			?>
			<li <?php if (isset($category['categories'])){?> class="categories"<?php }?>>
				<a href=""><?php if (isset($category['text'][$current_lang])) echo $category['text'][$current_lang]; else if (isset($category['categories'])) echo 'Opencart categories';else if (isset($category['text']['en'])) echo $category['text']['en'];  ?></a>
				
							 <div>
									<label>url</label> <input type="text" name="url" value="<?php if (isset($category['url'])) echo $category['url'];?>"/>							 
									<?php foreach ($nico_languages as $nico_language) {?>
										<img alt="<?php echo $nico_language['name'];?>" title="<?php echo $nico_language['name'];?>" src="admin/view/image/flags/<?php echo $nico_language['image'];?>"/>
										<input type="text" name="<?php if (isset($nico_language['code'])) echo $nico_language['code'];?>" title="<?php echo $nico_language['name'];?>" value="<?php if (isset($nico_language['code']) && isset($category['text'][$nico_language['code']])) echo $category['text'][$nico_language['code']];?>"/>
									<?php } ?>
									<button href="#" title="Add subcategory" class="add_subcat button small white" >
										<img src="catalog/view/theme/ruby/nico_theme_editor/themes/classic/add_subcat.png"/>
										add subcat
									</button>
									<button href="#" title="Remove" class="remove button small white" >
										<img src="catalog/view/theme/ruby/nico_theme_editor/themes/classic/delete.png"/>
										remove
									</button>
						</div>
			<?php if (isset($category['children'])) { echo 'recurse';_nico_generate_menu($category['children'], $current_lang, $nico_languages);}?>
			</li>
			<?php } ?>
			 </ul>	
			 <?php } _nico_generate_menu($_nico_settings['menu'], $current_lang, $nico_languages);?>
			</div>
			<button class="button medium blue" type="submit" id="nico_add_menu_item">Add new menu item</button>
			<button class="button medium blue" type="submit" id="nico_add_ocmenu_item">Add opencart categories</button>

				 <div class="nico_new_menu_item_template">
						<label>url</label> <input type="text" name="url" value="<?php if (isset($category['url'])) echo $category['url'];?>"/>							 
						<?php foreach ($nico_languages as $nico_language) {?>
							<img alt="<?php echo $nico_language['name'];?>" title="<?php echo $nico_language['name'];?>" src="admin/view/image/flags/<?php echo $nico_language['image'];?>"/>
							<input type="text" name="<?php echo $nico_language['code'];?>" title="<?php echo $nico_language['name'];?>" value="Menu item"/>
						<?php } ?>
						<button href="#" title="Add subcategory" class="add_subcat button small white" >
							<img src="catalog/view/theme/ruby/nico_theme_editor/themes/classic/add_subcat.png"/>
							add subcat
						</button>
						<button href="#" title="Remove" class="remove button small white" >
							<img src="catalog/view/theme/ruby/nico_theme_editor/themes/classic/delete.png"/>
							remove
						</button>
				</div>
		    </div> 
		 </div>		
	
	
	
	 <div class="nico_tab">
			<ul class="nico_slide_text">
				 <?php 
				    $first = true; 
					foreach ($nico_languages as $lang) {
				 ?>
				<li<?php if ($first) {$first = false;echo ' class="selected"';}?>><?php echo $lang['name'];?></li>
				<?php } ?>
			 </ul>

		 <?php 
		    reset($nico_languages);
			foreach ($nico_languages as $lang) 
			{
		 ?>
			<div class="nico_slide_text lang_<?php echo $lang['code'];?>">
				<div class="slider_text_btns">
					<a class="nico_add_slide" lang="<?php echo $lang['code'];?>" href="#">+ Add new slide text</a>
					<a class="nico_remove_slide"  lang="<?php echo $lang['code'];?>" href="#">- Remove last slide text</a>
				</div>
			
<?php if (isset($_nico_settings['slider_text']) && array($_nico_settings['slider_text']) && isset($_nico_settings['slider_text'][$lang['code']])) foreach ($_nico_settings['slider_text'][$lang['code']] as $index => $slide) { ?>
			 <div class="slider_text lang_<?php echo $lang['code'];?>">
				 <div class="value">
					<table>
					<tr>
						<td><label>Title</label></td>
						<td><input type="text" name="slider_title" value="<?php if (isset($slide['title'])) echo $slide['title'];?>"/></td>
					</tr>
					<!-- <tr>
						<td><label>Subtitle</label></td>
						<td><input type="text" name="slider_subtitle" value="<?php if (isset($slide['subtitle'])) echo $slide['subtitle'];?>"/></td>
					</tr> -->
					<tr>
						<td><label>Description</label></td>
						<td><textarea name="slider_description"><?php if (isset($slide['description'])) echo $slide['description'];?></textarea></td>
					</tr>
					</table>
				 </div>
			 </div>
<?php }?>
		 </div>
	  <?php } ?>
	</div>
	
	
		 <div class="nico_tab">
			 <div>
			 <div>
				 <div class="name">Background style</div>
				 <div class="value">
					<select name="background-style" id="background-style">
						<option value="repeat">Repeat</option>
						<option value="repeat-x">Repeat horizontally only</option>
						<option value="repeat-y">Repeat vertically only</option>
						<option value="stretch">Stretch</option>
						<option value="no-repeat">No repeat</option>
					</select>
				 </div>
			</div>


			 <div class="pattern">
				 <div class="name">Disable background pattern</div>
				 <div class="value" file="disable"></div>
			</div>
			<?php 
			$pattern_dir = $dirname . '/patterns';
			if (is_dir($pattern_dir)) {
				if ($dh = opendir($pattern_dir)) 
				{
					while (($file = readdir($dh)) !== false) 
					{
						$_name = str_replace(array('_', '-', '.png'), ' ', $file);
						if ($file[0] != '.') {
			?>
			 <div class="pattern">
				 <div class="name"><?php echo ucfirst($_name);?></div>
				 <div class="value" file="<?php echo $file;?>" style="background-image:url('<?php echo $editor_path . 'patterns/' . $file?>');"></div>
			</div>
<?php } } }  closedir($dh); }?>		
			<div>&nbsp;&nbsp;Note: To add custom background image just upload the png images to the <i>nico_theme_editor/patterns</i> folder and they will be available here.</div>
			Patterns from <a href="http://subtlepatterns.com/">subtlepatterns.com</a>
			</div>
		 </div>		
</div>


<div class="nico_status">
	<?php if (DEMO) {?>Saving is disabled in the DEMO version!<?php } else {?>Saving ... <?php }?>
</div>
<?php
}
?>
