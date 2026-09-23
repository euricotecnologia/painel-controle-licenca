<?php

session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}	  
include("../CLASSES/conexao.php");

$id = addslashes($_POST['id']);
$nome = addslashes($_POST['nome']);

$sql = "INSERT INTO `sistemas`(`nome_sistema`, `id_unico_sistema`, `status_sistema`, `data_registro`) VALUES ('$nome', '$id', '1', NOW())";
$exec = mysqli_query($con,$sql);

echo "<script>
		location.href='../lista_cadastros/sistemas.php'
	  </script>";
?>	  