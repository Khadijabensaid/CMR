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
<%@page import="java.util.Date"%>  
        
    
    
<!DOCTYPE html>
<html>
<title>Consulter CAB</title>
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



    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
       <!-- DashBoard  -->
      <div class="w3-row-padding" >
      <div class="container w3-card w3-white w3-round  " style=" min-height: 250px;"><br>
        <h4 class="w3-center">Tableau de bord des CABs</h4><br>

        
        
        
 		 	
		<div class="p-3 mb-2 bg-success  text-white text-center"> CABs A venir</div>
         <%
        	ResultSet resultSet = null;				
			List<CAB> CABs = new ArrayList<CAB>();
			CABs = DataBaseMethodes.ToutLesCABs();
        	if(CABs.size() > 0){  %>
        	
        	

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
					
					for (int i = 0; i < CABs.size(); i++) {
						Date today = new Date() ;
						if(CABs.get(i).getDate().after(today)){
					%>
					
				
					<tr role="row">				
				        <td role="cell"><%=CABs.get(i).getId() %></td> 
				        <td role="cell"><%=CABs.get(i).getLieu() %></td>
				        <td role="cell"><%=CABs.get(i).getDate() %></td>
				        <td role="cell"><%=CABs.get(i).getTime() %></td>
				        <td role="cell"><td role="cell">
				        	<form action="ServiceInfoServlet" method="post"	>	
				        			<input type="hidden" name="action" value="details" />					
				        			<input type="hidden" name="cab-id" value="<%=CABs.get(i).getId() %>" />	
				        			<button type="submit" class="w3-button  w3-blue ">Details</button> 
				        	
				        	</form>
				        </td>

				     </tr>
				
					
					
					<%} }%>
				
				</tbody>					
		  </table>	
	
		<%
					}
					
					%>

	
         <br> 
		
        	
        	  
 		 	
		<div class="p-3 mb-2 bg-danger   text-white text-center">Compte Rendu A Remplir</div>
         <%
        	if(CABs.size() > 0){  %>
        	
        	

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
					
					for (int i = 0; i < CABs.size(); i++) {
						Date today = new Date() ; 
						if(CABs.get(i).getDate().before(today)  && CABs.get(i).getCpteRendu() ==null){
					%>
					
				
					<tr role="row">				
				        <td role="cell"><%=CABs.get(i).getId() %></td> 
				        <td role="cell"><%=CABs.get(i).getLieu() %></td>
				        <td role="cell"><%=CABs.get(i).getDate() %></td>
				        <td role="cell"><%=CABs.get(i).getTime() %></td>
				        <td role="cell"><td role="cell">
				        	<form action="ServiceInfoServlet" method="post"	>	
				        			<input type="hidden" name="action" value="details" />					
				        			<input type="hidden" name="cab-id" value="<%=CABs.get(i).getId() %>" />	
				        			<button type="submit" class="w3-button  w3-blue ">Details</button> 
				        	
				        	</form>
				        </td>
				        <td role="cell">
				         
				         	<form action="ServiceInfoServlet" method="post"	>	
				        			<input type="hidden" name="action" value="CptRendu" />					
				        			<input type="hidden" name="cab-id" value="<%=CABs.get(i).getId() %>" />	
				        			<button type="submit" class="w3-button  w3-blue ">Remplir Compte Rendu</button> 
				        	
				        	</form>
						 </td>

				     </tr>
				
					
					
					<%} }%>
				
				</tbody>					
		  </table>	
	
		<%
					}
					
					%>

	
         <br> 
		
        <br> 
        	
		<div class="p-3 mb-2 bg-dark text-white text-center">Ancien CABs</div>
         <%		

        	if(CABs.size() > 0){  %>
        	
        	

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
					
					for (int i = 0; i < CABs.size(); i++) {
						Date today = new Date() ; 
						if(CABs.get(i).getDate().before(today) && CABs.get(i).getCpteRendu()!=null){
					%>
					
				
					<tr role="row">				
				        <td role="cell"><%=CABs.get(i).getId() %></td> 
				        <td role="cell"><%=CABs.get(i).getLieu() %></td>
				        <td role="cell"><%=CABs.get(i).getDate() %></td>
				        <td role="cell"><%=CABs.get(i).getTime() %></td>
				        <td role="cell"><td role="cell">
				        	<form action="ServiceInfoServlet" method="post"	>	
				        			<input type="hidden" name="action" value="details" />					
				        			<input type="hidden" name="cab-id" value="<%=CABs.get(i).getId() %>" />	
				        			<button type="submit" class="w3-button  w3-blue ">Details</button> 
				        	
				        	</form>
				        </td>
				         <td role="cell"><td role="cell">
				         
				         	<form action="ServiceInfoServlet" method="post"	>	
				        			<input type="hidden" name="action" value="ConsCptRendu" />					
				        			<input type="hidden" name="cab-id" value="<%=CABs.get(i).getId() %>" />	
				        			<button type="submit" class="w3-button  w3-blue ">Consulter Compte Rendu</button> 
				        	
				        	</form>
						 </td>
				     </tr>
				
					
					
					<%} }%>
				
				</tbody>					
		  </table>	
	
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

