<?php
	$config = $sconfig;
    $columns_count  = 1;
?>
<?php if( !empty($blogs) ) { ?>
<div id="blog-carousel" class="no-space-row latest-posts panel panel-default <?php echo $addition_cls;?> <?php if ( isset($stylecls)&&$stylecls) { ?>box-<?php echo $stylecls; ?><?php } ?>">
	<?php if( $show_title ) { ?>
	<div class="panel-heading">
		<h3 class="panel-title"><?php echo $heading_title?></h3>
	</div>
	<?php } ?>
    <div class="owl-carousel-play" data-ride="owlcarousel">

    	<div class="owl-carousel" data-show="<?php echo ($columns_count); ?>" data-pagination="false" data-navigation="false">

			<?php
				$pages = array_chunk( $blogs, $itemsperpage); $span = 12/$cols;
			?>

			<?php foreach ($pages as  $k => $tblogs ) { ?>
				<div class="row item products-row <?php if($k==0) {?>active<?php } ?>">
					<?php foreach( $tblogs as $i => $blog ) {  $i=$i+1;?>

							<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-<?php  echo ($cols > 2 && $cols % 2 == 0) ? $span * 2 : $span; ?> col-xs-12 product-col border">
					  			<div class="latest-posts-body">
                                    <?php if( $blog['thumb']  )  { ?>
                                    <div class="col-md-6">
                                        
                                    <div class="latest-posts-image effect-v1">
                                        <a href="<?php echo $blog['link'];?>">
                                            <img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>" class="img-responsive"/>
                                        </a>                                        
                                    </div>
                                    </div>
                                    <?php } ?>
                                    <div class="col-md-6">
                                        
                                    <div class="latest-posts-meta">                                        
                                        <div class="posts-meta">
                                            <span class="created">                                             
                                                <span class="day"><?php echo date("d",strtotime($blog['created']));?></span>
                                                <span class="month"><span class="space">/</span><?php echo date("M",strtotime($blog['created']));?></span>
                                            </span>  
                                            <h4 class="entry-title"><a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a>
                                            </h4>
                                                          
                                        </div>
                                        <div class="btn-more-link">
                                            <a href="<?php echo $blog['link'];?>" class="readmore btn btn-outline-light"><?php echo $objlang->get('text_readmore');?>
                                                <span class="icon-arrow-right"></span>
                                            </a>
                                        </div>
                                    </div>
                                    </div>
                                </div> <!-- end latest-posts-body -->
							</div>
					<?php } //endforeach; ?>
				</div>
			<?php } ?>
	   </div>
       <?php if( count($blogs) >= 3 ) { ?>
            <div class="carousel-controls">
                <a class="carousel-control left" href="#blog-carousel"   data-slide="prev"><i class="zmdi zmdi-chevron-left"></i></a>
                <a class="carousel-control right" href="#blog-carousel"  data-slide="next"><i class="zmdi zmdi-chevron-right"></i></a>
            </div>
        <?php } ?>
	</div>
</div>
<?php } ?>