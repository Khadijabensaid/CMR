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
<title>Acceuil</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
h5 {
  color: #7ed321;
}
</style>
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large  w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>CMR</a>

 
  </div>

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
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
        <br>
         <h4 class="w3-center"><%=utilisateur.getNom() %> <%=utilisateur.getPrenom() %></h4>
       <% String gender;

       
         gender =utilisateur.getSexe();
         if(gender.equals("homme") ){%> 
         <p class="w3-center"><img src="img/male.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
        <%}else {%>
        
        
        
        
         <p class="w3-center"><img src="img/female.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <%} %>  
         <hr>
         <p><i class="fa fa-id-card-o fa-fw w3-margin-right w3-text-theme"></i> <%=utilisateur.getMat() %></p>
         <p><i class="fa fa-suitcase fa-fw w3-margin-right w3-text-theme"></i>  <%=utilisateur.getPosteToDisplay() %></p>
        </div>
      </div>
      <br>
      <!-- Fonctionalittées -->
  
   
    <div class="w3-card w3-round">
        <div class="w3-white">
        
        <form action="DemandeurServlet" method="post">
				<input type="hidden" name="action" value="acceuil" />
				<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>Consulter mes Demandes</button>              
			</form>
	   <form action="DemandeurServlet" method="post">
				<input type="hidden" name="action" value="new" />
				<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa fa-plus fa-fw w3-margin-right"></i>Nouvelle Demandes</button>              
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
      <div class="w3-container w3-card w3-white w3-round  " style=" min-height: 250px;"><br>
        <h4 class="w3-center">Tableau de Bord</h4><br>
        <hr class="w3-clear">
        
        
        
        
        <%
        	ResultSet resultSet = null;				
			List<Demande> Mesdemandes = new ArrayList<Demande>();
			Mesdemandes = DataBaseMethodes.MesDemandes(utilisateur.getMat());
        	if(Mesdemandes.size() > 0){  %>
		
       <div class="p-3 mb-2 bg-info text-white text-center">Mes Demandes : </div>
        <br> 	
        <div class="container-table100" >
			<div role="region" aria-labelledby="Cap1" tabindex="0" >
				<table class="table"  >
				<thead>
			      <tr role="row">
			        <th role="columnheader">Id</th>
			        <th role="columnheader">Type de Demande</th>
			        <th role="columnheader">Etat</th>
			        <th role="columnheader">Action</th>
			      </tr>
			      </thead>
			      <tbody>
					<%
					
					for (int i = 0; i < Mesdemandes.size(); i++) {
					%>
					<form action="DemandeurServlet" method="post">	
      				<input type="hidden" name="action" value="consult" />	
					<input type="hidden" name="id-demande" value="<%=Mesdemandes.get(i).getId() %>" />	

					<tr role="row">
				        <td role="cell"><%=Mesdemandes.get(i).getId() %></td> 
				        <td role="cell"><%=Mesdemandes.get(i).getType() %></td>
				        <td role="cell"><%=Mesdemandes.get(i).getEtat() %></td>
				        <td role="cell"><button type="submit" class="w3-button  w3-blue ">Consulter</button> </td>
				     </tr>
					</form>	
					<%
					}
					
					
					%>
					</tbody>
		    </table>
					
	
			</div>
		</div>
		<%
					}else{
					
					%>
					<br><br><h5 style="color:red;" class="w3-center">Vous n'avez pas de demandes a afficher</h5><br><br>
					
					
					
					<br><br><br>
					<%
					}
					
					%>
		 
       <% ResultSet rs2 = null;			
       List<Demande> Autresdemandes = new ArrayList<Demande>();
       Autresdemandes = DataBaseMethodes.DemandesAValider(utilisateur.getMat(),utilisateur.getRole());
       
       if((Autresdemandes.size() >0 && Mesdemandes.size()>0 ) || (Autresdemandes.size() ==0 && Mesdemandes.size()==0 ) ){
       %>
       <hr class="w3-clear">
       <%
       }
		if(Autresdemandes.size() > 0){  %>
		<br> <br>
          <div class="p-3 mb-2 bg-info text-white text-center"> Demandes A Valider : </div>
		<br> 
		
        <div class="container-table100">
			 <div role="region" aria-labelledby="Cap1" tabindex="0">
				<table id="AutresDemandes" role="table">
			      <tr role="row">
			        <th role="columnheader">Id</th>
			        <th role="columnheader">Demandeur</th>
			        <th role="columnheader">Type de Demande</th>
			        <th role="columnheader">Etat</th>
			        <th role="columnheader">Action</th>
			      </tr>
					<%
					
					
					for (int i = 0; i < Autresdemandes.size(); i++) {
						
					%>	
					<form action="DemandeurServlet" method="post">	
					      				<input type="hidden" name="action" value="consult" />	
					<input type="hidden" name="id-demande" value="<%=Autresdemandes.get(i).getId() %>" />
					<tr role="row">
				        <td role="cell"><%=Autresdemandes.get(i).getId() %></td>
				        <td role="cell"><%= Autresdemandes.get(i).getId_demandeur() %></td>
				        <td role="cell"><%=Autresdemandes.get(i).getType() %></td>
				        <td role="cell"><%=Autresdemandes.get(i).getEtat() %></td>
				        <td role="cell"><button type="submit" class="w3-button  w3-blue ">Consulter</button> </td>
				     </tr>


						
											
						</form>	
					
					
					<%} %>
				    </table>	
					
      

			</div>
		</div>
					<%
					}else{
						if(!utilisateur.getRole().equals("2") ){
						
						%>
						<br><br><h5 style="color:red;" class="w3-center">Vous n'avez pas de demandes a Valider</h5><br><br><br><br><br>
						
						
						
						<br>
						<%
						}}
						
						%>
		
					
				
         <br> 
      </div>
      </div>
     
      
   
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
<footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>Footer</h5>
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>


</body>
</html> 
