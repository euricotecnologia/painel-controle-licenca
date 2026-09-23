<?php
session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}
include("../CLASSES/conexao.php");

$quantidade = addslashes($_POST['quantidade']);

$sql1  = "DROP EVENT IF EXISTS `BLOQUEIO`";
$exec = mysqli_query($con,$sql1);

$sql  = "CREATE EVENT `BLOQUEIO` ON SCHEDULE EVERY 1 MINUTE STARTS '2021-08-02 05:00:00:00.000000' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN UPDATE `clientes` SET `status`= '0', `status_pagamento` = '0' WHERE `data_vencimento` >= (SELECT CURDATE()+$quantidade) AND status != '0'; END";
$exec = mysqli_query($con,$sql);

$sql2  = "UPDATE `bloqueio_vencimento` SET `valor_bloqueio`='$quantidade', `id_usuario_fk`='".$_SESSION['id_usuario']."',`nome_usuario_fk`=(SELECT nome_usuario FROM usuarios WHERE id_usuario = '".$_SESSION['id_usuario']."'),`data_registro`=NOW()";
$exec = mysqli_query($con,$sql2);

$_SESSION['msg'] = "<br><div class='alert alert-custom shadow-lg alert-notice alert-light-primary fade show' role='alert'>
    <div class='alert-icon'><i class='flaticon-warning'></i></div>
    <div class='alert-text h3'><strong>ALTERAÇÃO REALIZADA COM SUCESSO! ALTERADO PARA $quantidade DIAS.
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