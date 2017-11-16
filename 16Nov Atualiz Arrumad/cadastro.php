<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Caminho sem Fobia</title>
</head>

<body>

<?php
echo "Funciona?";
// RECEBENDO OS DADOS PREENCHIDOS DO FORMULÁRIO !
	$host= $_POST ["localhost"];
	$bd= $_POST ["caminhosemfobia"];
	$nome= $_POST ["name"];//atribuição do campo "nome" vindo do formulário para variavel
	$email= $_POST ["email"];//atribuição do campo "email" vindo do formulário para variavel
	$senha= $_POST ["senha"];//atribuição do campo "senha" vindo do formulário para variavel
 
//Gravando no banco de dados ! conectando com o localhost - mysql
	$conexao = mysql_connect("localhost","root"); //localhost é onde esta o banco de dados.
	if (!$conexao)
	die ("Erro de conexão com localhost, o seguinte erro ocorreu - ".mysql_error());
 
	//conectando com a tabela do banco de dados
	$banco = mysql_select_db("usuario",$conexao); //nome da tabela que deseja que seja inserida os dados cadastrais
	if (!$banco)
	die ("Erro de conexão com banco de dados, o seguinte erro ocorreu - ".mysql_error());
 
 
	//Query que realiza a inserção dos dados no banco de dados na tabela indicada acima
	$query = "INSERT INTO `usuario` ( `nome_completo` , `email` , `senha`, `cod_usuario` )
	VALUES ('$nome', '$email', '$senha', 1)";
	mysql_query($query,$conexao);
	echo "Seu cadastro foi realizado com sucesso!";
	//mensagem que é escrita quando os dados são inseridos normalmente.
?>

</body>
</html>
