<div class="box categories">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-category">
      <ul>
        <?php foreach ($categories as $category) { ?>
        <li>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" <?php if ($category['children']) { ?>class="parent"<?php }?>><?php echo $category['name']; ?> <?php if ($category['children']) { ?><span>-</span><?php }?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>" <?php if ($category['children']) { ?>class="parent"<?php }?>><?php echo $category['name']; ?> <?php if ($category['children']) { ?><span>+</span><?php }?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul <?php if ($category['category_id'] == $category_id) { ?>style="display:block"<?php } ?>>
            <?php foreach ($category['children'] as $child) { ?>
            <li>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
