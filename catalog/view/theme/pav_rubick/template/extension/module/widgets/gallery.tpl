<?php 
	$id = rand(1,9)+rand();
	$columns_count  = 1;
?>
<?php if( $show_title ) { ?>
<div class="widget-heading box-heading"><?php echo $heading_title?></div>
<?php } ?>
<div class="widget-gallery-list <?php echo $addition_cls; ?>">
<div class="owl-carousel-play" data-ride="owlcarousel">
		<div class="owl-carousel" id="gallery<?php echo $id;?>" data-show="<?php echo ($columns_count); ?>" data-pagination="true" data-navigation="true">
			<?php foreach ($thumbnailurl as $k=>$img) { ?>
				<div class="item <?php if($k==0) {?>active<?php } ?> products-block">
					<img class="img-responsive" src="<?php echo $img; ?>" alt="img"/>
				</div>
			<?php } ?>
				
		</div>
</div>
</div>

