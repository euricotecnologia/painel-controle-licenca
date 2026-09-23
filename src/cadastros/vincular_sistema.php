<?php

session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}	  
include("../CLASSES/conexao.php");

$sistema = addslashes($_POST['sistema']);
$id = addslashes($_POST['id']);

$sql = "INSERT INTO `sistema_representantes`(`id_unico_sistema_r`, `nome_sistema_r`, `id_representante_fk`, `nome_representante_fk`, `cnpj_revenda`, `data_registro`) VALUES ((SELECT id_unico_sistema FROM sistemas WHERE id_sistema = '$sistema'), (SELECT nome_sistema FROM sistemas WHERE id_sistema = '$sistema'), '$id', (SELECT nome_representante FROM representantes WHERE id_representante = '$id'), (SELECT cnpj_representante FROM representantes WHERE id_representante = '$id'), NOW())";
$exec = mysqli_query($con,$sql);

echo "<script>
		location.href='../representantes.php?id=$id'
	  </script>";
?>	  