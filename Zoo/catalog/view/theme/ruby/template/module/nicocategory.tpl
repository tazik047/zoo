<div class="box categories">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-category">
      <ul>
        <?php foreach ($categories as $category) { ?>
        <li>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
		  <div class="arrow"></div>
		  <div class="category" <?php if (isset($category['thumb'])) echo ' style="background-image:url(\''. $category['thumb'] .'\');"';?>>
          <p><?php  if (isset($category['description'])) {?><?php echo $category['description']; ?><?php } ?></p>
          <ul>
            <?php $i = 0;foreach ($category['children'] as $child) { ?>
			<?php if ($i % 5 == 0 && $i > 0) echo '</ul><ul>';$i++?>	
            <li>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
              <?php } ?>
              <?php if (isset($child['description'])) echo $child['description']; ?>
            </li>
            <?php } ?>
          </ul>
          </div>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
