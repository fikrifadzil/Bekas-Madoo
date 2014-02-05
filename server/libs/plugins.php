<?php

class plugins {
	
	function clean_data( $data, $mysqli ) {
		foreach($data as $key_out=>$val_out) {
			foreach($val_out as $key_in=>$val_in) {
				$data[$key_out][$val_in] = $mysqli->real_escape_string(strval($val_in));
			}
		}
		
		return $data;
	}
}
