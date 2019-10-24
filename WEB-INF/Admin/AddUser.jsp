
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Beans.*" import="Servlets.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ajouter Utilisateur</title>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/forms.css">


</head>
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
<%
 User utilisateur = (User) request.getSession().getAttribute("user");
	System.out.println(utilisateur.getNom());

%>
<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
  
  
  
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">Nom Prenom</h4>
         
    	<% String gender;
         gender =utilisateur.getSexe();
         if(gender.equals("homme") ){%> 
         <p class="w3-center"><img src="img/male.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
        <%}else {%>
         <p class="w3-center"><img src="img/female.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <%} %>         <hr>
         <p><i class="fa fa-id-card-o fa-fw w3-margin-right w3-text-theme"></i> Matricul</p>
         <p><i class="fa fa-suitcase fa-fw w3-margin-right w3-text-theme"></i> Poste</p>
        </div>
      </div>
      <br>
      
          <!-- Fonctionalittées -->
      <div class="w3-card w3-round">
        <div class="w3-white">
        
        <form action="AdminServlet" method="post">
				<input type="hidden" name="action" value="acceuil" />
				<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>Overview</button>              
			</form>
	   <form action="AdminServlet" method="post">
				<input type="hidden" name="action" value="add" />
				<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa fa-plus fa-fw w3-margin-right"></i>Ajouter Utilisateur</button>              
		</form>
			   <form action="AdminServlet" method="post">
				<input type="hidden" name="action" value="Search" />
				<button class="w3-button w3-block w3-theme-l1 w3-left-align" type="submit" ><i class="fa fa-users fa-fw w3-margin-right"></i>Chercher Un Compte</button>              
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
        <h1 class="w3-center">Ajouter un Utilisateur</h1><br>
        <hr class="w3-clear">
          
               
          <br>
          <div class="container">
			 
			  <form method="post" action="AdminActions">
			  <input type="hidden" name="ToDo" value="insert" />
			    <div class="row">
			      <h4>Informations de Compte</h4>
			      <div class="input-group input-group-icon">
			        <input type="text" name="mat" placeholder="Matricule" required/>
			        <div class="input-icon"><i class="fa fa-id-card-o"></i></div>
			      </div>
			   
			      <div class="input-group input-group-icon">
			        <input type="password" name="mdp" placeholder="Mot de Passe" required/>
			        <div class="input-icon"><i class="fa fa-key"></i></div>
			      </div>
			    </div>
			   
			    <div class="row">
			      <h4>Informations Personnelles </h4>
			      
			      <div class="input-group ">
			       	<input type="text" name="nom" placeholder="Nom" required/>
			      </div>
			      <div class="input-group ">
			       	<input type="text" name="prenom" placeholder="Prenom" required/>
			      </div>
			      
			      <div class="input-group">
			        <input type="radio" name="genre" value="male" id="genre" checked="true"/>
			        <label for="genre"><span><i class="fa fa-male"></i>Male</span></label>
			        
			        <input type="radio" name="genre" value="female" id="genre"/>
			        <label for="genre"> <span><i class="fa fa-female"></i>Femele</span></label>
			      </div>
			      
			     </div>
			       <div class="row w3-center" >
			   		<div class="w3-center">
			   			<div class="w3-center">
				          <select id="type-compte" name="type" classe="w3-center">
						    <option value="">   -- Type de Compte --</option>
						    <option value="admin">Admin</option>
						    <option value="demandeur">Demandeur</option>
						    <option value="SI">Service Informatique</option>
						    <option value="dev">Developpeur</option>
						    <option value="dep">Agent de Deploiment</option>
						    
						</select>  
				        </div>
			   		
			   		</div>
			        
			      
			    </div>
			    <br>
			    <div class="row">
			      
			      <div class="input-group">
			        <input type="checkbox" id="terms" checked/>
			        <label for="terms">Activer le Compte</label>
			      </div>
			    </div>
			    <div class="w3-center">
                	<button type="submit" class="w3-button  w3-green "><i class="fa fa-check fa-fw w3-margin-right"></i>Valider</button> 
                 	
                	<button type="reset" class="w3-button  w3-red "><i class="fa fa-remove fa-fw w3-margin-right"></i>Annuler</button> <br />
            	</div>
			  </form>
			  
        </div>
       
       
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
<footer class="w3-container w3-theme-d3 w3-padding-15">
  <h5>Footer</h5>
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>
 





</body>
</html>