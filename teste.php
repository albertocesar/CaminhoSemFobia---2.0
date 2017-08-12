<?php
echo "Funciona?<br>";
// RECEBENDO OS DADOS PREENCHIDOS DO FORMULÁRIO !
	$nome= $_POST ["nome_completo"];//atribuição do campo "nome" vindo do formulário para variavel
	$email= $_POST ["email"];//atribuição do campo "email" vindo do formulário para variavel
	$senha= $_POST ["senha"];//atribuição do campo "senha" vindo do formulário para variavel

//Gravando no banco de dados ! conectando com o localhost - mysql
	$conexao = mysqli_connect("localhost","root","root","caminhosemfobia"); //localhost é onde esta o banco de dados.
	if (!$conexao)
	    die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysqli_connect_error());
    else
        echo "Success: A proper connection to MySQL was made! The my_db database is great." . PHP_EOL;
 
	//conectando com a tabela do banco de dados
    $query = "SELECT email from usuario where email=\"$email\"";
    echo "<br>$query";

    if ($result = mysqli_query($conexao,$query)) {
        $row = $result->fetch_row();
        if ($row[0] == null || $row[0] == "") {
            echo "go, mtf!";
            //Query que realiza a inserção dos dados no banco de dados na tabela indicada acima
//TODO: criar sequence no BD
//TODO: puxar um nextvalue da sequence para colocar como valor do cod_usuario
    	    $query = "INSERT INTO usuario (nome_completo, email, senha, cod_usuario) VALUES (\"$nome\", \"$email\", \"$senha\", 3)";
    	    if($result = mysqli_query($conexao,$query))
    	        echo "Seu cadastro foi realizado com sucesso!";
            else
                echo "bosta.";
        } else {
            echo "<br>Email já cadastrado: \"", $row[0],"\".";
        }
    } else {
        echo "bug ao consultar o BD.";        
    }
    $result->close();
    mysqli_close($conexao);

	//$banco = mysqli_select_db("usuario",$conexao); //nome da tabela que deseja que seja inserida os dados cadastrais
	//if (!$banco)
	//die ("Erro de conexão com banco de dados, o seguinte erro ocorreu -> ".mysql_error());
 
 
	
?>
