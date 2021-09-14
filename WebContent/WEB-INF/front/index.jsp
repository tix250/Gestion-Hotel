<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.beans.*" %>
<%@ page import="java.util.*" %>
 
 
 <% 
  List<Hotel> listeHotel = (List<Hotel>)request.getAttribute("listeHotel");  
  List<Province> province = (List<Province>)request.getAttribute("province");

 %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado - Furniture E-commerce Template | Home</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="res_front/css/core-style.css">

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
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!-- Header Area Start -->
        	<%@ include file="header.jsp" %>
        <!-- Header Area End -->

        <!-- Product Catagories Area Start -->
        <div class="products-catagories-area clearfix">
            <div class="amado-pro-catagory clearfix">
				
			<%for( int i = 0 ; i < listeHotel.size() ; i++) { %>
				<%  String [] image;
				image = listeHotel.get(i).getImage().split("/");	
				%>
                <!-- Single Catagory -->
                <div class="single-products-catagory clearfix">
                    <a href="Details?id=<% out.println(listeHotel.get(i).getId_hotel());%>">
                        <img src="<%=getServletContext().getContextPath() %>/imagefinale/<%out.println(listeHotel.get(i).getNom_hotel()); %>/<% out.println(image[0]); %>" alt="" style="width:700px">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p><% out.println(listeHotel.get(i).getPrix_sejour()); %> AR pour une journee </p>
                            <h4><% out.println(listeHotel.get(i).getNom_hotel()); %></h4>
                        </div>
                    </a>
                </div>
	
			<%} %>
               
            </div>
        </div>
        <!-- Product Catagories Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Newsletter Area Start ##### -->

    <!-- ##### Newsletter Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <%@ include file="footer.jsp" %>
    
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="res_front/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="res_front/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="res_front/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="res_front/js/plugins.js"></script>
    <!-- Active js -->
    <script src="res_front/js/active.js"></script>

</body>
</html>