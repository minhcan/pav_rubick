<?php
	$config = $sconfig;
	$theme  = $themename;
	$span = 12/$cols;
	$id = rand(1,9)+substr(md5($heading_title),0,3);
	$themeConfig = (array)$config->get('themecontrol');
	$listingConfig = array(
		'category_pzoom'    => 1,
		'quickview'         => 0,
		'product_layout'	=> 'default',
		'enable_paneltool'	=> 0
	);
	$listingConfig = array_merge($listingConfig, $themeConfig );
	$quickview     = $listingConfig['quickview'];
	$categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0;


	if( $listingConfig['enable_paneltool'] && isset($_COOKIE[$theme.'_productlayout']) && $_COOKIE[$theme.'_productlayout'] ){
		$listingConfig['product_layout'] = trim($_COOKIE[$theme.'_productlayout']);
	}
	$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
	if( !is_file($productLayout) ){
		$listingConfig['product_layout'] = 'default';
	}
	$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';
	$button_cart = $this->language->get('button_cart');
	$columns_count  = 1;
?>


<div class="listproduct panel <?php echo $addition_cls; ?>">
	<?php if( $show_title ) { ?>
	<div class="panel-heading"><h4 class="panel-title"><?php echo $heading_title?></h4></div>
	<?php } ?>
   <div class="panel-body">
	<div class="row">
		<!-- banner -->
			<?php if(!empty($banner)) { ?>
			<div class="col-md-6  hidden-xs hidden-sm text-right">
				<a href="#"><img class="img-responsive" src="<?php echo $banner; ?>" alt="img"></a>
			</div>
			<?php } ?>

		<!-- column 1 -->		
		<div class=" col-md-6">	
			<div class="box-products  owl-carousel-play product-list-v2" id="carousel<?php echo $id;?>" data-ride="owlcarousel">
				<?php if( count($list1) > $itemsperpage ) { ?>
					<div class="carousel-controls">
						<a class="carousel-control carousel-sm left" href="#carousel<?php echo $id;?>"   data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a class="carousel-control carousel-sm right" href="#carousel<?php echo $id;?>"  data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
				<?php } ?>	
				<div class="owl-carousel product-grid" data-show="<?php echo ($columns_count); ?>" data-pagination="false" data-navigation="true">
					<?php $pages = array_chunk( $list1, $itemsperpage); ?>
					<?php foreach ($pages as  $k => $tproducts ) {   ?>
					<div class="item <?php if($k==0) {?>active<?php } ?> products-block col-nopadding">
						<?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
							<?php if( $i%$cols == 1 || $cols == 1) { ?>
							<div class="row products-row <?php ;if($i == count($tproducts) - $cols +1) { echo "last";} ?>"><?php //start box-product?>
							<?php } ?>
								<div class="col-md-<?php echo $span;?> col-sm-<?php echo $span;?> col-xs-12 <?php if($i%$cols == 0) { echo "last";} ?> product-col border">
									<?php require( $productLayout );  ?>
								</div>

							<?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
							</div><?php //end box-product?>
							<?php } ?>
						<?php } //endforeach; ?>
					</div>
				  <?php } ?>
				</div>
			
			</div>
		</div>
	</div>
	</div>
</div>