<?php
$start = strpos($header, '<!--header start-->'); 
$end = strpos($header, '<!--header end-->'); 
$new_column_left = str_replace('$column_left', $column_left, substr($header, $start, $end - $start));

echo $new_header = substr($header, 0, $start) . substr($header, $end);
echo $column_right; 
?>
<div id="content"><?php echo $content_top; ?>
    <h2><?php echo $heading_title; ?></h2>
    <p><?php echo $text_payment_success ?></p>
    <div id="AmazonOrderDetail"></div>
</div>
<?php echo $new_column_left?>
</div>
<script type="text/javascript"><!--
    new CBA.Widgets.OrderDetailsWidget ({
        merchantId: "<?php echo $merchant_id ?>",
        orderID: "<?php echo $amazon_order_id ?>"
    }).render ("AmazonOrderDetail");
//--></script>
<?php echo $footer; ?>
