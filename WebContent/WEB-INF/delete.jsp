<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.beans.*" %>
<%@ page import="java.util.*" %>    
<%
	int nbrPage = (int)request.getAttribute("nbrPage");
	List<Hotel> listeHotel = (List<Hotel>)request.getAttribute("listeHotel");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<link href="./res/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="./res/jquery-3.4.1.slim.min.js" ></script>
<script src="./res/jquery-2.1.1.min.js" ></script>

<script src="./res/bootstrap.bundle.min.js" ></script>
<script>
$(document).ready(function(){
    $('#select_all').on('click',function(){
        if(this.checked){
            $('.checkbox').each(function(){
                this.checked = true;
            });
        }else{
             $('.checkbox').each(function(){
                this.checked = false;
            });
        }
    });
    
    $('.checkbox').on('click',function(){
        if($('.checkbox:checked').length == $('.checkbox').length){
            $('#select_all').prop('checked',true);
        }else{
            $('#select_all').prop('checked',false);
        }
    });
});
</script>
</head>
<body>
	<%@ include file="headerbackoffice.jsp" %>
	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h1 class="display-4">Supprimer un  hotel.</h1>
	    <p class="lead">Cette page est dedie pour la suppresion d'hotel.</p>
	  </div>
	</div>
	<form action="Delete" method="post" >
	<h5 style="margin-left:10px"><input type="checkbox" class="check" id="select_all">  Tout selectionner
	<input type="submit" value="Tout supprimer"  class="btn btn-danger"/>
	</h5> 
	<%for( int i = 0 ; i < listeHotel.size() ; i++) { %>
	<%  String [] image;
		image = listeHotel.get(i).getImage().split("/");	
		String j = "1";
	%>
	<br>
	<div class="card mb-3" style="max-width: 1540px;">
	  <div class="row no-gutters">
	    <div class="col-md-4">
	      <img src="<%=getServletContext().getContextPath() %>/imagefinale/<%out.println(listeHotel.get(i).getNom_hotel()); %>/<% out.println(image[0]); %>" class="card-img" alt="image">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title"> <% out.println(String.valueOf(i+1)); %> <input type="checkbox" class="checkbox" name="${i+1}" value="<% out.print(listeHotel.get(i).getId_hotel());%>">  <% out.println(listeHotel.get(i).getNom_hotel()); %></h5>
	        <p class="card-text">Adresse  Email: <%out.println(listeHotel.get(i).getEmail()); %>.</p>
	       	<p class="card-text">Telephone : 0<%out.println(listeHotel.get(i).getTelephone()); %>.</p>
	        <p class="card-text">Adresse : <% out.println(listeHotel.get(i).getAdresse()); %>.</p>
	       	<p class="card-text">Prix sejours : <% out.println(listeHotel.get(i).getPrix_sejour()); %>.</p>
	        <p class="card-text">A propos : <%out.println(listeHotel.get(i).getDescription()); %>.</p>
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	        <p class="card-text">
	        
	         	<a  class="btn btn-danger" href="Delete?id1=<% out.println(listeHotel.get(i).getId_hotel());%>&pageNumber=1">Supprimer</a>
	        </p>
	        
	        
	      </div>
	    </div>
	  </div>
	</div>
	<% } %>
	</form>
    <nav aria-label="...">
	  <ul class="pagination pagination-lg justify-content-center">
	  <% for (int i = 0 ; i != nbrPage ; i++) { %>
	    <li class="page-item"><a class="page-link" href="Delete?pageNumber=<% out.println(i+1); %>"><% out.println(i+1); %></a></li>
	    <%} %>
	  </ul>
	</nav>
	<br><br><br> 
	<%@ include file="FooterBack.jsp" %>
	
	</body>
</html>