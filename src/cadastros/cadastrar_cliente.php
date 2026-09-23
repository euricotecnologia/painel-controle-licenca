<?php

session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}	  
include("../CLASSES/conexao.php");

$razao = addslashes($_POST['razao']);
$nome = addslashes($_POST['nome']);
$cnpj = addslashes($_POST['cnpj']);
$in = addslashes($_POST['in']);
$endereco = addslashes($_POST['endereco']);
$complemento = addslashes($_POST['complemento']);
$bairro = addslashes($_POST['bairro']);
$numero = addslashes($_POST['numero']);
$municipio = addslashes($_POST['municipio']);
$estado = addslashes($_POST['estado']);
$telefone = addslashes($_POST['telefone']);
$email = addslashes($_POST['email']);
$regime = addslashes($_POST['regime']);
$data_contrato = addslashes($_POST['data_contrato']);
$cnpj_revenda = addslashes($_POST['cnpj_revenda']);

$sql = "INSERT INTO `clientes`(`nome_razao`, `nome_fantasia`, `cnpj`, `in_estadual`, `endereco`, `complemento`, `bairro`, `numero`, `municipio`, `estado`, `telefone`, `email`, `regime`, `data_contrato`, `status`, `cnpj_revenda`, `ultimo_acesso`) VALUES ('$razao', '$nome', '$cnpj', 'in', '$endereco', '$complemento', '$bairro', '$numero', '$municipio', '$estado', '$telefone', '$email', '$regime', '$data_contrato', '1', '$cnpj_revenda', '0000-00-00')";
$exec = mysqli_query($con,$sql);

echo "<script>
		location.href='../lista_cadastros/clientes.php'
	  </script>";
?>	  