

<?php
   include("teste.php");
   session_start();

 	$user_check = $_SESSION['login_user'];
   
   $ses_sql = mysqli_query($db,"select email from admin where email = '$user_check' ");
   
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $row['email'];
   
   if(!isset($_SESSION['login_user'])){
      header("location:perfil_incompleto.html");
   }
   
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      
      $email = mysqli_real_escape_string($db,$_POST['email']);
      $senha = mysqli_real_escape_string($db,$_POST['senha']); 
      
      $sql = "SELECT id FROM admin WHERE username = '$email' and passcode = '$senha'";
      $result = mysqli_query($db,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $active = $row['active'];
      
      $count = mysqli_num_rows($result);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
		
      if($count == 1) {
         session_register("email");
         $_SESSION['login_user'] = $email;
         
         header("location: perfil_incompleto.html");
      }else {
         $error = "O seu login está inválido";
			header("location: falha_login.html");
      }
   }
?>

