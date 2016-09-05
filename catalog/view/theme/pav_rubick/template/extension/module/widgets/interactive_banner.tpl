<div class="interactive-banner <?php echo $addition_cls; ?>">
    <div class="image">
        <div class="col-md-8"> 
            <?php if($thumbnailurl){?><img alt="" src="<?php echo $thumbnailurl;?>" class="img-responsive"><?php }?>
        </div>

        <div class="col-md-4"> 
            <div class="content">
                <div class="content-inner">
                    <div class="interactive-profile style2">
                        <?php if( $show_title ) { ?>
                        <h3 class="panel-title"><?php echo $heading_title?></h3>
                        <?php } ?>
                        <div class="htmlcontent">
                            <?php if($htmlcontent){echo $htmlcontent; }?>
                        </div>
                        <?php if($text_link){?>
                        <div class="action-button">
                            <?php if($text_link){?>
                                <a href="<?php echo $mask_link;?>"><span><?php echo $text_link;?></span></a>
                            <?php }?>
                        </div>
                        <?php }?>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

