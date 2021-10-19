<?php
//realizo la conexion con la base de datos
include 'conexion.php';
//recibo los datos que manda la app de android de tipo GET
$id = $_GET['id'];
$dia_semana = $_GET['semana'];

$hoy = date('H:i');
//echo $hoy;

//creo la sentencia sql
$sentencia = $conexion->prepare("SELECT asig.id, asig.nombre, asig.hora, asig.aula FROM asig_alumnos asal, asignatura asig WHERE asal.id_alumno=? and asig.id = asal.id_asignatura and asig.dia_semana=? and asig.hora >= ?");
//meto los parametros en la sentencia
$sentencia->bind_param('sss',$id,$dia_semana,$hoy);
//y ejecuto la sentencia
$sentencia->execute();
//obtengo el resultado de dicha sentencia
$resultado = $sentencia->get_result();

//si es correcta devuelvo un json con la info a la app de android
while($fila = $resultado->fetch_array()){
	$asignaturas[] = array_map('utf8_encode',$fila);
}
echo json_encode($asignaturas);
//cierro la sentencia y la conexion con la base de datos
$sentencia->close();
$conexion->close();
?>
