<?php 
error_reporting(E_ALL);
ini_set('display_errors', 1);
class PtsWidgetFreshfooddeals extends PtsWidgetPageBuilder {
	public $name = 'freshfooddeals';
	public $group = 'opencart';

	public static function getWidgetInfo(){
		return array('label' => ('Deals of Today'), 'explain' => 'Show all product deals', 'group' => 'opencart');
	}

	public function renderForm( $args, $data ){
		$helper = $this->getFormHelper();

		$sortby = array(
			array('value' => 'name ASC',      'name' => $this->l('Name (A - Z)')),
			array('value' => 'name DESC',     'name' => $this->l('Name (Z - A)')),

			array('value' => 'date_add ASC',  'name' => $this->l('Date (Low > High)')),
			array('value' => 'date_add DESC', 'name' => $this->l('Date (High > Low)')),
			
			array('value' => 'price ASC',     'name' => $this->l('Price (Low > High)')),
			array('value' => 'price DESC',    'name' => $this->l('Price (High > Low)')),

			array('value' => 'rating DESC',   'name' => $this->l('Rating (Highest)')),
			array('value' => 'rating ASC',    'name' => $this->l('Rating (Lowest)')),

			array('value' => 'quantity ASC',  'name' => $this->l('Quantity (Lowest)')),
			array('value' => 'quantity DESC', 'name' => $this->l('Quantity (Highest)')),
		);

		$layout = array(
			array('value' => 'layout_1',   'name' => $this->l('Layout home 1')),
			array('value' => 'layout_2',   'name' => $this->l('Layout home 2'))
		);

		// list categories
		$this->load->model('catalog/category');
		$categories = $this->model_catalog_category->getCategories();

		$this->fields_form[1]['form'] = array(
			'legend' => array(
				'title' => $this->l('Widget Config'),
			),
			'input' => array(
				// list links
            	array(
                    'type'  => 'links-category',
                    'label' => $this->l('Links Category'),
                    'name'  => 'links',
                    'default'=> array(),
                    'desc'	=> "Add links category",
                ),

                array(
					'type'  => 'date',
					'label' => $this->l('Start Date'),
					'name'  => 'start',
					'default'=> '',
				),
				array(
					'type'  => 'date',
					'label' => $this->l('End Date'),
					'name'  => 'end',
					'default'=> '',
				),
				array(
					'type'  => 'categories',
					'label' => $this->l('Categories'),
					'name'  => 'categories',
					'options' => array('query'=>$categories),
					'default'=> "",
					'description' => 'Allow choose category for show list deal-products.',
				),
				array(
					'type'  => 'sortby',
					'label' => $this->l('Sort By'),
					'name'  => 'sortby',
					'options' => array('query'=>$sortby),
					'default'=> 'name',
				),
				array(
					'type'  => 'text',
					'label' => $this->l('Limit'),
					'name'  => 'limit',
					'default'=> 8,
				),
				array(
					'type'  => 'text',
					'label' => $this->l('Items'),
					'name'  => 'items',
					'default'=> 4,
					'description' => 'input number show items per page.',
				),
				array(
					'type'  => 'text',
					'label' => $this->l('Columns'),
					'name'  => 'cols',
					'default'=> 2,
				),
				array(
					'type'  => 'text',
					'label' => $this->l('width'),
					'name'  => 'width',
					'default'=> 200,
				),
				array(
					'type'  => 'text',
					'label' => $this->l('height'),
					'name'  => 'height',
					'default'=> 200,
				),
				array(
					'type'  => 'sortby',
					'label' => $this->l('Layout'),
					'name'  => 'layout',
					'options' => array('query'=>$layout),
					'default'=> 'layout_1',
				)
			),

			'submit' => array(
				'title' => $this->l('Save'),
				'class' => 'button'
			)
		);

		$default_lang = (int)$this->config->get('config_language_id');
		
		$helper->tpl_vars = array(
			'fields_value' => $this->getConfigFieldsValues( $data ),
			'id_language' => $default_lang
		);

		return $helper->generateForm( $this->fields_form );
	}

	public function checkExistCategory($category_id){
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "category WHERE category_id = '" . (int)$category_id . "'" );
		return $query->row;
	}

	public function renderContent( $args, $setting ){

		$this->language->load('extension/module/themecontrol');
		$this->load->model('pavdeals/product');
		$this->load->model('catalog/product');
		$this->load->model('catalog/category');

		// add script + style 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/pavdeals.css')) {
			$this->document->addStyle('catalog/view/theme/'.$this->config->get('config_template').'/stylesheet/pavdeals.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/pavdeals.css');
		}
		$this->document->addScript('catalog/view/javascript/pavdeals/countdown.js');

		$languageID = $this->config->get('config_language_id');
		$setting['heading_title'] = isset($setting['widget_title_'.$languageID])?$setting['widget_title_'.$languageID]:'';

		// THEME CONFIG
		$setting['objlang'] = $this->registry->get('language');
		$setting['ourl'] = $this->registry->get('url');

		$config = $this->registry->get("config");
		$setting['sconfig'] = $config;
		$setting['themename'] = $config->get("theme_default_directory");

		// SETTINGS
		$t  = array(
			'start'      => '2015-08-01',
			'end'        => '2015-08-01',
			'categories' => array(),
			'sortby'     => 'name',
			'limit'      => 8,
			'items'      => 4,
			'cols'       => 2,
			'width'      => 200,
			'height'     => 200
		);
		$setting = array_merge( $t, $setting );
		//echo "<pre>" .print_r($setting,1);die;

		$sortby = isset($setting['sortby'])?$setting['sortby']:'p.date_added desc';
		$tmp = explode(" ",$sortby);
		$categories = isset($setting['categories'])?$setting['categories']:'0';
		$start_date = isset($setting['start'])?date("Y-m-d", strtotime($setting['start'])):'';
		$end_date = isset($setting['end'])?date("Y-m-d", strtotime($setting['end'])):'';
	
		$data = array(
			'sort'              => $tmp[0],
			'order'             => $tmp[1],
			'start_date'        => $start_date,
			'to_date'           => $end_date,
			'filter_categories' => $categories,
			'start'             => 0,
	    	'limit'             => $setting['limit'],
		);
		$results = $this->model_pavdeals_product->getProductSpecials($data);

		// Product first
		$s = array('width' => '370', 'height' => '370');
		$i = 0;
		$products = array();
		foreach ($results as $result) { $i++;
			if($i == 1) {
				$setting['first_product'] = $this->getItemDeal($result, $s);
			} else {
				$products[] = $this->getItemDeal($result, $setting);
			}
		}

		// get Categories Link
		$categories = array();
		foreach ($setting['links'] as $link) {

			$check = $this->checkExistCategory($link);

			if(!empty($check)) {
				$category = $this->model_catalog_category->getCategory($link);
				$categories[] = array(
					'category_id' => $category['category_id'],
					'name' => $category['name'],
					'href' => $this->url->link('product/category', 'path=' . $category['category_id']),
				);
			}
		}
		$setting['categories'] = $categories;

		// get product by ID
		if( !empty($products)) {
			$setting['products'] = $products;
		} else {
			$setting['first_product'] = array();
			$setting['products'] = array();
		}

		$output = array('type'=>'products','data' => $setting );
		return $output;
	}

	// other function 
	public function getItemDeal($product = null, $setting = array()){

		if(is_numeric($product)){
			$product = $this->model_catalog_product->getProduct((int)$product);
		}
		$product_info = $this->model_pavdeals_product->getDeal($product);
		
		if(!$product_info)
			 return false;

		$get_categories = $this->model_catalog_product->getCategories($product_info['product_id']);
		foreach($get_categories as $cat) { 
			$cats = $this->model_catalog_category->getCategory($cat['category_id']);
		}

		$save_price = (float)$product_info['price'] - (float)$product_info['special'];
		$discount = round(($save_price/$product_info['price'])*100);
		$save_price = $this->currency->format($this->tax->calculate($save_price, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
	
		if ($product_info['image']) {
			$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
		} else {
			$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
		}
					
		if ($product_info['image']) {
			$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
		} else {
			$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
		}

		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
		} else {
			$price = false;
		}

		if ((float)$product_info['special']) {
			$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
		} else {
			$special = false;
		}

		if ($this->config->get('config_tax')) {
			$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
		} else {
			$tax = false;
		}

		if ($this->config->get('config_review_status')) {
			$rating = $product_info['rating'];
		} else {
			$rating = false;
		}

		$date_end_string = isset($product_info['date_end'])?$product_info['date_end']:"";

		$product = array(
			// default of opencart ( don't alow to edit anything )
			'product_id'  => $product_info['product_id'],
			'thumb'       => $image,
			'name'        => $product_info['name'],
			'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
			'price'       => $price,
			'special'     => $special,
			'tax'         => $tax,
			'rating'      => $rating,
			'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
			// customize
			'discount' 	 => "-".$discount."%",
			'save_price' => $save_price,
			'date_end_string' => $date_end_string,
			'date_end'	 => explode("-", $date_end_string),
			'category_name' => $cats['name']
		);
		return $product;
	}
}
?>