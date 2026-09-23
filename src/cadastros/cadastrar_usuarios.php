<?php

session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}	  
include("../CLASSES/conexao.php");

$nome = addslashes($_POST['nome']);
$email = addslashes($_POST['email']);
$senha = addslashes($_POST['senha']);

$sql = "INSERT INTO `usuarios`(`nome_usuario`, `email_usuario`, `senha_usuario`, `nivel_acesso`, `status_usuario`, `data_registro`) VALUES ('$nome', '$email', '$senha', '1', '1', NOW())";
$exec = mysqli_query($con,$sql);

echo "<script>
		location.href='../lista_cadastros/usuarios.php'
	  </script>";
?>	  