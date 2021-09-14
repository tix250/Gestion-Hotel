<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-dark bg-dark">
	  <a class="navbar-brand" href="#">BackOffice</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="AcceuilBackOffice?pageNumber=1">Acceuil<span class="sr-only">(current)</span></a>
	      </li>
	      
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          CRUD
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="AcceuilBackOffice?page=create">creer des donnes</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="Update">mettre a jour</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="Delete?pageNumber=1">Supprimer</a>
	          
	        </div>
	      </li>
	      
	    </ul>
	    <form class="form-inline my-2 my-lg-0" method="post" action="Recherche">
	      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="mot_clef" required>
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Rechercher</button>
	    </form>
	  </div>
	</nav>