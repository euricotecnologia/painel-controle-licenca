<?php

$con = mysqli_connect('localhost','usuario','senha','banco');

if ($con->connect_errno)

	echo "Falha na conexao: (".$con->connect_errno.") ".$con->connect_error;

?>