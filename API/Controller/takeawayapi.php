<?php
class ControllerApiTakeawayapi extends Controller{
	public function login(){
		$this->load->model('catalog/takeawayapi');
		$this->load->model('account/customer');
		$json = array();
		if($this->customer->login($this->request->post['email'],$this->request->post['password'])){
			$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
			$json['auth']="success";
		    $json['customer_id']=$this->customer->getId();
			$tmp=$this->model_catalog_takeawayapi->getCustomerInfo($json['customer_id']);
			$json['name']=$tmp['name'];
			$json['tel_no']=$tmp['telephone'];
			if(isset($this->request->post["token"])){
				$this->model_catalog_takeawayapi->putToken($this->request->post["token"],$this->customer->getId());
			}
		}
		else{
			$json['auth']="fail";
			$json['error']="Invalid Credentials";
		}
		if (isset($this->request->server['HTTP_ORIGIN'])) {
		  $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
		  $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
		  $this->response->addHeader('Access-Control-Max-Age: 1000');
		  $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	 public function register(){
		if(isset($this->request->post['email'])&&isset($this->request->post['password'])&&isset($this->request->post['f_name'])&&isset($this->request->post['l_name'])&&isset($this->request->post['tel_no'])){
		  $email=$this->request->post['email'];
		  $password=$this->request->post['password'];
		  $fname=$this->request->post['f_name'];
		  $lname=$this->request->post['l_name'];
		  $telno=$this->request->post['tel_no'];

		  // load model
		  $this->load->model('catalog/takeawayapi');

		  // get products
		  $result = $this->model_catalog_takeawayapi->register($email,$password,$fname,$lname,$telno);
		  //print_r($result);
		}
		else{
		  $result['reg']="fail";
		}
		  
		if (isset($this->request->server['HTTP_ORIGIN'])) {
		  $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
		  $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
		  $this->response->addHeader('Access-Control-Max-Age: 1000');
		  $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($result));
	  }
	  public function getBanner(){
		   $this->load->model('catalog/takeawayapi');
		   $result = $this->model_catalog_takeawayapi->getBanner();
		   if (isset($this->request->server['HTTP_ORIGIN'])) {
		  $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
		  $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
		  $this->response->addHeader('Access-Control-Max-Age: 1000');
		  $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($result));
	  }
	  public function getMenu(){
		  $this->load->model('catalog/takeawayapi');
		  $result = $this->model_catalog_takeawayapi->getMenu();
		  if (isset($this->request->server['HTTP_ORIGIN'])) {
		  $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
		  $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
		  $this->response->addHeader('Access-Control-Max-Age: 1000');
		  $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($result));
	  }
	  public function getCart(){
		  $this->load->model("catalog/takeawayapi");
		  if(isset($this->request->post["customer_id"])){
			  $result = $this->model_catalog_takeawayapi->getCart($this->request->post["customer_id"]);
			  
		  }
		  else{
			  $result["getCart"]="fail";
		  }
		  if (isset($this->request->server['HTTP_ORIGIN'])) {
			  $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			  $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			  $this->response->addHeader('Access-Control-Max-Age: 1000');
			  $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($result));
	  }
	  public function AddCart(){
		  $this->load->model("catalog/takeawayapi");
		  
		  if(isset($this->request->post["customer_id"])&&isset($this->request->post["product_id"])&&isset($this->request->post["quantity"])){
			  $result=$this->model_catalog_takeawayapi->addCart($this->request->post["customer_id"],$this->request->post["product_id"],$this->request->post["quantity"]);
		  }
		  else{
			$result["addCart"]="fail";
		  }
		  
		   if (isset($this->request->server['HTTP_ORIGIN'])) {
			  $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			  $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			  $this->response->addHeader('Access-Control-Max-Age: 1000');
			  $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($result));
	  }
	  
	  public function removeCart(){
		  $this->load->model("catalog/takeawayapi");
		  if(isset($this->request->post["customer_id"])&&isset($this->request->post["product_id"])){
		    $result=$this->model_catalog_takeawayapi->removeCart($this->request->post["customer_id"],$this->request->post["product_id"]);
		  }
		  else{
			$result["removeCart"]="fail";
		  }
		  if (isset($this->request->server['HTTP_ORIGIN'])) {
			  $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			  $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			  $this->response->addHeader('Access-Control-Max-Age: 1000');
			  $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($result));
			
	  }
	  public function placeOrder(){
		  $this->load->model("catalog/takeawayapi");
		  if(isset($this->request->post["customer_id"])){
		    $result=$this->model_catalog_takeawayapi->placeOrder($this->request->post["customer_id"]);
		  }
		  else{
			  $result["placeOrder"]="fail";
		  }
		  if (isset($this->request->server['HTTP_ORIGIN'])) {
			  $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			  $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			  $this->response->addHeader('Access-Control-Max-Age: 1000');
			  $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($result));
	  }
	  public function getOrderHistory(){
		  $this->load->model("catalog/takeawayapi");
		  if(isset($this->request->post["customer_id"])){
			  $result=$this->model_catalog_takeawayapi->getOrderHistory($this->request->post["customer_id"]);
		  }
		  else{
			  $result["orderHistory"]="fail";
		  }
		  if (isset($this->request->server['HTTP_ORIGIN'])) {
			  $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			  $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			  $this->response->addHeader('Access-Control-Max-Age: 1000');
			  $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($result));
	  }
	  public function getOrderDetails(){
		  $this->load->model("catalog/takeawayapi");
		  if(isset($this->request->post["order_id"])){
			  $result=$this->model_catalog_takeawayapi->getOrderDetails($this->request->post["order_id"]);
		  }
		  else{
			  $result["getDetails"]="fail";
		  }
		  if (isset($this->request->server['HTTP_ORIGIN'])) {
			  $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			  $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			  $this->response->addHeader('Access-Control-Max-Age: 1000');
			  $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($result));
	  }
}
?>