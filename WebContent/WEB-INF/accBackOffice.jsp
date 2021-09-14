<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import = "com.beans.*" %>
<%@ page import="java.util.*" %>
 
 
 <% 
  List<Hotel> listeHotel = (List<Hotel>)request.getAttribute("listeHotel");
  
 %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	Utilisateur user = (Utilisateur)session.getAttribute("user");
 	int nbrPage = (int)request.getAttribute("nbrPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Back Office</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<link href="res/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="res/jquery-3.4.1.slim.min.js" ></script>
<script src="res/bootstrap.bundle.min.js" ></script>

</head>

<body>
	<%@ include file="headerbackoffice.jsp" %>
	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h1 class="display-4">Bonjour Mr(s) <%out.println(user.getNom()); %>!!!!</h1>
	    <p class="lead">Bienvenue dans le Back Office !!!</p>
	  </div>
	</div>

	
	<%for( int i = 0 ; i < listeHotel.size() ; i++) { %>
	<%  String [] image;
		image = listeHotel.get(i).getImage().split("/");	
	%>
	<br>
	<div class="card mb-3" style="max-width: 1540px;">
	  <div class="row no-gutters">
	    <div class="col-md-4">
	      <img src="<%=getServletContext().getContextPath() %>/imagefinale/<%out.println(listeHotel.get(i).getNom_hotel()); %>/<% out.println(image[0]); %>" class="card-img" alt="image">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title"><% out.println(listeHotel.get(i).getNom_hotel()); %></h5>
	        <p class="card-text">Adresse  Email: <%out.println(listeHotel.get(i).getEmail()); %>.</p>
	       	<p class="card-text">Telephone : 0<%out.println(listeHotel.get(i).getTelephone()); %>.</p>
	        <p class="card-text">Adresse : <% out.println(listeHotel.get(i).getAdresse()); %>.</p>
	       	<p class="card-text">Prix sejours : <% out.println(listeHotel.get(i).getPrix_sejour()); %>.</p>
	        <p class="card-text">A propos : <%out.println(listeHotel.get(i).getDescription()); %>.</p>
	       	
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	        <p class="card-text">
	        
	        	<a  class="btn btn-success" href="Update?id=<% out.println(listeHotel.get(i).getId_hotel());%>">Mettre a jour</a>
	         	<a  class="btn btn-danger" href="Delete?id=<% out.println(listeHotel.get(i).getId_hotel());%>">Supprimer</a>
	        </p>
	        
	        
	      </div>
	    </div>
	  </div>
	</div>
	<% } %>
	<nav aria-label="...">
	  <ul class="pagination pagination-lg justify-content-center">
	  <% for (int i = 0 ; i != nbrPage ; i++) { %>
	    <li class="page-item"><a class="page-link" href="AcceuilBackOffice?pageNumber=<% out.println(i+1); %>"><% out.println(i+1); %></a></li>
	    <%} %>
	  </ul>
	</nav>
		<br><br><br>
		
		<%@ include file="FooterBack.jsp"%>
	
</body>

</html>