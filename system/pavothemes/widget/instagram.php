<?php
/******************************************************
 *  Leo Opencart Theme Framework for Opencart 1.5.x
 *
 * @package   leotempcp
 * @version   3.0
 * @author    http://www.leotheme.com
 * @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>
 *               <info@theme.com>.All rights reserved.
 * @license   GNU General Public License version 2
 * ******************************************************/

class PtsWidgetInstagram extends PtsWidgetPageBuilder {

		public $name = 'instagram';


		public static function getWidgetInfo(){
			return array('label' =>  ('Instagram Gallery'), 'explain' => 'Instagram Gallery', 'group' => 'others'  );
		}


		public function renderForm( $args, $data ){

			$key = time();

			$helper = $this->getFormHelper();

			$this->fields_form[1]['form'] = array(
	            'legend' => array(
	                'title' => $this->l('Widget Form.'),
	            ),
	            'input' => array(
					array(
	                    'type'  => 'text',
	                    'label' => $this->l('Tocken Key'),
	                    'name'  => 'i_token',
	                    'class' => 'i_token',
	                    'default'=> '1213565508.1677ed0.e31553e458274a178d41daa1968e9671',
	                    'desc'	=> ''
	                ),
	          
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Username'),
	                    'name'  => 'i_username',
	                    'class' => 'i_username',
	                    'default'=> '1213565508',
	                    'desc'	=> ''
	                ),
	                array(
                        'type'  => 'textarea',
                        'label' => $this->l('Title Description'),
                        'name'  => 'title_description',
                        'default'=> '',
                        'lang'  => true,
                        'cols' => 40,
                        'rows' => 10,
                        'value' => '',
                        'autoload_rte' => true
                    ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Limit Image'),
	                    'name'  => 'limit',
	                    'class' => 'limit',
	                    'default'=> '',
	                    'desc'	=> ''
	                ),

	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Item/Page'),
	                    'name'  => 'columns_count',
	                    'class' => 'columns_count',
	                    'default'=> '',
	                    'desc'	=> ''
	                )

	            ),
	      		 'submit' => array(
	                'title' => $this->l('Save'),
	                'class' => 'button'
           		 )
	        );


		 	$default_lang = (int)$this->config->get('config_language_id');

			$helper->tpl_vars = array(
	                'fields_value' => $this->getConfigFieldsValues( $data  ),
	                'id_language' => $default_lang
        	);

        	$this->load->model('tool/image');
			$this->model_tool_image->resize('no_image.png', 100, 100);
			$placeholder  = $this->model_tool_image->resize('no_image.png', 100, 100);
			$string = '



					 <script type="text/javascript">
						$(".imageupload").WPO_Gallery({key:"'.$key.'",gallery:false,placehold:"'.$placeholder.'",baseurl:"'.HTTP_CATALOG . 'image/'.'" } );
					</script>

			';
			return  '<div id="imageslist'.$key.'">'.$helper->generateForm( $this->fields_form ) .$string."</div>" ;

		}

		public function renderContent(  $args, $setting ){

			$t = array(
				'title_description' => 'This is title description',
				'i_username'=> '',
				'i_token' => '',
				'limit' => 9,
				'columns_count' => 6
			);

			$setting = array_merge( $t, $setting );


			$languageID = $this->config->get('config_language_id');
			$setting['heading_title'] = isset($setting['widget_title_'.$languageID])?$setting['widget_title_'.$languageID]:'';
			$setting['title_description'] = isset($setting['title_description_'.$languageID])?($setting['title_description_'.$languageID]): '';
			$output = array('type'=>'image','data' => $setting );

	  		return $output;
		}


	}
?>