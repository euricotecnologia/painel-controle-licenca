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
$terminal = addslashes($_POST['terminal']);

$sql1 = "UPDATE `clientes` SET `limita_nota_qtde`='$terminal' WHERE `id` = '$id'";
$exec = mysqli_query($con,$sql1);

echo "<script>
		location.href='../clientes.php?id=$id&cnpj=$cnpj'
	 </script>";
?>	 