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
              <td class="left">Title</td>
              <td class="left">Products</td>
              <td class="left"><?php echo $entry_image; ?></td>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
			  <td>
				  <?php foreach ($languages as $language) { ?>
				  <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
				  <input type="text" name="nicocustomproducts_module[<?php echo $module_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php if (isset($module['title'][$language['language_id']])) echo $module['title'][$language['language_id']]; ?>" size="30" />
				  <?php } ?>
				  </td>
            <td>
			<input type="text" name="product" value="" module="<?php echo $module_row; ?>" />
			<div id="nicocustomproducts-product-autocomplete-<?php echo $module_row; ?>" class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php if(isset($products[$module_row])) foreach ($products[$module_row] as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="nicocustomproducts-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <img src="view/image/delete.png" alt="" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
              <input type="hidden" name="nicocustomproducts_module[<?php echo $module_row; ?>][product_list]" value="<?php if (isset($module['product_list'])) echo $module['product_list']; ?>" />
              </td>
              <td class="left"><input type="text" name="nicocustomproducts_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="3" />
                <input type="text" name="nicocustomproducts_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="3" />
                <?php if (isset($error_image[$module_row])) { ?>
                <span class="error"><?php echo $error_image[$module_row]; ?></span>
                <?php } ?></td>
              <td class="left"><select name="nicocustomproducts_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="nicocustomproducts_module[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="nicocustomproducts_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="nicocustomproducts_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="7"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--

$(document).on("keyup.autocomplete", 'input[name=\'product\']', function()
{ 
$(this).autocomplete({
	delay: 500,
	source: function(request, response) 
	{
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) 
	{
		console.log(this);
		var module = jQuery(this).attr('module');
		console.log(module);
		$('#nicocustomproducts-product-autocomplete-' + module + ' #nicocustomproducts-product' + ui.item.value).remove();
		
		$('#nicocustomproducts-product-autocomplete-' + module).append('<div id="nicocustomproducts-product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" value="' + ui.item.value + '" /></div>');

		$('#nicocustomproducts-product-autocomplete-' + module + ' div:odd').attr('class', 'odd');
		$('#nicocustomproducts-product-autocomplete-' + module + ' div:even').attr('class', 'even');
		
		data = $.map($('#nicocustomproducts-product-autocomplete-' + module +' input'), function(element){
			return $(element).attr('value');
		});
		
		$('input[name=\'nicocustomproducts_module\['+ module + '\]\[product_list\]\']').attr('value', data.join());
					
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
});

$('#nicocustomproducts-product div img').live('click', function() {
	$(this).parent().remove();
	
	$('#nicocustomproducts-product div:odd').attr('class', 'odd');
	$('#nicocustomproducts-product div:even').attr('class', 'even');

	data = $.map($('#nicocustomproducts-product input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'nicocustomproducts_module\['+ module + '\]\[product_list\]\']').attr('value', data.join());	
});
//--></script> 
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr><td>';
	
	
	<?php foreach ($languages as $language) { ?>
	html += '            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><input type="text" name="nicocustomproducts_module[' + module_row + '][title][<?php echo $language['language_id']; ?>]" value="" size="30" />';
	<?php } ?>
	
	
	
	
	html += '</td>       <td><input type="text" name="product" module="' + module_row + '" value="" />';
	html += '            <div id="nicocustomproducts-product-autocomplete-' + module_row + '" class="scrollbox">';
	html += '              </div>';
	html += '              <input type="hidden" name="nicocustomproducts_module[' + module_row + '][product_list]" value="" />';
	html += '              </td>';
	html += '    <td class="left"><input type="text" name="nicocustomproducts_module[' + module_row + '][image_width]" value="200" size="3" /> <input type="text" name="nicocustomproducts_module[' + module_row + '][image_height]" value="256" size="3" /></td>';	
	html += '    <td class="left"><select name="nicocustomproducts_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="nicocustomproducts_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="nicocustomproducts_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="nicocustomproducts_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script> 
<style>
tbody 
{
  border-bottom: 2px dashed #ccc;
}
.list tbody td
{
	padding:5px;
}
</style>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addImage() {
    html  = '<tbody id="image-row' + module_row + '">';
	html += '<tr>';
    html += '<td class="left">';
	html += '<input type="text" name="banner_image[' + module_row + '][banner_image_description][<?php //echo $language['language_id']; ?>][title]" value="" /> <img src="view/image/flags/<?php //echo $language['image']; ?>" title="<?php //echo $language['name']; ?>" /><br />';
	html += '</td>';	
	html += '<td class="left"><input type="text" name="banner_image[' + module_row + '][link]" value="" /></td>';	
	html += '<td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + module_row + '" /><input type="hidden" name="banner_image[' + module_row + '][image]" value="" id="image' + module_row + '" /><br /><a onclick="image_upload(\'image' + module_row + '\', \'thumb' + module_row + '\');">Browse</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + module_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + module_row + '\').attr(\'value\', \'\');">Clear</a></div></td>';
	html += '<td class="left"><a onclick="$(\'#image-row' + module_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '</tr>';
	html += '</tbody>'; 
	
	$('#images tfoot').before(html);
	
	module_row++;
}
//--></script>
<script type="text/javascript"><!--
function image_upload(field) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=image' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: 'Nicocustomproducts image',
		close: function (event, ui) {
			if ($('#image' + field).attr('value')) {
				
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#image' + field).attr('value')),
					dataType: 'text',
					success: function(data) {
						$('#thumb' + field).replaceWith('<img src="' + data + '" alt="" id="thumb' + field + '" />');
						$('#thumb_' + field).attr('value', data);
					}
				});
			}
		},	
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<?php echo $footer; ?>
