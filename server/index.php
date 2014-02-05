<?php
require_once 'global.php';
require_once 'libs/plugins.php';

if( isset($_POST['data']) && isset($_POST['medium']) ) {
	
	if( is_array( $_POST['data'] ) || is_array( $_POST['medium'] ) ) {
		get_off();
	}
	
	$data = json_decode(base64_decode($_POST['data']));
	
	if( $data ) {
		
		$temp = explode("_", $_POST['medium']);
		
		if(count($temp) < 2) { get_off(); }
		
		
		if ( file_exists( 'plugins/' . $temp[0] . '.php' ) ) {
			require_once 'plugins/' . $temp[0] . '.php';
			
			$object = new $temp[0]();
			
			if( method_exists($object, implode("_", $temp)) ) {
				call_user_func(array($object, implode("_", $temp)), $data, $mysqli);
				
				echo json_encode(array("status"=>"true"));
			} else {
				get_off("Invalid medium, I guess..");
			}
			
		} else {
			get_off("Wrong medium, I guess..");
		}
	} else {
		get_off("OOooOoppsss!! Json corrupt.");
	}
} else {
	get_off("Not enough data.");
}

function get_off($message) {
	echo json_encode(array("status"=>"false", "message"=>$message));
	die();
}
?>
