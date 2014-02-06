<?php

class kippo extends plugins {
	
	function kippo_auth($data, $mysqli) {
		
		$data = $this->clean_data( $data, $mysqli );
		
		foreach( $data as $temp ) {
			$T = "'" . $temp[0] . "',INET_ATON('" . $_SERVER['REMOTE_ADDR'] . "'),'" . $temp[1] . "','" . $temp[2] . "',unhex('" . $temp[3] . "'),unhex('" . $temp[4] . "'),'" . $temp[5] . "'";
			$Q = "INSERT IGNORE INTO kippo_auth VALUES (" . $T . ")";
			
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();
			
			echo json_encode(array("status"=>"false", "message"=>$message));
			die();
		}
	}
	
	function kippo_clients($data, $mysqli) {
		
		$data = $this->clean_data( $data, $mysqli );
		
		foreach( $data as $temp ) {
			$T = "'" . $temp[0] . "',INET_ATON('" . $_SERVER['REMOTE_ADDR'] . "'),'" . $temp[1] . "'";
			$Q = "INSERT IGNORE INTO kippo_clients VALUES (" . $T . ")";
			
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();
			
			echo json_encode(array("status"=>"false", "message"=>$message));
			die();
		}
	}
	
	function kippo_downloads($data, $mysqli) {
		
		$data = $this->clean_data( $data, $mysqli );
		
		foreach( $data as $temp ) {
			$T = "'" . $temp[0] . "',INET_ATON('" . $_SERVER['REMOTE_ADDR'] . "'),'" . $temp[1] . "','" . $temp[2] . "','" . $temp[3] . "','" . $temp[4] . "'";
			$Q = "INSERT IGNORE INTO kippo_downloads VALUES (" . $T . ")";
			
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();
			
			echo json_encode(array("status"=>"false", "message"=>$message));
			die();
		}
	}
	
	function kippo_input($data, $mysqli) {
		
		$data = $this->clean_data( $data, $mysqli );
		
		foreach( $data as $temp ) {
			$T = "'" . $temp[0] . "',INET_ATON('" . $_SERVER['REMOTE_ADDR'] . "'),'" . $temp[1] . "','" . $temp[2] . "','" . $temp[3] . "','" . $temp[4] . "','" . $temp[5] . "'";
			$Q = "INSERT IGNORE INTO kippo_input VALUES (" . $T . ")";
			
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();
			
			echo json_encode(array("status"=>"false", "message"=>$message));
			die();
		}
	}
	
	function kippo_sessions($data, $mysqli) {
		
		$data = $this->clean_data( $data, $mysqli );
		
		foreach( $data as $temp ) {
			$T = "'" . $temp[0] . "',INET_ATON('" . $_SERVER['REMOTE_ADDR'] . "'),'" . $temp[1] . "','" . $temp[2] . "',INET_ATON('" . $temp[4] . "'),'" . $temp[5] . "','" . $temp[6] . "'";
			$Q = "INSERT IGNORE INTO kippo_sessions VALUES (" . $T . ")";
			
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();
			
			echo json_encode(array("status"=>"false", "message"=>$message));
			die();
		}
	}
	
	function kippo_ttylog($data, $mysqli) {
		
		$data = $this->clean_data( $data, $mysqli );
		
		foreach( $data as $temp ) {
			$T = "'" . $temp[0] . "',INET_ATON('" . $_SERVER['REMOTE_ADDR'] . "'),'" . $temp[1] . "',unhex('" . $temp[2] . "')";
			$Q = "INSERT IGNORE INTO kippo_ttylog VALUES (" . $T . ")";
			
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
