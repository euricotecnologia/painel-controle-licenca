<?php 

session_start();
unset($_SESSION['id_usuario']);
unset($_SESSION['cnpj_revenda']);
header("location: index.php");

 ?>