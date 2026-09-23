<?php
session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}
include("../CLASSES/conexao.php");

$id = addslashes($_POST['id']);
$id_unico = addslashes($_POST['id_unico']);
$nome = addslashes($_POST['nome']);
$status = addslashes($_POST['status']);

$sql1 = "UPDATE `sistemas` SET `id_unico_sistema`='$id_unico',`nome_sistema`='$nome',`status_sistema`='$status' WHERE `id_sistema` = '$id'";
$exec = mysqli_query($con,$sql1);

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
		location.href='../lista_cadastros/sistemas.php'
	 </script>";
?>	 