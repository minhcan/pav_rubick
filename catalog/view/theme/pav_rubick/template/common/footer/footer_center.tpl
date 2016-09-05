<div class="<?php echo str_replace('_','-',$blockid); ?> <?php echo $blockcls;?>" id="pavo-<?php echo str_replace('_','-',$blockid); ?>">
    <div class="container">
        <div class="inner">
            <div class="row">
           		<div class="logo_footer">
                     <?php if( $content=$helper->getLangConfig('widget-logo') ) {?>
        	            <?php echo $content; ?>
        	        <?php } ?>
                </div>
                <div class="menu_footer">
                    <?php if ($informations) { ?>
                    <div class="panel">
                        <ul class="list-unstyled">
                          <?php foreach ($informations as $information) { ?>
                          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                          <?php } ?>
                          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                        </ul>
                    </div>
                    <?php } ?>
                </div>
                <div id="powered">
                    <div class="container">
                        <?php if( $content=$helper->getLangConfig('widget_paypal') ) {?>
                        <div class="paypal">
                        <?php echo $content; ?>
                        </div>
                        <?php } ?>
                    </div>
                </div>                        
            </div> <!-- end row -->
        </div>
    </div>
</div>
