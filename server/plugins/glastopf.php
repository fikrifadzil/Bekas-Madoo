<?php

class glastopf extends plugins {
	
	function glastopf_events($data, $mysqli) {
		
		$data = $this->clean_data( $data, $mysqli );
		
		foreach( $data as $temp ) {
			$ip = explode(":", $temp[2]);
			$T = "'" . $temp[0] . "',INET_ATON('" . $_SERVER['REMOTE_ADDR'] . "'),'" . $temp[1] . "',INET_ATON('" . $ip[0] . "'),'" . $temp[3] . "','" . $temp[4] . "','" . $temp[5] . "','" . $temp[6] . "'";
			$Q = "INSERT IGNORE INTO glastopf_events VALUES (" . $T . ")";
			
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();
			
			echo json_encode(array("status"=>"false", "message"=>$message));
			die();
		}
	}
	
	
}

?>
