<%-- 
    Document   : adminAcceuil
    Created on : 18 juin 2019, 15:32:03
    Author     : Mad Manson
--%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Beans.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>  


    
    
<!DOCTYPE html>
<html>
<title>Matrice d Analyse</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/table2.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/table.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large  w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>CMR</a>
    <button class="w3-button  w3-right" title="Notifications"><i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block " style="width:300px">
      <a href="#" class="w3-bar-item w3-button">One new friend request</a>
      <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
    </div>
     <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">
 
  </div>

  </a>
 </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>

<%
 User utilisateur = (User) request.getSession().getAttribute("user");


%>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
  
  
  
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center"><%=  utilisateur.getNom().substring(0, 1).toUpperCase() + utilisateur.getNom().substring(1)+" "+ utilisateur.getPrenom().substring(0, 1).toUpperCase() + utilisateur.getPrenom().substring(1)   %></h4>
         <% String gender;


         gender =utilisateur.getSexe();
         if(gender.equals("homme") ){%> 
         <p class="w3-center"><img src="img/male.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
        <%}else {%>
        
        
        
        
         <p class="w3-center"><img src="img/female.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <%} %>  <hr>
         <p><i class="fa fa-id-card-o fa-fw w3-margin-right w3-text-theme"></i> <%= utilisateur.getMat()  %></p>
         <p><i class="fa fa-suitcase fa-fw w3-margin-right w3-text-theme"></i>  <%= utilisateur.getRole()  %></p>
        </div>
      </div>
      
      <br>
      
      <!-- Fonctionalittées -->
      <div class="w3-card w3-round">
         <div class="w3-white">
        
        <form action="ServiceInfoServlet" method="post">
				<input type="hidden" name="action" value="acceuil" />
				<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>Consulter Les Demandes</button>              
			</form>
	   <form action="ServiceInfoServlet" method="post">
				<input type="hidden" name="action" value="cab" />
				<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>Plannifier un CAB</button>              
		</form>
		<form action="ServiceInfoServlet" method="post">
				<input type="hidden" name="action" value="affecter" />
				<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa fa-users fa-fw w3-margin-right"></i>Affecter les Demandes</button>              
		</form>
			                        
          <a href="Connection.jsp"  style="text-decoration: none;"><button class="w3-button w3-block w3-theme-d3 w3-left-align"><i class="fa fa-sign-out fa-fw w3-margin-right"></i>Logout</button></a>
        
        	
			
  
        </div>       
      </div>
      <br>
      
   
    
    <!-- End Left Column -->
    </div>



    <%

	Demande demande =DataBaseMethodes.GetDemandeWithId((String) request.getParameter( "id-demande" ));
	User demandeur = DataBaseMethodes.GetUserWithMat(demande.getId_demandeur());

%>
    <!-- Middle Column -->
    <div class="w3-col m7">
    <form action="ServiceInfoMatrice" method="post" />	
    <!-- DashBoard  -->
      <div class="w3-row-padding" >
      <div class="w3-container w3-card w3-white w3-round  " style=" min-height: 250px;"><br>
      
      
      <div class="container-table2">
     
			<div role="region" tabindex="0" >
      <table id="Titre" role="table" >
			      <tr role="row" >
			        <th role="columnheader">Demande N°</th>
			        <th role="columnheader"><%=demande.getId() %></th>
			        <th role="columnheader">Nature de Changement :</th>
					<th role="columnheader"><%=demande.getType() %></th>			        						        
			      </tr>
		</table>
		</div></div>
        <br>
		 
      <input type="hidden" name="ToDo" value="matrice" />

        <h4 class="w3-center">Matrice d'Analyse d'Impact de changement </h4>
        <hr>
        <br> 	
        <div class="container-table100">
         
			<div role="region" tabindex="0" >
			<input type="hidden" name="id-demande" value="<%=demande.getId() %>" />
				<table id="champs" role="table"  >
				
			      <tr role="row">
			        <th role="columnheader">Facteur d'Impact</th>
			        <th role="columnheader">Réponse</th>
			        <th role="columnheader">Signification de 1</th>
					<th role="columnheader">Signification de 5</th>			        
					<th role="columnheader">Score (1-5)</th>							        
			      </tr>
					<%
					
					for (int k = 0; k <20; k++) {
					%>



					<tr role="row">
					<% String champName = "champ"+ (k+1);
					   String scoreName ="score" + (k+1);
					
					
					%>
				        <td role="cell">facteur x</td> 
				        <td role="cell"> <textarea name="<%=champName %>" rows="2" cols="25" style="resize: vertical;" required></textarea></td>
				        <td role="cell">chi haja 1</td><td role="cell">chi haja 5</td>
						<td role="cell"> <textarea name="<%=scoreName %>" rows="1" cols="1"  required></textarea></td>
				        
				        
				     </tr>
				
					
					<%
					}
					
					
					%>
		  </table>
					
				
			</div>
		</div>
		
					

					
				
         <br> 
         
         
			        <br>
			        <div class="w3-center">
                	<button type="submit" class="w3-button  w3-green "><i class="fa fa-check fa-fw w3-margin-right"></i>Valider</button> 
                 	
                	<button type="reset" class="w3-button  w3-red "><i class="fa fa-remove fa-fw w3-margin-right"></i>Annuler</button> <br />
            		</div>
            				
      </div>
      
      </div>
   </form>	
    </div>
      
    <!-- End Middle Column -->
    
    
    
    <!-- Left Column -->
    <div class="w3-col m2">
    	
      <!-- Logo -->
      <div class="w3-card w3-round w3-white w3-center">
      <br>
        <div class="w3-container">
          <img src="img/logo-cmr.png" alt="Forest" style="width:100%;">
        </div>
        <br>
      </div>
      <br>
       <!-- Time  -->
	  <div class="w3-card w3-round w3-white w3-center">
	        <div class="w3-container">
	          <p>Date Aujourdhuit</p>
	          <br>                    
	        </div>
	  </div>
    <!-- End Left Column --> 
    </div>
      <br>
      
      
    </div>
  <!-- End Grid -->
  </div> 
<!-- End Page Container -->


<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-15">
  <h5>Footer</h5>
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>
 


</body>
</html> 
