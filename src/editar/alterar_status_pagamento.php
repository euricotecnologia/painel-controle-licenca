<?php
session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}
include("../CLASSES/conexao.php");

$id = addslashes($_POST['id']);
$status = addslashes($_POST['status']);

$sql1 = "UPDATE `clientes` SET `status_pagamento`='$status' WHERE `id` = '$id'";
$exec = mysqli_query($con,$sql1);

// $sql2 = "INSERT INTO `registro_bloqueio`(`tipo_registro`, `observacao_registro`, `id_usuario_fk`, `nome_usuario_fk`, `id_cliente_fk`, `nome_cliente_fk`, `data_registro`) VALUES ('$status', '$obs', '".$_SESSION['id_usuario']."', (SELECT nome_usuario FROM usuarios WHERE id_usuario = '".$_SESSION['id_usuario']."'), '$id', (SELECT nome_fantasia FROM clientes WHERE id = '$id'), NOW())";
// $exec = mysqli_query($con,$sql2);

echo "<script>
		location.href='../contas.php'
	 </script>";
?>	 