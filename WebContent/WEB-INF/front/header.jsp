       
       <%@ page import = "com.beans.*" %>
	   <%@ page import="java.util.*" %>
       <%  List<Province> provinces = (List<Province>)request.getAttribute("province");%>
       
       <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="index.html"><img src="././res_front/img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="Index">Acceuil</a></li>
                    <li><a href="Shop">Hotel</a></li>
                    <li><a href="Details?id=2">Details par hotel</a></li>
                </ul>
            </nav>
            
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
                
                <a href="#" class="search-nav"><img src="././res_front/img/core-img/search.png" alt=""> Recherche </a>
            </div>
            
            <div>
            	<h6> Recherche avancer </h6>
            	<div class="container">
		<div class="row">
			<div class="col-md-12 offset-md-12">
				<form action="Shop" method="post">
				  <div class="form-group">
				    <label for="nom">Nom hotel</label>
				    <input type="text" class="form-control" id="nom" placeholder="Nom hotel" name="mot_clef" required>
				  </div>
				 
				  <div class="form-group">
				    <label for="sejour">Prix Sejour Max</label>
				    <input type="number" class="form-control" id="sejour" placeholder="Prix Sejour" name="prix_sejour" required>
				  </div>
				  <div class="form-row">
				    
				    <div class="form-group col-md-12">
				      <label for="inputState">Province</label>
				      <select id="inputState" class="form-control" name="province" >
				      	<%for(int i = 0 ; i<provinces.size() ; i++) { %>
				        <option value=<%out.println(provinces.get(i).getId_province());%> > <% out.println(provinces.get(i).getNom_province()); %></option>
						<%} %>
				      </select>
				    </div>
				   
				  </div>
				  
				  
				  <input type="submit" class="btn btn-dark" name="rechercheAvancer" value="Rechercher">
				</form>
			</div>				
		</div>
	</div>
            </div>
            <br><br>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>