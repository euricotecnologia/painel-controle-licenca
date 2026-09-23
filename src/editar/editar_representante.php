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
$status = addslashes($_POST['status']);


$sql = "UPDATE `representantes` SET `nome_representante`='$nome',`cnpj_representante`='$cnpj',`endereco_representante`='$endereco',`complemento_representante`='$complemento',`numero_representante`='$numero',`bairro_representante`='$bairro',`municipio_representante`='$municipio',`estado_representante`='$estado',`telefone_representante`='$telefone',`email_representante`='$email',`senha_representante`='$senha', `status_representante`='$status' WHERE id_representante = '$id'";
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
		location.href='../lista_cadastros/representantes.php'
	  </script>";
?>	  