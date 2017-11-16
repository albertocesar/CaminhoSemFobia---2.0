<?php

	// RECEBENDO OS DADOS PREENCHIDOS DO FORMULÁRIO !
	$nome= $_POST ["nome_completo"];//atribuição do campo "nome" vindo do formulário para variavel
	$email= $_POST ["email"];//atribuição do campo "email" vindo do formulário para variavel
	$senha= $_POST ["senha"];//atribuição do campo "senha" vindo do formulário para variavel

	//Gravando no banco de dados ! conectando com o localhost - mysql
	$conexao = mysqli_connect("localhost","root","root","caminhosemfobia"); //localhost é onde esta o banco de dados.
	if (!$conexao)
	    die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysqli_connect_error()); //TODO: direcionar p página de erro
 
	//conectando com a tabela do banco de dados
    $query = "SELECT email from usuario where email=\"$email\"";
    if ($result = mysqli_query($conexao,$query)) {
        $row = $result->fetch_row();
        if ($row[0] == null || $row[0] == "") {
            //Query que realiza a inserção dos dados no banco de dados na tabela indicada acima
//TODO: criar sequence no BD
    	    $query = "INSERT INTO usuario (nome_completo, email, senha, cod_usuario) VALUES (\"$nome\", \"$email\", \"$senha\", NULL)";
    	    if($result = mysqli_query($conexao,$query))
    	        echo "Seu cadastro foi realizado com sucesso!"; //TODO: direcionar p pag de Cadastro realizado com sucesso
            else
                echo "bosta."; //TODO: direcionar p página de erro
			$error = "inválido";
			header("location: erro_generico.html");
        } else {
            echo "<br>Email já cadastrado: \"", $row[0],"\"."; //TODO: direcionar p página de erro (avisar q o email já está cadastrado)
        }
    } else {
        echo "bug ao consultar o BD.";    //TODO: direcionar p página de erro
    }
    $result->close();
    mysqli_close($conexao);
	
?>
