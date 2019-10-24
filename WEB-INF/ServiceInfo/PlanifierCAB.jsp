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
<title>Plannifier CAB</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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
	System.out.println(utilisateur.getNom());

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
         <%} %>   <hr>
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
	  <div class="dropdown">
		  <button class="dropbtn w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa fa-caret-down fa-fw w3-margin-right"></i>CAB</button>              
		  <div class="dropdown-content">
		    		<form action="ServiceInfoServlet" method="post">
						<input type="hidden" name="action" value="plannifier" />
						<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa  w3-margin-right" ></i>Plannifier un CAB  </button>              
					</form>
					<form action="ServiceInfoServlet" method="post">
						<input type="hidden" name="action" value="consCAB" />
						<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa  w3-margin-right" ></i>Consulter un CAB</button>              
					</form>
					<form action="ServiceInfoServlet" method="CptRendu">
						<input type="hidden" name="action" value="acceuil" />
						<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa  w3-margin-right" ></i>Effectuer un Compte Rendu</button>              
					</form>
		  </div>
		</div>
		<form action="ServiceInfoServlet" method="post">
				<input type="hidden" name="action" value="validerDoc" />
				<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa fa-users fa-fw w3-margin-right"></i>Valider Documents</button>              
		</form>                
          <a href="Connection.jsp"  style="text-decoration: none;"><button class="w3-button w3-block w3-theme-d3 w3-left-align"><i class="fa fa-sign-out fa-fw w3-margin-right"></i>Logout</button></a>
        
        	
			
  
        </div>         
      </div>
      <br>
      
   
    
    <!-- End Left Column -->
    </div>



    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
       <!-- DashBoard  -->
      <div class="w3-row-padding" >
      <div class="container w3-card w3-white w3-round  " style=" min-height: 250px;"><br>
        <h4 class="w3-center">Plannifier un CAB</h4><br>
        <hr class="w3-clear">
        
        
        
 
		
        	
        	<form action="ServiceInfoCAB" method="post">
			<input type="hidden" name="action" value="plannifier">
			
			<div class="row">
					<div class="col-md-12"><h5 class="w3-left">Details du CAB : </h5></div>
				
			</div>
			<br>
        	<div class="row">
        		<div class="col-md-6">
        			 <label for="ex3">Lieu</label>
       				 <input class="form-control"  type="text" name="lieu">
        		</div>
        	
        	</div>
        	<div class="row">
        			<div class="col-md-6">
        			<label for="ex3">Date</label>
       				<input class="form-control"  type="date" name="mydate" required>
        		</div>
        		<div class="col-md-6">
        			<label for="ex3"> Heure </label>
       				<input class="form-control"  type="time" name="heure" required>
        		</div>
        	</div>

        
       
        <br> 	
        
        
         <%
        	ResultSet resultSet = null;				
			List<Demande> Mesdemandes = new ArrayList<Demande>();
			Mesdemandes = DataBaseMethodes.DemandesAvecMatriceRemplie();
        	if(Mesdemandes.size() > 0){  %>
        		<div class="row">
					<div class="col-md-12"><h5 class="w3-left">Choisir les demandes a discuter :</h5></div>
				
			</div>
			<br>

				<table class="table"  >
				<thead>
				 <tr>
			      <th role="columnheader"></th>
			        <th role="columnheader">Id</th>
			        <th role="columnheader">Type de Demande</th>
			        <th role="columnheader">Etat</th>
			       
			      </tr>
				</thead>
				<tbody>
					<%
					
					for (int i = 0; i < Mesdemandes.size(); i++) {
					%>
					
					<input type="hidden" name="id-demande" value="<%=Mesdemandes.get(i).getId() %>" />	

					<tr role="row">
					    <td role="cell"><input type="checkbox" name="checkedRows" value="<%=Mesdemandes.get(i).getId() %>"></td> 
				        <td role="cell"><%=Mesdemandes.get(i).getId() %></td> 
				        <td role="cell"><%=Mesdemandes.get(i).getType() %></td>
				        <td role="cell"><%=Mesdemandes.get(i).getEtat() %></td>
				        
				     </tr>
				
					
					
					<% }%>
				
				</tbody>					
		  </table>
		
		 
		  
				
				
	
		<%
					}else{
					
					%>
					<br><br><h5 style="color:red;" class="w3-center">Vous n'avez pas de nouvelles demandes seul les anciennes demandes vont etre discutée dans ce CAB</h5><br><br><br><br><br><br>
					
					
					
					<br><br><br>
					<%
					}
					
					%>

		
					
				
         <br> 
         
         
         
         
         
        <h5 class="w3-left">Ajouter Invités : </h5>
        <br>  
        <br>
        
          	<div class="row">
          		 <div class="col-md-4"> <input type="text" id="matric" placeholder="Matricule" /></div>
          		<div class="col-md-4"> <button class="btn  btn-primary "id="somebutton">Inviter</button></div>
       			 <div class="col-md-4" id="somediv"></div>
          	
          		</div>
          		  <br>
          		
          		 <div class="row">
   
          		   <div class="col-md-12 text-center" >	 <button type="submit" class="btn  btn-success ">Valider</button></div>
  
          		
          		</div> 
          		
          		 <br>
          		  </form>
          	</div>
   			
        <br>
        
        <br>


					
				
         <br> 
      </div>
         <br> 
      </div>
         <br> 
     
      
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
 
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script> 
            $(document).on("click", "#somebutton", function() {// When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
				var matricule = $('#matric').val();;
            	
            	$.get("AjaxFunctions?action=inviter&m="+matricule, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                    $("#somediv").html(responseText);           // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
                   
            	});
            });
            $(document).ready(function() {
				
            	
            	$.get("AjaxFunctions?action=clear", function(responseText) {   
            		$("#somediv").html(responseText);         
            		});
            });
        </script>
</html> 

