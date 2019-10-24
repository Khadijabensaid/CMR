<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Beans.*" import="Servlets.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consulter Demande</title>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


</head>
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large  w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>CMR</a>

 
  </div>

 </div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
  

  	<%
	User utilisateur = (User) request.getSession().getAttribute("user");
  	%>
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
<%

	Demande demande =DataBaseMethodes.GetDemandeWithId((String) request.getParameter( "id-demande" ));
	User demandeur = DataBaseMethodes.GetUserWithMat(demande.getId_demandeur());

%>
    <!-- Middle Column -->
    <div class="w3-col m7">
    
       <!-- DashBoard  -->
      <div class="w3-row-padding" >
      <div class="w3-container w3-card w3-white w3-round  " style=" min-height: 250px;"><br>
        <div class="p-3 mb-2 bg-success  text-white text-center">Demande N° <%=demande.getId() %> </div>
        <hr class="w3-clear">
          
               
          <br>
          <div class="container">
			 
			  <form method="post" action="DemandeurActions">
			
			    <div class="row">		
				    <div class="col-md-12">
				    	<div class="p-3 mb-2 bg-secondary  text-white text-center">Informations du Demandeur :</div>   
				    </div> 			     			  
			    </div>
			    <br>
			    <div class="row">		
				    <div class="col-md-12">
				    	 <div class="w3-left text-primary "  >Nom et Prenom : </div> <div class="w3-center " > <%=demandeur.getNom() + " " +demandeur.getPrenom() %>      </div>   
				    </div> 			     			  
			    </div>
			     <br>
			    <div class="row">		
				    <div class="col-md-12">
				    	  <div class="w3-left text-primary"  >Matricul : </div> <div class="w3-center " > <%=demande.getId_demandeur() %></div>               
				    </div> 			     			  
			    </div>
			     <br>
			    <div class="row">		
				    <div class="col-md-12">
				    	 <div class="w3-left text-primary" >Poste : </div> <div class="w3-center " ><%=demandeur.getRole()%></div>              
				    </div> 			     			  
			    </div>
			    
	 <br>
			        
			        	    <div class="row">		
							    <div class="col-md-12">
							    	<div class="p-3 mb-2 bg-secondary  text-white text-center">Informations de la Demande :</div>   
							    </div> 			     			  
						    </div>
					<br>
					
					<div class="row">		
					    <div class="col-md-6">
						<div class="w3-left text-primary ">
			    	 		Type de Demande :</div><div class="w3-center " > <%=demande.getType() %></div>
			    	 	</div>					     
					    <div class="col-md-6">
						<div class="w3-left text-primary ">
			    	 		Prioritée :</div><div class="w3-center " ><%=demande.getPrioritee() %></div>
			    	 	</div>				     			  
			  		</div>

			     <br>
			     
			     
			      <div class="row">		
				    <div class="col-md-12">
				    	 <div class="w3-left text-primary" >Motif de Demande : </div>      
				    </div> 			     			  
			   	 </div>
			   	     
			   	  <div class="row">		
				    <div class="col-md-12">
				    	 <div class="w3-left " " ><%=demande.getMotif() %></div>      
				    </div> 			     			  
			   	 </div>
			    <br>
			    
			    	     
			      <div class="row">		
				    <div class="col-md-12">
				    	 <div class="w3-left text-primary "  >Domaine de Demande : </div>      
				    </div> 			     			  
			   	 </div>
			   	     
			   	  <div class="row">		
				    <div class="col-md-12">
				    	 <div class="w3-left " " > <%=demande.getDomaine() %></div>      
				    </div> 			     			  
			   	 </div>
			    <br>
			    
				  <div class="row">		
				    <div class="col-md-12">
				    	 <div class="w3-left text-primary "  >Description de Demande :</div>      
				    </div> 			     			  
			   	 </div>
			   	     
			   	  <div class="row">		
				    <div class="col-md-12">
				    	 <div class="w3-left " " ><%=demande.getDescription() %></div>      
				    </div> 			     			  
			   	 </div>
			    <br>
			    
		

			   
			    
			       
			    <br>
				 <%

		        	if((demande.getEtat().equals("1")||demande.getEtat().equals("2")) && !demande.getId_demandeur().equals(utilisateur.getMat())){  %>
			    <div class="row">
			    	  <form action="DemandeurActions" method="post">	
						<input type="hidden" name="ToDo" value="decide" />
						<input type="hidden" name="choice" value="valider" />
						<input type="hidden" name="id-demande" value="<%=demande.getId() %>" />
                			<button type="submit" class="w3-button  w3-green "><i class="fa fa-check fa-fw w3-margin-right"></i>Valider</button> 
                    	</form>
                    	<form action="DemandeurActions" method="post">	
								<input type="hidden" name="ToDo" value="decide" />
								<input type="hidden" name="choice" value="refuser" />
								<input type="hidden" name="id-demande" value="<%=demande.getId() %>" />
                				<button type="submit" class="w3-button  w3-red "><i class="fa fa-remove fa-fw w3-margin-right"></i>Refuser</button> <br />
                    	</form>
            	</div>
            	 <%
		        	}  %>

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