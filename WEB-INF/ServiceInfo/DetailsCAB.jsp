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
<title>Details du CAB</title>
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


<%

	CAB cab = DataBaseMethodes.GetCabWithId((String) request.getParameter( "cab-id" ));

%>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
       <!-- DashBoard  -->
      <div class="w3-row-padding" >
      <div class="container w3-card w3-white w3-round  " style=" min-height: 250px;"><br>
        <h4 class="w3-center">Details du CAB</h4><br>
		   <h1 class="w3-center">CAB N° <%=cab.getId() %></h1><br>
        <br>
        
        
        
         <h3 class="w3-center">Informations de CAB</h3><br>
        <div class="row">
        <div class="col-md-3">
        Lieu :
        </div>
         <div class="col-md-3">
         <%=cab.getLieu() %>
        </div>
        <div class="col-md-3">
        Date :
        </div>
         <div class="col-md-3">
         <%=cab.getDate() %>  
        </div>
        
        </div>
        
        
        
       
        
 
		
        	
        	
        <br> 	

         <%
        			
			List<Demande> nv_demandes = new ArrayList<Demande>();
        	 List<String> IdsDemandesDuCAB = cab.getNewDemandes();
         	for(int j=0;j<IdsDemandesDuCAB.size() ; j++){
         		
         		nv_demandes.add(DataBaseMethodes.GetDemandeWithId(IdsDemandesDuCAB.get(j)));
         		
         		
         	}
        	if(nv_demandes.size() > 0){  %>

			<br>

				<table class="table"  >
				<thead>
				 <tr>
		
			        <th role="columnheader">Id</th>
			        <th role="columnheader">lieu</th>
			        <th role="columnheader">Date</th>
			       <th role="columnheader">Heure</th>
			       	      <th role="columnheader"></th>
			       	      	      <th role="columnheader"></th>
			       
			      </tr>
				</thead>
				<tbody>
					<%
					
					for (int i = 0; i < nv_demandes.size(); i++) {
					%>
					
				
					<tr role="row">				
				        <td role="cell"><%=nv_demandes.get(i).getId() %></td> 
				        <td role="cell"></td>
				        <td role="cell"></td>
				        <td role="cell"></td>
				        <td role="cell"><td role="cell">
				        	<form action="ServiceInfoServlet" method="post"	>	
				        			<input type="hidden" name="action" value="details" />					
				        			<input type="hidden" name="cab-id" value="<%=nv_demandes.get(i).getId() %>" />	
				        			<button type="submit" class="w3-button  w3-blue ">Details</button> 
				        	
				        	</form>
				        </td>
				         <td role="cell"><td role="cell">
				         
				         	<form action="ServiceInfoServlet" method="post"	>	
				        			<input type="hidden" name="action" value="CptRendu" />					
				        			<input type="hidden" name="cab-id" value="<%=nv_demandes.get(i).getId() %>" />	
				        			<button type="submit" class="w3-button  w3-blue ">Compte Rendu</button> 
				        	
				        	</form>
						 </td>
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
 
	 <br>
          	
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

</html> 

