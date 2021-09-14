<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.beans.*" %>
<%@ page import="java.util.*" %>
 
 
 <% 
  List<Province> province = (List<Province>)request.getAttribute("province");
  List<Hotel> listeHotel = (List<Hotel>)request.getAttribute("listeHotel");
  int nbrPage = (int)request.getAttribute("nbrPage");


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
    <title>Amado - Furniture Ecommerce Template | Shop</title>

    <!-- Favicon  -->
    <link rel="icon" href="././res_front/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="././res_front/css/core-style.css">
    <link rel="stylesheet" href="././res_front/css/style.css">

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

        <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Province</h6>

                <!--  Catagories  -->
                <div class="catagories-menu">
                    <ul>
                    <%for(Province p : province) { %>
                        <li><a href="Shop?id_province=<% out.print(p.getId_province());%>"><%out.print(p.getNom_province()); %></a></li>
                    <% } %>
                    </ul>
                </div>
            </div>

            <!-- ##### Single Widget ##### -->
            
        </div>

        <div class="amado_product_area section-padding-100">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div class="product-topbar d-xl-flex align-items-end justify-content-between">
                            <!-- Total Products -->
                            <div class="total-products">
                                <p>Hotel :</p>
                                <div class="view d-flex">
                                    <a href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
                                </div>
                            </div>
                            <!-- Sorting -->
                         
                        </div>
                    </div>
                </div>

                <div class="row">

                    <!-- Single Product Area -->
                    <%for( int i = 0 ; i < listeHotel.size() ; i++) { %>
					<%  String [] image;
						image = listeHotel.get(i).getImage().split("/");	
					%>
				                    <div class="col-12 col-sm-6 col-md-12 col-xl-6">
                        <div class="single-product-wrapper">
                            <!-- Product Image -->
                            <div class="product-img">
                                <img src="<%=getServletContext().getContextPath() %>/imagefinale/<%out.println(listeHotel.get(i).getNom_hotel()); %>/<% out.println(image[0]); %>" alt="">
                                <!-- Hover Thumb -->
                            </div>

                            <!-- Product Description -->
                            <div class="product-description d-flex align-items-center justify-content-between">
                                <!-- Product Meta Data -->
                                <div class="product-meta-data">
                                    <div class="line"></div>
                                    <p class="product-price">AR <% out.println(listeHotel.get(i).getPrix_sejour()); %></p>
                                    <a href="Details?id=<% out.print(listeHotel.get(i).getId_hotel());%>">
                                        <h6><% out.println(listeHotel.get(i).getNom_hotel()); %></h6>
                                    </a>
                                </div>
                                <!-- Ratings & Cart -->
                                <div class="ratings-cart text-right">
                                    <div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div>
                                    <div class="cart">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    
				<% } %>
                  
                </div>

                <div class="row">
                    <div class="col-12">
                        <!-- Pagination -->
                        <nav aria-label="navigation">
                            <ul class="pagination pagination-lg justify-content-end mt-50">
                            <% for (int i = 0 ; i != nbrPage ; i++) { %>
                                <li class="page-item"><a class="page-link" href="Shop?pageNumber=<% out.print(i+1); %>"> <% out.print(i+1); %>. </a></li>
                            <% } %>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
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
