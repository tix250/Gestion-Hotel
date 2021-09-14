<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.beans.Utilisateur" %>
<%@ page import="java.util.*" %>




<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Test</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="./login resoursce/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./login resoursce/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./login resoursce/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./login resoursce/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./login resoursce/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./login resoursce/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./login resoursce/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./login resoursce/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./login resoursce/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./login resoursce/css/util.css">
	<link rel="stylesheet" type="text/css" href="./login resoursce/css/main.css">
</head>
<body>

    
    <div>
    	<% if(request.getAttribute("validation") != null) { %>
    	<p> <%out.println((String) request.getAttribute("validation") ); %>  
    	<%} %>
    </div>
    
    
    	<div class="limiter">
		<div class="container-login100" style="background-image: url('./login resoursce/images/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Connexion Back Office
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5" method="post" action="Servlet" >

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text"  placeholder="Pseudo" name="login">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password"  placeholder="Mot de passe"  name="password">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>

					<div class="container-login100-form-btn m-t-32">
						<input type="submit" class="login100-form-btn">

					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	<!--===============================================================================================-->
	<script src="./login resoursce/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="./login resoursce/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="./login resoursce/vendor/bootstrap/js/popper.js"></script>
	<script src="./login resoursce/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="./login resoursce/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="./login resoursce/vendor/daterangepicker/moment.min.js"></script>
	<script src="./login resoursce/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="./login resoursce/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="./login resoursce/js/main.js"></script>
	
</body>
</html>