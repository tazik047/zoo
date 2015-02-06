<?php
$start = strpos($header, '<!--header start-->'); 
$end = strpos($header, '<!--header end-->'); 
$new_column_left = str_replace('$column_left', $column_left, substr($header, $start, $end - $start));

echo $new_header = substr($header, 0, $start) . substr($header, $end);
echo $column_right; 
?>
<div id="content"><?php echo $content_top; ?>
    <h2><?php echo $heading_payment; ?></h2>
        <div style="float: left" id="amazon-wallet-widget"></div>
        <div style="clear: both;"></div>
        <div class="buttons" style="margin-top: 15px">
            <a href="<?php echo $back ?>" class="button left"><span><?php echo $text_back ?></span></a>
            <a class="button right" id="continue-button"><span><?php echo $text_continue ?></span></a>
        </div>
        <input type="hidden" name="payment_method" value="" />
</div>
<?php echo $new_column_left?>
</div>
<script type="text/javascript"><!--
    $(document).ready(function(){
        
        $('#continue-button').click(function(){
            $('div.warning').remove();
            
            if ($("input[name='payment_method']").val() == '1') {
                location = '<?php echo $continue ?>';
            } else {
                $('#amazon-wallet-widget').before('<div class="warning"><?php echo $error_payment_method ?></div>');
            }
        });
        
        new CBA.Widgets.WalletWidget({
            merchantId: '<?php echo $merchant_id ?>',
            displayMode: 'edit',
            onPaymentSelect: function(widget){
                $("input[name='payment_method']").val('1');
            }
            
        }).render('amazon-wallet-widget');
        
    });
//--></script>
<?php echo $footer; ?>
