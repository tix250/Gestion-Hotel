<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.beans.Province" %>
<%@ page import="java.util.*" %>
 
 
 <% 
  List<Province> province = (List<Province>)request.getAttribute("province");
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create</title>
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
	    <h1 class="display-4">Inserer un nouveau hotel.</h1>
	    <p class="lead">Cette page est dedie pour l'insertion de nouveau hotel.</p>
	  </div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<form action="AcceuilBackOffice" method="post" enctype="multipart/form-data">
				  <div class="form-group">
				    <label for="nom">Nom hotel</label>
				    <input type="text" class="form-control" id="nom" placeholder="Nom hotel" name="nom_hotel" required>
				  </div>
				  <div class="form-row">
				    <div class="form-group col-md-6">
				      <label for="inputEmail4">Email</label>
				      <input type="email" class="form-control" name="email" id="inputEmail4 required">
				    </div>
				    <div class="form-group col-md-6">
				      <label for="number">Telephone</label>
				      <input type="number" class="form-control" id="number" name="telephone" required>
				    </div>
				  </div>

				  <div class="form-group">
				    <label for="Description">Description de l'hotel</label>
				    <input type="text" class="form-control" id="Description" placeholder="Description holel" name="description"required>
				  </div>
				  <div class="form-group">
				    <label for="sejour">Prix Sejour</label>
				    <input type="number" class="form-control" id="sejour" placeholder="Prix Sejour" name="prix_sejour" required>
				  </div>
				  <div class="form-row">
				    <div class="form-group col-md-6">
				      <label for="inputCity">Adresse de l'hotel</label>
				      <input type="text" class="form-control" id="inputCity" name="adresse" required>
				    </div>
				    <div class="form-group col-md-6">
				      <label for="inputState">Province</label>
				      <select id="inputState" class="form-control" name="province" >
				      	<%for(int i = 0 ; i<province.size() ; i++) { %>
				        <option value=<%out.println(province.get(i).getId_province());%> > <% out.println(province.get(i).getNom_province()); %></option>
						<%} %>
				      </select>
				    </div>
				   
				  </div>
				  <div class="form-group">
				    <label for="exampleFormControlFile1">Image de l'hotel</label>
				    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="image" multiple required>
				  </div>
				  
				  <input type="submit" class="btn btn-dark" name="creer" value="Creer">
				</form>
			</div>				
		</div>
	</div>
	<br><br><br><br>
	<%@ include file="FooterBack.jsp" %>
	
</body>
</html>