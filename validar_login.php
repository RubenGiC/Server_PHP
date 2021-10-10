<?php
//realizo la conexion con la base de datos
include 'conexion.php';
//recibo los datos que manda la app de android
$usuario = $_POST['usuario'];
$password = $_POST['password'];

//$usuario = "ruben";
//$password="ruben";

//creo la sentencia sql
$sentencia = $conexion->prepare("SELECT * FROM login WHERE usuario=? AND password=?");
//meto los parametros en la sentencia
$sentencia->bind_param('ss',$usuario,$password);
//y ejecuto la sentencia
$sentencia->execute();
//obtengo el resultado de dicha sentencia
$resultado = $sentencia->get_result();

//si es correcta devuelvo un json con la info a la app de android
if($fila = $resultado->fetch_assoc()){
	echo json_encode($fila,JSON_UNESCAPED_UNICODE);
}
//cierro la sentencia y la conexion con la base de datos
$sentencia->close();
$conexion->close();
?>
