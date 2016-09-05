
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->

<html dir="<?php echo $direction; ?>" class="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<?php
    require( ThemeControlHelper::getLayoutPath( 'common/parts/head.tpl' ) );
    $language_code = $sconfig->get('config_language');
    $config = $sconfig->get('themecontrol');
?>

<body class="<?php echo $class; ?> <?php echo $helper->getPageClass();?> layout-<?php echo $template_layout; ?>">
<div class="row-offcanvas row-offcanvas-left">
<div class="toggle-overlay-container">
    <div class="search-box"> <?php echo $search; ?> </div>
    <div class="dropdown-toggle-button" data-target=".toggle-overlay-container">x </div>
</div>
<!-- header -->
<header class="header header-v1">
    <nav id="topbar" class="topbar">
        <div class="container">
            <div class="inner">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 column">
                    <div class="custom-top call-support pull-left hidden-sm hidden-xs">
                      <p><i class="fa fa-phone"></i><span class="call-number"> <?php echo $sconfig->get('config_telephone');?></span></p>
                    </div>
                      <div class="custom-top mail-contact pull-left hidden-sm hidden-xs">
                      <p><i class="fa fa-envelope-o"></i><?php echo $sconfig->get('config_email');?></p>
                    </div>
                        <div class="quick-language pull-left">
                            <?php echo $language; ?>
                        </div>
                        <div class="quick-currency pull-left">
                            <?php echo $currency; ?>
                        </div>
                        <div class="quick-setting user pull-left">
                            <div class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                                <span><?php echo $text_account; ?></span><i class="fa-fw fa fa-angle-down"></i>
                            </div>
                            <div class="dropdown-menu">
                                <ul class="links ">
                                    <?php if ($logged) { ?>
                                    <li><a href="<?php echo $logout; ?>"><i class="fa-fw fa fa-unlock"></i><?php echo $text_logout; ?></a></li>
                                    <?php } else { ?>
                                    <li><a href="<?php echo $register; ?>"><i class="fa-fw fa fa-key"></i><?php echo $text_register; ?></a></li>
                                    <li><a href="<?php echo $login; ?>"><i class="fa-fw fa fa-unlock-alt"></i><?php echo $text_login; ?></a></li>
                                    <?php } ?>
                                    <li><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="fa-fw fa fa-user"></i> <span><?php echo $text_account; ?></span></a></li>
                                    <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa-fw fa fa-heart-o"></i> <span><?php echo $text_wishlist; ?></span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column">
                      <div class="pull-right"><?php echo $cart; ?></div>      
                      <div class="quick-search pull-right">
                            <button class="search-block dropdown-toggle-overlay" type="button" data-target=".toggle-overlay-container">
                                <span class="fa fa-search"></span>
                            </button>
                      </div>                                        
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div class="header-middle">
        <div class="container">
            <div class="inner text-center">
              <!-- logo -->
              <?php
              if( isset($_COOKIE[$themeName .'_skin']) && $_COOKIE[$themeName .'_skin'] ){
                $skin = trim($_COOKIE[$themeName .'_skin']);
              }
              ?>
              <?php if( $logoType=='logo-theme'){ ?>
              <div id="logo-theme" class="logo">
                <a href="<?php echo $home; ?>">
                  <img src="image/catalog/<?php if(isset($skin)) echo $skin."/"; ?>logo_theme.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
                </a>
              </div>
              <?php } elseif ($logo) { ?>
              <div id="logo" class="logo">
                <a href="<?php echo $home; ?>">
                  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
                </a>
              </div>
              <?php } ?>
            </div>
        </div>
    </div>
    <div class="header-bottom">
      <div class="container">
        <div class="inner">
          <?php  require( ThemeControlHelper::getLayoutPath( 'common/parts/mainmenu.tpl' ) );   ?>
        </div>
      </div>
    </div>
</header>
<!-- /header -->

<!-- sys-notification -->
<div id="sys-notification">
  <div class="container">
    <div id="notification"></div>
  </div>
</div>
<!-- /sys-notification -->
  <?php
  /**
  * Showcase modules
  * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
  */
  //$modules = $helper->getCloneModulesInLayout( $blockid, $layoutID );
  $blockid = 'slideshow';
  $blockcls = "";
  $ospans = array(1=>12);
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols-full.tpl' ) );
  ?>
  <?php
  /**
  * Showcase modules
  * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
  */
  $blockid = 'showcase';
  $blockcls = 'hidden-xs hidden-sm';
  $ospans = array(1=>12);
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
  ?>
  <?php
  /**
  * promotion modules
  * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
  */
  $blockid = 'promotion';
  $blockcls = "hidden-xs hidden-sm";
  $ospans = array(1=>12, 2=>12);
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
  ?>

<div class="maincols">