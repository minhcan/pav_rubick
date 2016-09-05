<?php 
	$config = $sconfig;
	$theme  = $themename;
	$themeConfig = (array)$config->get('themecontrol');
	$listingConfig = array(
		'category_pzoom'        => 1,
		'quickview'             => 0,
		'show_swap_image'       => 0,
		'product_layout'		=> 'default',
		'enable_paneltool'	    => 0
	);
	$listingConfig = array_merge($listingConfig, $themeConfig );
	$categoryPzoom = $listingConfig['category_pzoom'];
	$quickview     = $listingConfig['quickview'];
	$swapimg       = $listingConfig['show_swap_image'];
	$categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0; 
	$span = 12/$cols; 
	$id = rand(1,9);
	$columns_count  = 1;
?>

<?php if($layout == 'layout_1') { ?>
<div class="productdeals">
	<div class="panel <?php echo $addition_cls; ?>">
			<?php if( $show_title ) { ?>
			<div class="panel-heading"><h3 class="panel-title"><?php echo $heading_title?></h3></div>
			<?php } ?>
			<?php if (!empty($categories)): ?>
			<ul class="list text-center">
				<?php foreach ($categories as $category): ?>
				<li><a href="<?php echo $category["href"] ?>"><?php echo $category["name"] ?></a></li>
				<?php endforeach ?>
			</ul>
			<?php endif ?>
		<div class="box-content">
			<div class="row">
				<?php 
					$len = count($products);
					$firsthalf = array_slice($products, 0, $len / 2);
					$secondhalf = array_slice($products, $len / 2);
				?>
				<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 product-v1">
				<div class="owl-carousel-play" data-ride="owlcarousel" id="widget-todaydeals-first-<?php echo $id;?>">
				<?php if( count($firsthalf) > $items ) { ?>
			        <div class="carousel-controls">
			           	<a class="carousel-control left" href="#widget-todaydeals-first-<?php echo $id;?>"   data-slide="prev"><i class="fa fa-angle-left"></i></a>
						<a class="carousel-control right" href="#widget-todaydeals-first-<?php echo $id;?>"  data-slide="next"><i class="fa fa-angle-right"></i></a>
					</div>
				<?php } ?>
				<?php if( !empty($firsthalf) ) { ?>
					<div class="owl-carousel" data-show="<?php echo ($columns_count); ?>" data-pagination="false" data-navigation="true">
					<?php $pages = array_chunk( $firsthalf, $items); ?>
					<?php foreach ($pages as  $k => $firsthalf ) {   ?>
							<div class="item <?php if($k==0) {?>active<?php } ?>">
							<?php foreach( $firsthalf as $i => $product ) {  $i=$i+1;?>
								<?php if( $i%$cols == 1 || $cols == 1) { ?>
								<div class="row products-row <?php ;if($i == count($firsthalf) - $cols +1) { echo "last";} ?>"><?php //start box-product?>
								<?php } ?>
									<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-12 col-xs-12 <?php if($i%$cols == 0) { echo "last";} ?> product-col border">
									<?php require( DIR_TEMPLATE.$theme.'/template/common/product/deal_default.tpl');?>
									</div>

									<?php if( $i%$cols == 0 || $i==count($firsthalf) ) { ?>
								</div><?php //end box-product?>
								<?php } ?>
							<?php } //endforeach; ?>
							</div>
					<?php } ?>
					</div>
				<?php } ?>
				</div>
				</div>
				<div class="hidden-sm hidden-xs col-md-4 col-lg-4 margin-right-70 margin-left-70">
					<div class="deal-style">
						<?php require( DIR_TEMPLATE.$theme.'/template/common/product/first_product_deals2.tpl');?>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 product-v1">
					<div class="owl-carousel-play" data-ride="owlcarousel" id="widget-todaydeals-second-<?php echo $id;?>">
					<?php if( count($secondhalf) > $items ) { ?>
				        <div class="carousel-controls">
				           	<a class="carousel-control left" href="#widget-todaydeals-second-<?php echo $id;?>"   data-slide="prev"><i class="fa fa-angle-left"></i></a>
							<a class="carousel-control right" href="#widget-todaydeals-second-<?php echo $id;?>"  data-slide="next"><i class="fa fa-angle-right"></i></a>
						</div>
					<?php } ?>
					<?php if( !empty($secondhalf) ) { ?>
						<div class="owl-carousel" data-show="<?php echo ($columns_count); ?>" data-pagination="false" data-navigation="true">
						<?php $pages = array_chunk( $secondhalf, $items); ?>
						<?php foreach ($pages as  $k => $secondhalf ) {   ?>
								<div class="item <?php if($k==0) {?>active<?php } ?>">
								<?php foreach( $secondhalf as $i => $product ) {  $i=$i+1;?>
									<?php if( $i%$cols == 1 || $cols == 1) { ?>
									<div class="row products-row <?php ;if($i == count($secondhalf) - $cols +1) { echo "last";} ?>"><?php //start box-product?>
									<?php } ?>
										<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-12 col-xs-12 <?php if($i%$cols == 0) { echo "last";} ?> product-col border">
										<?php require( DIR_TEMPLATE.$theme.'/template/common/product/deal_default.tpl');?>
										</div>

										<?php if( $i%$cols == 0 || $i==count($secondhalf) ) { ?>
									</div><?php //end box-product?>
									<?php } ?>
								<?php } //endforeach; ?>
								</div>
						<?php } ?>
						</div>
					<?php } ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php }else { ?>
<div class="productdeals">
	<div class="panel <?php echo $addition_cls; ?>">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
				<div class="box-content product-v1">				
					<?php if( $show_title ) { ?>
					<div class="panel-heading"><h3 class="panel-title"><?php echo $heading_title?></h3></div>
					<?php } ?>
					<?php if (!empty($categories)): ?>
					<ul class="list">
						<?php foreach ($categories as $category): ?>
						<li><a href="<?php echo $category["href"] ?>"><?php echo $category["name"] ?></a></li>
						<?php endforeach ?>
					</ul>
					<?php endif ?>				
					<div class="owl-carousel-play" data-ride="owlcarousel" id="widget-todaydeals-<?php echo $id;?>">
						<?php if( count($products) > $items ) { ?>
				        <div class="carousel-controls">
				           	<a class="carousel-control left" href="#widget-todaydeals-<?php echo $id;?>"   data-slide="prev"><i class="fa fa-angle-left"></i></a>
							<a class="carousel-control right" href="#widget-todaydeals-<?php echo $id;?>"  data-slide="next"><i class="fa fa-angle-right"></i></a>
						</div>
						<?php } ?>
						<div class="owl-carousel" data-show="<?php echo ($columns_count); ?>" data-pagination="false" data-navigation="true">
						<?php $pages = array_chunk( $products, $items); ?>
						<?php foreach ($pages as  $k => $tproducts ) {   ?>
								<div class="item <?php if($k==0) {?>active<?php } ?>">
								<?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
									<?php if( $i%$cols == 1 || $cols == 1) { ?>
									<div class="row products-row <?php ;if($i == count($tproducts) - $cols +1) { echo "last";} ?>"><?php //start box-product?>
									<?php } ?>
										<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-6 col-xs-12 <?php if($i%$cols == 0) { echo "last";} ?> product-col border">
										<?php require( DIR_TEMPLATE.$theme.'/template/common/product/deal_default.tpl');?>
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

			<!-- col2 first product -->
			<div class="col-xs-12 col-sm-8 col-md-4 col-lg-4 hidden-sm hidden-xs margin-left-70 margin-top-70">
				<div class="deal-style">
				<?php require( DIR_TEMPLATE.$theme.'/template/common/product/first_product_deals2.tpl');?>
				</div>
			</div>
		</div>
	</div>
</div>
<?php } ?>