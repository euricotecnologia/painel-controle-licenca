<?php
session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}
include("../CLASSES/conexao.php");

$id = $_POST ['id'];

$sql = "DELETE FROM usuarios WHERE id_usuario = '$id'";
$exec = mysqli_query($con,$sql);

$_SESSION['msg'] = "<br><div class='alert alert-custom shadow-lg alert-notice alert-light-danger fade show' role='alert'>
    <div class='alert-icon'><i class='flaticon-warning'></i></div>
    <div class='alert-text h3'><strong>USUÁRIO EXCLUÍDO COM SUCESSO!
	</strong></div>
    <div class='alert-close'>
        <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
            <span aria-hidden='true'><i class='ki ki-close'></i></span>
        </button>
    </div>
</div>";

echo "<script>
		location.href='../lista_cadastros/usuarios.php'
	 </script>";
?> 