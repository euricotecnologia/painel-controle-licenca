<?php
session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}
include("../CLASSES/conexao.php");

$id = addslashes($_POST['id']);
$cnpj = addslashes($_POST['cnpj']);
$status = addslashes($_POST['status']);

$sql1 = "UPDATE `terminais` SET `status`='$status' WHERE `codigo` = '$id'";
$exec = mysqli_query($con,$sql1);

echo "<script>
		location.href='../lista_cadastros/clientes.php'
	 </script>";
?>	 