<?php 
global $module_row, $module_name, $module_config, $config_size, $button_remove_txt;
$button_remove_txt = $button_remove;
$module_name = 'niconewsletter';

foreach ($layouts as $layout) 
{
	$_layouts[$layout['layout_id']] = $layout['name'];
}	

$module_config = array(
	'type group',
	'type'=>array('select', 
					array('0' => 'Mailchimp newsletter',
						  '1' => 'Opencart newsletter')
				),
	'mailchimp group',
	'app'=>array('input'),
	'api_key'=>array('input'),
	'list_id'=>array('input'),
	'layout group',
	'layout_id'=>array('select', $_layouts),
	'position group',
	'position'=>array('select', 
					array('content_top' => $text_content_top,
					'content_bottom' => $text_content_bottom,
					'column_left' => $text_column_left,
					'column_right' => $text_column_right)
				),
	'status group',
	'status'=>array('select', 
					array('1' => $text_enabled,
						  '0' => $text_disabled)
				),
	'sort group',
	'sort_order'=>array('input'),
);

$config_size =  count($module_config);

function module_row($module = null)
{
	global $module_row, $button_remove, $module_config, $config_size, $module_name, $button_remove_txt;
	?>
	 <tbody id="module-row<?php echo $module_row; ?>">
		<tr>
<?php
	$elements_count = 0;
	foreach ($module_config as $input => $type)
	{
			if (is_array($type))
			{
				switch ($type[0])
				{
					case'input':
					?>
					<input type="text" size="5" name="<?php echo $module_name;?>_module[<?php echo $module_row; ?>][<?php echo $input; ?>]" value="<?php if (isset($module) && isset($module[$input])) echo $module[$input]; ?>"/>
					<?php
					break;
					case'select':
					?>
					<select name="<?php echo $module_name;?>_module[<?php echo $module_row; ?>][<?php echo $input; ?>]" >
					  <?php foreach($type[1] as $value => $name) {?>
						<option value="<?php echo $value;?>" <?php if (isset($module) && isset($module[$input]) && $module[$input] == $value) {?>selected="selected"<?php } ?>><?php echo $name;?></option>
					  <?php }?>
					</select>
					<?php
					break;
				}
			} else 
			{
				if ($elements_count == 0) echo '<td class="left">'; elseif ($elements_count == $config_size) echo '</td>'; else echo '</td><td class="left">'; 
			}
			$elements_count++;
	}
?>
		  <td class="left"><a onclick="$(this.parentNode.parentNode.parentNode).remove();" class="button"><?php echo $button_remove_txt; ?></a></td>
		</tr>
	  </tbody>
<?php
}
?>
<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left">Type</td>
              <td class="left">Mailchimp - App name | Api key | list id</td>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { module_row($module);?>
        
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="6"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>


<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() 
{	
<?php 	
ob_start();

module_row();

$html = str_replace(array("\n", "\r"), '', ob_get_contents());
$html =  addslashes(preg_replace('/\s+/', ' ', $html));
ob_end_clean();
?>

html = '<?php echo $html;?>';
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script> 
<?php echo $footer; ?>
