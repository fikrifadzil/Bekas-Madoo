<?php

class plugins {
	
	function clean_data( $data, $mysqli ) {
		$outside = 0; $inside = 0;

		foreach($data as $row) {
			foreach($row as $element) {
				$data[ $outside ][ $inside++ ] = $mysqli->real_escape_string(strval($element));
			}

			$outside++;
		}
		
		return $data;
	}
}
