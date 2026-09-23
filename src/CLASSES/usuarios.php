<?php


Class Usuario
{
    private $pdo;
    public function conectar($nome, $host, $usuario, $senha)
    {

        global $pdo;
        try {
          $pdo = new PDO("mysql:dbname=".$nome.";host=".$host,$usuario,$senha);
          
        } catch (PDOException $e) {
            $msgErro = $e->getMessage();   
        }

    }

    public function logar($login, $senha)
    {
        global $pdo;
        //Verificar se o email e senha estão cadastrados, se sim
        $sql = $pdo->prepare("SELECT id_usuario, cnpj_revenda FROM usuarios WHERE email_usuario = :lo AND senha_usuario = :s ");
        $sql->bindValue(":lo",$login);
        $sql->bindValue(":s",$senha); 
        $sql->execute();
        if($sql->rowCount() > 0)
        {
            //Entrar no sistema(sessão)
            $dado = $sql->fetch();
            session_start();
            $_SESSION['id_usuario'] = $dado['id_usuario'];
            $_SESSION['cnpj_revenda'] = $dado['cnpj_revenda'];
            return true; //logado com sucesso
        }   
        else
        {
            return false; //não conseguiu logar
        }   
    }
    
}

?>