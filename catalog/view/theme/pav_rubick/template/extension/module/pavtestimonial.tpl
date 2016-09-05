
<div class="col-lg-3 t-avatar">
	<div class="panel-heading style2 style3">
		<h3 class="panel-title"><?php echo $objlang->get('text_testimonials'); ?></h3>
	</div>
</div>
	
<div class="col-lg-9">
	<?php if( count($testimonials) ) { ?>
		<?php $id = rand(1,10)+rand();?>
	   <div id="pavtestimonial<?php echo $id;?>" class="carousel slide pavtestimonial <?php echo $class; ?>">
			<div class="carousel-inner">
				 <?php foreach ($testimonials as $i => $testimonial) {  ?>
					<div class="item <?php if($i==0) {?>active<?php } ?>">
		 				<div class="testimonial-item">
							<div class="col-md-4 col-sm-4 col-xs-12 testimonials-avatar">
								<img  alt="<?php echo strip_tags($testimonial['profile']); ?>" src="<?php echo $testimonial['thumb']; ?>" class="img-circle"/>
							</div>
							<?php if(  $testimonial['profile'] ) { ?>
							<div class=" col-md-8 col-sm-8 col-xs-12 profile">
								<?php if(  $testimonial['description'] ) { ?>
								<div class="testimonial-description"><?php echo $testimonial['description']; ?></div>
								<?php } ?>
								<div class="testimonial-profile"><?php echo $testimonial['profile']; ?></div>
							</div>
							<?php } ?>
							<?php if( $testimonial['video_link']) { ?>
							<a class="colorbox-t" href="<?php echo $testimonial['video_link'];?>"><?php echo $this->language->get('text_watch_video_testimonial');?></a>
							<?php } ?>
						</div>
					</div>
				<?php } ?>
			</div>
		 		
			<?php if( count($testimonials) > 1 ){ ?>	
			<a class="carousel-control left" href="#pavtestimonial<?php echo $id;?>" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#pavtestimonial<?php echo $id;?>" data-slide="next">&rsaquo;</a>
			<?php } ?>
	    </div>
		<?php if( count($testimonials) > 1 ){ ?>
		<script type="text/javascript">
			$('#pavtestimonial<?php echo $id;?>').carousel({interval:<?php echo ( $auto_play_mode?$interval:'false') ;?>,auto:<?php echo $auto_play;?>,pause:'hover'});
		</script>
		<?php } ?>
	<?php } ?>
</div>
