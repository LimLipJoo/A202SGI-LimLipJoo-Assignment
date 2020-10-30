<?php
class ModelCatalogTakeawayapi extends Model{
	public function getCustomerInfo($id){
		$query=$this->db->query('SELECT CONCAT(firstname," ",lastname) as name,telephone FROM oc_customer WHERE customer_id='.$id);
		if($query->num_rows){
			return $query->rows[0];
		}
	}
	public function register($username,$password,$fname,$lname,$telno){
            $query=$this->db->query("SELECT email FROM oc_customer WHERE email='".$username."'");
            if($query->num_rows)
                return array("reg"=>"fail","error"=>"E-mail Registered Already.");

            if($query=$this->db->query("INSERT INTO oc_customer SET customer_group_id =1, store_id = 0, language_id =1, firstname = '" . $this->db->escape($fname) . "',
            lastname = '" . $this->db->escape($lname) . "', email = '" . $this->db->escape($username) . "', telephone = '" . $this->db->escape($telno) . "',
             custom_field = '', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "',
              newsletter = 0, ip = '::1', status = 1, date_added = NOW()")){
                return array("reg"=>"success");
            }
            else{
                return array("reg"=>"fail","error"=>"Something Went Wrong. Please Try Again Later");
            }
        }
    
	public function getBanner(){
			$query=$this->db->query("SELECT image,link FROM oc_banner_image LIMIT 5");
			if($query->num_rows)
				return array("getbanner"=>"success","banners"=>$query->rows);
	}
	public function getMenu(){
		$query=$this->db->query("SELECT a.product_id,a.model,a.price,a.image,b.name FROM oc_product a,oc_category_description b,oc_product_to_category c WHERE status=1 AND c.category_id=b.category_id AND a.product_id=c.product_id  ORDER BY b.name");
		if($query->num_rows){
			$temp["food"]=$query->rows;
			$query=$this->db->query("SELECT count(product_id) as count,name FROM (SELECT a.product_id,a.model,a.price,a.image,b.name FROM oc_product a,oc_category_description b,oc_product_to_category c WHERE status=1 AND c.category_id=b.category_id AND a.product_id=c.product_id  ORDER BY b.name) as table1 GROUP BY name");
			$temp["counter"]=$query->rows;
			$temp['menu']="success";
			return $temp;
		}
		return array("menu"=>"fail","error"=>"No Item Found!");
	}
	public function getCart($id){
		$query=$this->db->query("SELECT a.cart_id,a.customer_id,a.product_id,a.quantity,b.model,b.price FROM oc_cart a,oc_product b WHERE a.product_id=b.product_id AND a.customer_id=".$id);
		if($query->num_rows){
			return array("getCart"=>"success","cart"=>$query->rows);
		}
		else{
			return array("getCart"=>"fail","error"=>"No Cart Found!");
		}
		
	}
	public function addCart($cust_id,$product_id,$quantity){
		$query=$this->db->query("SELECT * FROM oc_cart WHERE customer_id=".$cust_id." AND product_id=".$product_id);
		if($query->num_rows){
			$id=$query->row['cart_id'];
			$query=$this->db->query("UPDATE oc_cart SET quantity=".$quantity.",date_added=CURDATE() WHERE cart_id=".$id);
			if($query){
				return array("addCart"=>"success");
			}
			else{
				return array("addCart"=>"fail","error"=>"Failed to add to cart");
			}
		}
		else{
			$query=$this->db->query("INSERT INTO oc_cart(customer_id,product_id,quantity,date_added) VALUES(".$cust_id.",".$product_id.",".$quantity.",CURDATE())");
			if($query){
				return array("addCart"=>"success");
			}
			else{
				return array("addCart"=>"fail","error"=>"Failed to add to cart");
			}
		}
		
	}
	public function removeCart($cust_id,$product_id){
		$query=$this->db->query("DELETE FROM oc_cart WHERE customer_id=".$cust_id." AND product_id=".$product_id);
		if($query){
			return array("removeCart"=>"success");
		}
		else{
			return array("removeCart"=>"fail","error"=>"Failed to remove from cart");
		}
	}
	public function placeOrder($cust_id){
		$query=$this->db->query("SELECT * FROM oc_cart WHERE customer_id=".$cust_id);
		if($query->num_rows){
			$cart=$query->rows;
			$query=$this->db->query("INSERT INTO food_order(customer_id,date_ordered,status) VALUES(".$cust_id.",CURDATE(),'PROCESSING')");
			foreach($cart as $cartitem){
				$query=$this->db->query("INSERT INTO food_order_item(order_id,product_id,quantity) VALUES((SELECT MAX(order_id) FROM food_order WHERE customer_id=".$cust_id."),".$cartitem['product_id'].",".$cartitem['quantity'].")");
			}
			$query=$this->db->query("DELETE FROM oc_cart WHERE customer_id=".$cust_id);
			if($query){
				return array("placeOrder"=>"success");
			}
			else{
				return array("placeOrder"=>"fail","error"=>"Failed to place order");
			}
		}
	}
	public function getOrderHistory($cust_id){
		$query=$this->db->query("SELECT order_id,customer_id,DATE_FORMAT(date_ordered,'%d-%m-%Y') as date_ordered,status FROM food_order WHERE customer_id=".$cust_id." ORDER BY date_ordered DESC");
		if($query->num_rows){
			$orders=$query->rows;
			
			for($i=0;$i<sizeof($orders);$i++){
				$total=0;
				$query=$this->db->query("SELECT a.product_id,a.quantity,b.price FROM food_order_item a,oc_product b WHERE a.product_id=b.product_id AND a.order_id=".$orders[$i]["order_id"]);
				$items=$query->rows;
				foreach($items as $item){
					$total+=$item["quantity"]*$item["price"];
				}
				$orders[$i]["total"]=$total;
			}
			return array("orderHistory"=>"success","history"=>$orders);
		}
		else return array("orderHistory"=>"fail","error"=>"Failed to get order history");
	}
	public function getOrderDetails($order_id){
		$query=$this->db->query("SELECT a.product_id,a.quantity,b.model,b.price FROM food_order_item a,oc_product b WHERE a.product_id=b.product_id AND a.order_id=".$order_id);
		if($query->num_rows){
			return array("getDetails"=>"success","order_details"=>$query->rows);
		}
		else return array("getDetails"=>"fail","error"=>"Failed to get order details");
	}
	public function putToken($token,$id){
		$query=$this->db->query("UPDATE oc_customer SET token='$token' WHERE customer_id=".$id);
		if($query){
			return true;
		}
		else return false;
	}
}
?>