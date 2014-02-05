<?php

// MySQL configuration
$host = 'localhost';
$user = 'root';
$pass = '';
$name = 'bekasmadoo';

// Sensor ip addresses - white list
$sensors = array(
	'127.0.0.1',
	'::1',
	);
	
// Halt if the request isn't coming from your sensor(a)
$halt = true;

foreach( $sensors as $sensor ) {
	if( $sensor == $_SERVER['REMOTE_ADDR'] ) {
		$halt = false;
	}
}

if( $halt ) {
	echo json_encode(array("status"=>"false"));
	die();
}

$mysqli = new mysqli($host, $user, $pass, $name);

if ($mysqli->connect_error) {
	die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
}

$mysqli->autocommit(FALSE);
?>
