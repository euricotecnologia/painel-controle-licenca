<?php

session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}	  
include("../CLASSES/conexao.php");

$id = addslashes($_POST['id']);
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

$sql = "UPDATE `clientes` SET `nome_razao`='$razao',`nome_fantasia`='$nome',`cnpj`='$cnpj',`in_estadual`='$in',`endereco`='$endereco',`complemento`='$complemento',`bairro`='$bairro',`numero`='$numero',`municipio`='$municipio',`estado`='$estado',`telefone`='$telefone',`email`='$email',`regime`='$regime',`data_contrato`='$data_contrato' WHERE id = '$id'";
$exec = mysqli_query($con,$sql);

$_SESSION['msg'] = "<br><div class='alert alert-custom shadow-lg alert-notice alert-light-primary fade show' role='alert'>
    <div class='alert-icon'><i class='flaticon-warning'></i></div>
    <div class='alert-text h3'><strong>EDIÇÃO REALIZADA COM SUCESSO!
	</strong></div>
    <div class='alert-close'>
        <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
            <span aria-hidden='true'><i class='ki ki-close'></i></span>
        </button>
    </div>
</div>";

echo "<script>
		location.href='../lista_cadastros/clientes.php'
	  </script>";
?>	  