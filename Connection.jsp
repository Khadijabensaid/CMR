<%-- 
    Document   : HomeJSP
    Created on : 14 juin 2019, 09:33:41
    Author     : Mad Manson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>CMR Service des Demandes </title>
       
        <link rel="shortcut icon" href="img/logo.png" type="image/x-icon"/>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        
        
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/Login.css">
        
    </head>

    <body class="text-center">

        
          <form class="form-signin" action="ConnectionServlet" method="post" >
          <img class="mb-4" src="img/logo.png" alt="" width="280" height="200">
          <p class="h3 mb-3 font-weight-normal"><i>Entrer votre Matricule et Mot de Passe!</i></p>
          <div style="color:   #ff0000 ;">  ${message}</div>
            <input class="form-control" type="text" name="mat" placeholder="Matricule" required/>
            <input class="form-control"type="password" name="mdp" placeholder="Mot de Passe " required/>
            
            <br><br>
  			<button  class="btn btn-lg btn-primary btn-block" type="submit" >Se Connecter</button>
             <p class="mt-5 mb-3 text-muted">© 2017-2019 Powered by Achraf Saddiki </p>
          </form>
  

        
        
     
       
      
    </body>
</html>
