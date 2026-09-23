<?php

session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}	  
include("../CLASSES/conexao.php");

$nome = addslashes($_POST['nome']);
$cnpj = addslashes($_POST['cnpj']);
$endereco = addslashes($_POST['endereco']);
$complemento = addslashes($_POST['complemento']);
$bairro = addslashes($_POST['bairro']);
$numero = addslashes($_POST['numero']);
$municipio = addslashes($_POST['municipio']);
$estado = addslashes($_POST['estado']);
$telefone = addslashes($_POST['telefone']);
$email = addslashes($_POST['email']);
$senha = addslashes($_POST['senha']);

$sql = "INSERT INTO `representantes`(`nome_representante`, `cnpj_representante`, `endereco_representante`, `complemento_representante`, `numero_representante`, `bairro_representante`, `municipio_representante`, `estado_representante`, `telefone_representante`, `email_representante`, `senha_representante`, `status_representante`, `data_registro`) VALUES ('$nome', '$cnpj', '$endereco', '$complemento', '$numero', '$bairro', '$municipio', '$estado', '$telefone', '$email', '$senha', '1', NOW())";
$exec = mysqli_query($con,$sql);

$sql2 = "INSERT INTO `usuarios`(`nome_usuario`, `email_usuario`, `senha_usuario`, `nivel_acesso`, `status_usuario`, `cnpj_revenda`, `data_registro`) VALUES ('$nome', '$email', '$senha', '0', '1', '$cnpj', NOW())";
$exec = mysqli_query($con, $sql2);

echo "<script>
		location.href='../lista_cadastros/representantes.php'
	  </script>";
?>	  