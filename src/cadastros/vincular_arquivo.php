<?php

session_start();
if(!isset($_SESSION['id_usuario']))
{
header("location: ../index.php");
exit;
}	  
include("../CLASSES/conexao.php");

$arquivo = addslashes($_POST['arquivo']);
$id = addslashes($_POST['id']);

if(isset($_POST['enviar-formulario'])):
	$formatosPermitidos = array("png", "jpeg", "jpg", "PNG", "JPG", "JPEG", "PDF", "pdf");
	$quantidadeArquivos = count($_FILES['arquivo']['name']);
	$contador = 0;
	while ($contador < $quantidadeArquivos): 

	$extensao = pathinfo($_FILES['arquivo']['name'][$contador], PATHINFO_EXTENSION);

	if(in_array($extensao, $formatosPermitidos)):
		$pasta = "../arquivos/";
		$temporario = $_FILES['arquivo']['tmp_name'][$contador];
		$novoNome = 'arquivo-'.uniqid().".$extensao";
		$sql_code = "INSERT INTO `arquivo_representantes`(`nome_arquivo`, `caminho_arquivo`, `id_representante_fk`, `nome_representante_fk`, `cnpj_revenda`, `data_registro`) VALUES ('$arquivo', '$novoNome', '$id', (SELECT nome_representante FROM representantes WHERE id_representante = '$id'), (SELECT cnpj_representante FROM representantes WHERE id_representante = '$id'), NOW())";
		if ($con->query($sql_code))
		$msg = "Arquivo enviado com sucesso!";
	else
		$msg = "Falha ao enviar arquivo";
		if(move_uploaded_file($temporario, $pasta.$novoNome)):
			echo ""; 
	else:
			echo "Erro ao enviar o arquivo $temporario";
	endif;
	else:
		echo "$extensao não é permitida <br>"; 
endif;

$contador++;
endwhile;

endif;

echo "<script>
		location.href='../representantes.php?id=$id'
	  </script>";
?>	 