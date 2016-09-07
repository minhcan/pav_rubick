<div class="product-block">
    <div class="image">
         <!-- Sale lable -->
        <?php if( $product['special'] ) {   ?>
          <div class="product-label bts"><div class="product-label-special"><?php echo $objlang->get('text_sale'); ?></div></div>
        <?php } ?>
        <!-- / Sale lable -->
        <a class="img" href="<?php echo $product['href']; ?>">
            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
        </a>
        <div class="action">
            <div class="button-groups">
                <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>                   
                    <button class="cart btn-style" data-loading-text="Loading..." type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
                        <i class="icon-bag"></i>
                    </button>             
                <?php } ?>
                 <button class="compare btn-style" type="button" data-toggle="tooltip" data-placement="top" title="<?php echo $objlang->get("button_compare"); ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
                    <em class="fa fa-refresh"></em>
                </button> 

                <button class="wishlist btn-style" type="button" title="<?php echo $objlang->get("button_wishlist"); ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                    <i class="fa fa-heart-o"></i>
                </button>

                <?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
                    <?php if ($quickview) { ?>
                        <button class="quickview iframe-link btn-style" type="button" data-placement="top" href="<?php echo $ourl->link('themecontrol/product','product_id='.$product['product_id']);?>"  title="<?php echo $objlang->get('quick_view'); ?>" ><i class="icon-circle-plus"> </i></button>
                    <?php } ?>        
                <?php } ?>
            </div>    
        </div>        
    </div>
    <div class="product-meta clearfix">
        
        <h6 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h6>
        <?php if ($product['rating']) { ?>
        <div class="rating clearfix">
            <?php for ($is = 1; $is <= 5; $is++) { ?>
            <?php if ($product['rating'] < $is) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star"></i>
            </span>
            <?php } ?>
            <?php } ?>
        </div>
        <?php } ?>
        
        <div class="bottom clearfix">
            <div class="rating">
                <?php for ($is = 1; $is <= 5; $is++) { ?>
                    <?php if ($product['rating'] < $is) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o"></i></span>
                    <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star"></i>
                        </span>
                    <?php } ?>
                <?php } ?>
            </div>
            <?php if ($product['price']) { ?>
                <div class="price">
                  <?php if (!$product['special']) { ?>
                  <span class="price-new"><?php echo $product['price']; ?></span>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                </div>

            <?php } ?>

            <?php if ($product['price']) { ?>
            <ul class="list-unstyled">
                <?php if ($product['tax']) { ?>
                    <li><?php echo $text_tax; ?> <?php echo $product['tax']; ?></li>
                <?php } ?>
                <?php if ($product['points']) { ?>
                    <li><?php echo $text_points; ?> <?php echo $product['points']; ?></li>
                <?php } ?>
                <?php if ($product['discounts']) { ?>
                    <li><hr></li>
                    <?php foreach ($product['discounts'] as $discount) { ?>
                        <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                    <?php } ?>
                <?php } ?>
            </ul>
            <?php } ?>

        </div>
        <?php if( isset($product['description']) ){ ?>
            <p class="description"><?php echo utf8_substr( strip_tags($product['description']),0,200);?>...</p>
        <?php } ?>
        
    </div>

</div>




