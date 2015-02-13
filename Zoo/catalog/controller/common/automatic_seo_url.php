<?php
class ControllerCommonAutomaticSeoUrl extends Controller {

	// configuration attributes
	var $forceAutoUrl = true; //if set to true, default OC SEO keyword for urls will be ignored
	var $manufacturerNameInUrl = true;
	var $languageSlugInUrl = false;
	var $preventProdDuplicates = false; //if a product is linked to more then one category, only use one category for product details page
	var $product_identifier = 'p';
	var $category_identifier = 'c';
	var $manufacturer_identifier = 'm';
	var $info_identifier = 'i';
	var $route_identifier = 'r';
	var $_sep = '-';
	var $_url_ext = '.html'; // .html, .php etc.

	// reserved attributes
	var $_products;
	var	$_categories;
	var $_tmp_cat_path = array();
	var	$_manufacturers;
	var	$_infos;
	var $_infoString;
	var $_languages;
	
	
	public function index() {

		//change language id: i.e. for sitemap
		if(isset($this->request->get['language'])){
			$this->_getLanguages();
			if(isset($this->_languages[$this->request->get['language']]) && $this->request->get['language'] != $this->config->get('config_language')){
				$this->session->data['language'] = $this->request->get['language'];
				header('location: '.urldecode($_SERVER['REQUEST_URI']));
			}
		}
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
            $this->url->addRewrite($this);
        }
		// Decode URL
		if (isset($this->request->get['_route_'])) {
			if($this->languageSlugInUrl && isset($this->request->post['language_code']) && isset($this->request->post['redirect'])){
				$this->_getLanguages();
				$this->session->data['language'] = $this->request->post['language_code'];
				$this->config->set('config_language',$this->request->post['language_code']);
				$this->config->set('config_language_id',$this->_languages[$this->request->post['language_code']]['language_id']);
				$redirect = ltrim(parse_url($this->request->post['redirect'], PHP_URL_PATH),'/');
				$segments = explode('/',$redirect);
				$segments['0'] = $this->request->post['language_code'];
				$this->request->get['_route_'] = implode('/',$segments);
			}
			if(substr($this->request->get['_route_'], strlen($this->_url_ext)*-1) == $this->_url_ext)
				$this->request->get['_route_'] = substr($this->request->get['_route_'], 0, strlen($this->request->get['_route_']) - strlen($this->_url_ext));
			//decode url
			$segments = explode('/', $this->request->get['_route_']);
			//language slug
			if($this->languageSlugInUrl){
				$this->_getLanguages();
				if(!isset($this->request->post['language_code']) && isset($this->_languages[$segments[0]]) && $segments[0] != $this->config->get('config_language')){
					$this->session->data['language'] = $segments[0];
					header('location: '.urldecode($_SERVER['REQUEST_URI']));
				}
				unset($segments[0]);
				$segments = array_values($segments);
			}
			if(!empty($segments)){
				$_segments = array_reverse($segments);
				$segment = array_reverse(explode($this->_sep, $_segments[0]));
				$string = $segment[0];
				$string = preg_replace('/[^A-Za-z0-9]/','',$string);
				$parts = preg_split("/(,?\s+)|((?<=[a-z])(?=\d))|((?<=\d)(?=[a-z]))/i", $string);

				if(!empty($parts)){
					// adjust path
					$path = array();
					foreach($parts as $k=>$p){
						if( ($k % 2) == 0 && $p == $this->category_identifier){
							$next = $k+1;
							$path[] = $parts[$next];
						}
					}
					$path = implode('_',$path);
					// end adjust path
					switch($parts[0]){
						case $this->product_identifier: 
							// product page
							$this->request->get['route'] = 'product/product';
							$this->request->get['product_id'] = (int) $parts[1];
							if(isset($parts[2]) && $parts[2] == $this->category_identifier){
								$this->request->get['path'] = $path; //$parts[3];
							}
							break;
						case $this->category_identifier:
							// category page
							$this->request->get['route'] = 'product/category';
							$this->request->get['path'] = $path; //$parts[1];
							break;
						case $this->manufacturer_identifier:
							// manufacturer page
							$mroute = ( version_compare(VERSION, '1.5.4.0') >= 0 ) ? 'product/manufacturer/info' : 'product/manufacturer/product';
							$this->request->get['route'] = $mroute;
							$this->request->get['manufacturer_id'] = (int) $parts[1];
							break;
						case $this->info_identifier:
							// information page
							$this->request->get['route'] = 'information/information';
							$this->request->get['information_id'] = (int) $parts[1];
							break;
						case $this->route_identifier:
							// other route pages
							$this->request->get['route'] = implode('/',$segments);
							break;
						default:
							if($this->forceAutoUrl) 
								$this->request->get['route'] = implode('/',$segments);
							else
								return $this->index_standard();
							break;
					}
				}else{
					if($this->forceAutoUrl) 
						$this->request->get['route'] = implode('/',$segments);
					else
						return $this->index_standard();
				}
			}
			if($this->languageSlugInUrl && isset($this->request->post['language_code']) && isset($this->request->post['redirect'])){
				$route = '';
				if(isset($this->request->get['route'])){
					$route = $this->request->get['route'];
					unset($this->request->get['route']);
				}
				unset($this->request->get['_route_']);
				$args = http_build_query($this->request->get);
				$redirect = $this->url->link($route, $args);
				$this->redirect($redirect);
			}
			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			}
		}
		
	}
	public function rewrite($link){
	
		if(!$this->forceAutoUrl){
			$_link = $this->rewrite_standard($link);
			if($_link != $link) return $_link;
		}
		
		if($this->config->get('config_seo_url')){
			$this->_infoString = '';
			$url_data = parse_url(str_replace('&amp;', '&', $link));
			if(!isset($url_data['query']))return $link;
			$url = $urlpre = $urlpost = ''; 
			$data = array();
			parse_str($url_data['query'], $data);
			if(isset($data['route'])){
				switch($data['route']){
					case 'product/product':
						$this->_get_products();
						$pid = (isset($data['product_id'])) ? $data['product_id'] : 0;
						unset($data['product_id']);
						//$url .= '/'.$this->product_identifier.'/'.$pid;
						$this->_infoString .= $this->product_identifier.$pid;
						if(isset($this->_products[$pid])){
							if(isset($data['path']) && !$this->preventProdDuplicates){
								$cats = array_reverse(explode('_', $data['path']));
								$catid = $cats[0];
							}else{
								$catid = $this->_products[$pid]['category_id'];
							}
							$url .= $this->_traverse_categories($catid);
							if($this->manufacturerNameInUrl){
								$this->_get_manufacturers();
								if(isset($this->_manufacturers[$this->_products[$pid]['manufacturer_id']]))
									$url .= $this->_manufacturers[$this->_products[$pid]['manufacturer_id']].'/';
							}
							$url .= $this->_products[$pid]['name'];
						}
						if(isset($data['path'])){
							unset($data['path']);
						}
						break;
					case 'product/category':
						$data['path'] = isset($data['path']) ? $data['path'] : 0;
						$ppath = array_reverse(explode('_',$data['path']));
						$url .= $this->_traverse_categories($ppath[0]);
						unset($data['path']);
						break;
					case 'product/manufacturer/info':
					case 'product/manufacturer/product':
						$data['manufacturer_id'] = isset($data['manufacturer_id']) ? $data['manufacturer_id'] : 0;
						//$url .= '/'.$this->manufacturer_identifier.'/'.$data['manufacturer_id'];
						$this->_infoString .= $this->manufacturer_identifier.$data['manufacturer_id'];
						$this->_get_manufacturers();
						if(isset($this->_manufacturers[$data['manufacturer_id']]))
							$url .= '/'.$this->_manufacturers[$data['manufacturer_id']];
						unset($data['manufacturer_id']);
						break;
					case 'information/information':
						$data['information_id'] = isset($data['information_id']) ? $data['information_id'] : 0;
						//$url .= '/'.$this->info_identifier.'/'.$data['information_id'];
						$this->_infoString .= $this->info_identifier.$data['information_id'];
						$this->_get_infos();
						if(isset($this->_infos[$data['information_id']]))
							$url .= '/'.$this->_infos[$data['information_id']];
						unset($data['information_id']);
						break;
					case 'common/home':
						break;
					default:
						$url .= '/'.$data['route'];
						//$url .= '/'.$this->route_identifier.'/'.$data['route'];
						//return $link;
						break;
				}
				
				unset($data['route']);
				$query = '';
				if ($data) {
					foreach ($data as $key => $value)
						$query .= '&' . $key . '=' . $value;
					
					if ($query)
						$query = '?' . trim($query, '&');
				}
				//$url .= $this->_sep.$this->_infoString;
				if(!empty($this->_infoString))
					$url = '/'.trim($url,'/').$this->_sep.$this->_infoString;
				return 	$url_data['scheme'].'://'.$url_data['host'].(isset($url_data['port']) ? ':'.$url_data['port'] : '').str_replace('/index.php', '', $url_data['path']).( $this->languageSlugInUrl ? '/'.$this->config->get('config_language') : '').rtrim($url,'/').(rtrim($url,'/') == '' ? '' : $this->_url_ext).$query;
			}else{
				return $link;
			}
		}else{
			return $link;
		}
	}

	private function _get_products(){
		if(empty($this->_product)){
			$this->_products = array();
			$query = $this->db->query("
				SELECT p.product_id, pd.name, pc.category_id, p.manufacturer_id FROM " . DB_PREFIX . "product AS p 
				LEFT JOIN " . DB_PREFIX . "product_description AS pd ON pd.product_id = p.product_id 
				LEFT JOIN " . DB_PREFIX . "product_to_category AS pc ON pc.product_id = p.product_id
				WHERE pd.language_id = ".(int)$this->config->get('config_language_id')." AND p.status = 1");
			foreach($query->rows as $prod)
				$this->_products[$prod['product_id']] = array(
															'name'=>$this->clean_name($prod['name']),
															'category_id'=>$prod['category_id'],
															'manufacturer_id'=>$prod['manufacturer_id'],
															);
		}
	}
	private function _get_categories(){
	
		if(empty($this->_categories)){
			$this->_categories = array();
			$query = $this->db->query("
				SELECT c.category_id, c.parent_id, cd.name FROM " . DB_PREFIX . "category AS c 
				LEFT JOIN " . DB_PREFIX . "category_description AS cd ON cd.category_id = c.category_id 
				WHERE cd.category_id = c.category_id AND cd.language_id = ".(int)$this->config->get('config_language_id')." AND c.status = 1");
			foreach($query->rows as $cat){
				$this->_categories[$cat['category_id']] = array(
															'name'=>$this->clean_name($cat['name']),
															'parent'=>$cat['parent_id']
															);
			}
		}
	}
	private function _traverse_categories($catId){
		if(!in_array($catId,$this->_tmp_cat_path))
			$this->_tmp_cat_path[] = $catId;
		$this->_get_categories();
		if(isset($this->_categories[$catId])){
			if($this->_categories[$catId]['parent'] == 0){
				$this->_infoString .= $this->category_identifier.implode($this->category_identifier,array_reverse($this->_tmp_cat_path));
				$this->_infoString = rtrim($this->_infoString, $this->category_identifier);
				$return = $this->_categories[$catId]['name'].'/';
				$this->_tmp_cat_path = array();
			}else{
				$return = $this->_traverse_categories($this->_categories[$catId]['parent']).$this->_categories[$catId]['name'].'/';
			}
		}else{
			$return = '';
		}
		return $return;
	}
	private function _get_manufacturers(){
		if(empty($this->_manufacturers)){
			$this->_manufacturers = array();
			$query = $this->db->query("SELECT manufacturer_id, name FROM " . DB_PREFIX . "manufacturer");
			foreach($query->rows as $man)
				$this->_manufacturers[$man['manufacturer_id']] = $this->clean_name($man['name']);
		}
	}
	private function _get_infos(){
		if(empty($this->_infos)){
			$this->_infos = array();
			$query = $this->db->query("SELECT i.information_id, id.title FROM " . DB_PREFIX . "information AS i LEFT JOIN " . DB_PREFIX . "information_description AS id ON id.information_id = i.information_id WHERE id.information_id = i.information_id AND id.language_id = ".(int)$this->config->get('config_language_id')." AND i.status = 1");
			foreach($query->rows as $infos)
				$this->_infos[$infos['information_id']] = $this->clean_name($infos['title']);
		}
	}

	private function _getLanguages(){
		if(empty($this->_languages)){
			$this->_languages = array();
			$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language` WHERE status = '1'"); 
			foreach ($query->rows as $result) {
				$this->_languages[$result['code']] = $result;
			}
		}
	}

	private function clean_name($name){
		$name = htmlspecialchars_decode($name);
		$bad_array = array("сква",
					   "À","à","Á","á","Â","â","Ã","ã","Ä","ä","Å","å","Ā","ā","Ă","ă","Ą","ą","Ǟ","ǟ","Ǻ","ǻ","Α","α","А","а",
					   "Æ", "æ", "Ǽ", "ǽ", 
					   "Ḃ","ḃ","Б","б",
					   "Ć","ć","Ç","ç","Č","č","Ĉ","ĉ","Ċ","ċ","Ч","ч","Χ","χ",
					   "Ḑ","ḑ","Ď","ď","Ḋ","ḋ","Đ","đ","Ð","ð","Д","д","Δ","δ",
					   "Ǳ",  "ǲ","ǳ", "Ǆ", "ǅ", "ǆ", 
					   "È","è","É","é","Ě","ě","Ê","ê","Ë","ë","Ē","ē","Ĕ","ĕ","Ę","ę","Ė","ė","Ʒ","ʒ","Ǯ","ǯ","Е","е","Э","э","Ε","ε",
					   "Ḟ","ḟ","ƒ","Ф","ф","Φ","φ",
					   "ﬁ", "ﬂ", 
					   "Ǵ","ǵ","Ģ","ģ","Ǧ","ǧ","Ĝ","ĝ","Ğ","ğ","Ġ","ġ","Ǥ","ǥ","Г","г","Γ","γ",
					   "Ĥ","ĥ","Ħ","ħ","Ж","ж","Х","х",
					   "Ì","ì","Í","í","Î","î","Ĩ","ĩ","Ï","ï","Ī","ī","Ĭ","ĭ","Į","į","İ","ı","И","и","Η","η","Ι","ι",
					   "Ĳ", "ĳ", 
					   "Ĵ","ĵ",
					   "Ḱ","ḱ","Ķ","ķ","Ǩ","ǩ","К","к","Κ","κ",
					   "Ĺ","ĺ","Ļ","ļ","Ľ","ľ","Ŀ","ŀ","Ł","ł","Л","л","Λ","λ",
					   "Ǉ", "ǈ", "ǉ", 
					   "Ṁ","ṁ","М","м","Μ","μ",
					   "Ń","ń","Ņ","ņ","Ň","ň","Ñ","ñ","ŉ","Ŋ","ŋ","Н","н","Ν","ν",
					   "Ǌ", "ǋ", "ǌ", 
					   "Ò","ò","Ó","ó","Ô","ô","Õ","õ","Ö","ö","Ō","ō","Ŏ","ŏ","Ø","ø","Ő","ő","Ǿ","ǿ","О","о","Ο","ο","Ω","ω",
					   "Œ", "œ", 
					   "Ṗ","ṗ","П","п","Π","π",
					   "Ŕ","ŕ","Ŗ","ŗ","Ř","ř","Р","р","Ρ","ρ","Ψ","ψ",
					   "Ś","ś","Ş","ş","Š","š","Ŝ","ŝ","Ṡ","ṡ","ſ","ß","С","с","Ш","ш","Щ","щ","Σ","σ","ς",
					   "Ţ","ţ","Ť","ť","Ṫ","ṫ","Ŧ","ŧ","Þ","þ","Т","т","Ц","ц","Θ","θ","Τ","τ",
					   "Ù","ù","Ú","ú","Û","û","Ũ","ũ","Ü","ü","Ů","ů","Ū","ū","Ŭ","ŭ","Ų","ų","Ű","ű","У","у",
					   "В","в","Β","β",
					   "Ẁ","ẁ","Ẃ","ẃ","Ŵ","ŵ","Ẅ","ẅ",
					   "Ξ","ξ",
					   "Ỳ","ỳ","Ý","ý","Ŷ","ŷ","Ÿ","ÿ","Й","й","Ы","ы","Ю","ю","Я","я","Υ","υ",
					   "Ź","ź","Ž","ž","Ż","ż","З","з","Ζ","ζ",
					   "Ь","ь",'Ъ',"ъ","^","&");
    $good_array= array("scow",
					   "A","a","A","a","A","a","A","a","A","a","A","a","A","a","A","a","A","a","A","a","A","a","A","a","A","a",
					   "AE","ae","AE","ae",
					   "B","b","B","b",
					   "C","c","C","c","C","c","C","c","C","c","CH","ch","CH","ch",
					   "D","d","D","d","D","d","D","d","D","d","D","d","D","d",
					   "DZ","Dz","dz","DZ","Dz","dz",
					   "E","e","E","e","E","e","E","e","E","e","E","e","E","e","E","e","E","e","E","e","E","e","Ye","ye","E","e","E","e",
					   "F","f","f","F","f","F","f",
					   "fi","fl",
					   "G","g","G","g","G","g","G","g","G","g","G","g","G","g","G","g","G","g",
					   "H","h","H","h","ZH","zh","H","h",
					   "I","i","I","i","I","i","I","i","I","i","I","i","I","i","I","i","I","i","I","i","I","i","I","i",
					   "IJ","ij",
					   "J","j",
					   "K","k","K","k","K","k","K","k","K","k",
					   "L","l","L","l","L","l","L","l","L","l","L","l","L","l",
					   "LJ","Lj","lj",
					   "M","m","M","m","M","m",
					   "N","n","N","n","N","n","N","n","n","N","n","N","n","N","n",
					   "NJ","Nj","nj",
					   "O","o","O","o","O","o","O","o","O","o","O","o","O","o","O","o","O","o","O","o","O","o","O","o","O","o",
					   "OE","oe",
					   "P","p","P","p","P","p","PS","ps",
					   "R","r","R","r","R","r","R","r","R","r",
					   "S","s","S","s","S","s","S","s","S","s","s","ss","S","s","SH","sh","SHCH","shch","S","s","s",
					   "T","t","T","t","T","t","T","t","T","t","T","t","TS","ts","TH","th","T","t",
					   "U","u","U","u","U","u","U","u","U","u","U","u","U","u","U","u","U","u","U","u","U","u",
					   "V","v","V","v",
					   "W","w","W","w","W","w","W","w",
					   "X","x",
					   "Y","y","Y","y","Y","y","Y","y","Y","y","Y","y","YU","yu","YA","ya","Y","y",
					   "Z","z","Z","z","Z","z","Z","z","Z","z",
					   "'","'",'"','"',""," and ");
	
		$name = str_replace($bad_array,$good_array,$name);
		unset($bad_array);
		unset($good_array);
		
		$name = preg_replace("/[^a-zA-Z0-9]/",$this->_sep,$name);
		
		while(strpos($name, str_repeat($this->_sep,2))){
			$name = str_replace(str_repeat($this->_sep,2),$this->_sep,$name);
		}
		return trim($name,$this->_sep);
	}
	
	
	
	public function index_standard() {
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}
		
		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);
			
			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");
				
				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);
					
					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}
					
					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}	
					
					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}
					
					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}	
				} else {
					$this->request->get['route'] = implode('/',$parts);
					return $this->forward($this->request->get['route']);  
					$this->request->get['route'] = 'error/not_found';	
				}
			}
			
			if (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/product';
			} elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			}
			
			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			}
		}
	}
	
	public function rewrite_standard($link) {
		if ($this->config->get('config_seo_url')) {
			$url_data = parse_url(str_replace('&amp;', '&', $link));
			if(!isset($url_data['query']))return $link;
		
			$url = ''; 
			
			$data = array();
						
			parse_str($url_data['query'], $data);
			
			foreach ($data as $key => $value) {
				if (isset($data['route'])) {
					if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/product' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id')) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");
					
						if ($query->num_rows) {
							$url .= '/' . $query->row['keyword'];
							
							unset($data[$key]);
						}					
					} elseif ($key == 'path') {
						$categories = explode('_', $value);
						
						foreach ($categories as $category) {
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");
					
							if ($query->num_rows) {
								$url .= '/' . $query->row['keyword'];
							}							
						}
						
						unset($data[$key]);
					}
				}
			}
		
			if ($url) {
				unset($data['route']);
			
				$query = '';
			
				if ($data) {
					foreach ($data as $key => $value) {
						$query .= '&' . $key . '=' . $value;
					}
					
					if ($query) {
						$query = '?' . trim($query, '&');
					}
				}
				return $url_data['scheme'] . '://' . $url_data['host'] . (isset($url_data['port']) ? ':' . $url_data['port'] : '') . str_replace('/index.php', '', $url_data['path']) . $url . $query;
			} else {
				return $link;
			}
		} else {
			return $link;
		}		
	}	
}
?>
