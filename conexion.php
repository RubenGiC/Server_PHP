<?php
$hostname = 'localhost';
$db = 'myclass';
$username='root';
$password = '';

$conexion = new mysqli($hostname, $username, $password, $db);

if($conexion->connect_errno){
	echo "Error de conexion con la base de datos";
}
?>
