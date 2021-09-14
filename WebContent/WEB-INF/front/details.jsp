<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.beans.*" %>
<%@ page import="java.util.*" %>

 <% 
  Hotel listeHotel = (Hotel)request.getAttribute("listeHotel");  
  String [] image = listeHotel.getImage().split("/");		

 %>
   <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado - Furniture Ecommerce Template | Product Details</title>

    <!-- Favicon  -->
    <link rel="icon" href="././res_front/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="././res_front/css/core-style.css">

</head>

<body>
    <!-- Search Wrapper Area Start -->
	    <%@ include file="search.jsp" %>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="././res_front/img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!-- Header Area Start -->
            <%@ include file="header.jsp" %>
        
       
        <!-- Header Area End -->

        <!-- Product Details Area Start -->
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mt-50">
                                <li class="breadcrumb-item"><a href="Index">Acceuil</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><% out.println(listeHotel.getNom_hotel()); %></li>
                            </ol>
                        </nav>
                    </div>
                </div>
				
                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                	
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url('././imagefinale/<%out.print(listeHotel.getNom_hotel()); %>/<% out.print(image[0]); %>');">
                                    </li>
                                    <% int i = 0; %>
                                    <% for(String img : image) { if(i>0) { %>
                                    <li data-target="#product_details_slider" data-slide-to="<%out.print(i); %>" style="background-image: url('././imagefinale/<%out.print(listeHotel.getNom_hotel()); %>/<% out.print(img); %>');">
                                    </li>
                                    <% 
                                    }
                                    if(i == 3) {
                                    	break;
                                    }i++;}
                                    i=0;
                                    %>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="<%=getServletContext().getContextPath() %>/imagefinale/<%out.println(listeHotel.getNom_hotel()); %>/<% out.println(image[0]); %>">
                                            <img class="d-block w-100" src="<%=getServletContext().getContextPath() %>/imagefinale/<%out.println(listeHotel.getNom_hotel()); %>/<% out.println(image[0]); %>" alt="First slide">
                                        </a>
                                    </div>
                                   <% for(String img : image) {  %> 
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="<%=getServletContext().getContextPath() %>/imagefinale/<%out.println(listeHotel.getNom_hotel()); %>/<% out.println(img); %>">
                                            <img class="d-block w-100" src="<%=getServletContext().getContextPath() %>/imagefinale/<%out.println(listeHotel.getNom_hotel()); %>/<% out.println(img); %>" alt="Second slide">
                                        </a>
                                    </div>
                                    <% } %>
                                 
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">AR <% out.println(listeHotel.getPrix_sejour()); %></p>
                                <a href="#">
                                    <h6><% out.println(listeHotel.getNom_hotel()); %></h6>
                                </a>
                                <!-- Ratings & Review -->
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div>
                                    <div class="review">
                                        <a href="#">Write A Review</a>
                                    </div>
                                </div>
                                <!-- Avaiable -->
                            </div>

                            <div class="short_overview my-5">
								<p >Adresse  Email: <%out.println(listeHotel.getEmail()); %>.</p>
						       	<p >Telephone : 0<%out.println(listeHotel.getTelephone()); %>.</p>
						        <p >Adresse : <% out.println(listeHotel.getAdresse()); %>.</p>
						        <p >A propos : <%out.println(listeHotel.getDescription()); %>.</p>
                            </div>

                           

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Details Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Newsletter Area Start ##### -->

    <!-- ##### Newsletter Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
        <%@ include file="footer.jsp" %>
    
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="././res_front/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="././res_front/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="././res_front/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="././res_front/js/plugins.js"></script>
    <!-- Active js -->
    <script src="././res_front/js/active.js"></script>

</body>

</html>