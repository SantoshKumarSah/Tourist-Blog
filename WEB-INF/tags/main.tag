<%@ attribute name="loginrequired" required="false" rtexprvalue="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty loginrequired and loginrequired==true}">
	<c:if test="${empty sessionScope['logid']}">
		<c:redirect url="login.jsp"/>
	</c:if>
</c:if>

<!DOCTYPE html>
<html>
<head>
<title>Tourist Blog</title>
<!--css-->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--/css-->
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->		
<!-- js -->
<script src="js/jquery.min.js"> </script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<!-- /js -->
<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Ubuntu:300,400,500,700,300italic,400italic,500italic,700italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400' rel='stylesheet' type='text/css'>
<!--/fonts-->
<!--script-->
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
				});
			});
</script>
<!--/script-->
</head>
<body>
<!--header-->
<div class="header">
<div class="header-nav">
	<div class="container">
		<div class="logo">
						<a href="index.jsp">
			<img src="images/logo1.png" alt="" /></a>
			
		</div>
		<div class="navigation">
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"> </span>
						<span class="icon-bar"> </span>
						<span class="icon-bar"> </span>
					  </button>
					</div>
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					  <ul class="nav navbar-nav">
						<li><a href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
						<li><a href="about.jsp">About</a></li>
						<li><a href="service.jsp">Diary</a></li>
						<li><a href="gallery.jsp">Gallery</a></li>
						
						<c:choose>
							<c:when test="${not empty sessionScope['logid']}">
								<li><a href="logout">Logout</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="login.jsp">Login</a></li>
							</c:otherwise>
						</c:choose>
						
						
						<li><a href="register.jsp">Sign up</a></li>
					  </ul>
			  <div class="clearfix"> </div>
			</div><!-- /.navbar-collapse -->
		</nav>
	</div>
	</div>
	</div>
</div>
			  <!-- script-for-menu -->
		 <script>
				$("span.menu").click(function(){
					$(".top-nav ul").slideToggle("slow" , function(){
					});
				});
		 </script>
		 <!-- script-for-menu -->
<div class="banner banner5">
</div>




<jsp:doBody></jsp:doBody>






</div>
</div>
<!--/inner-page-about-->
 <div class="footer">
			 <div class="container">				 	
				 <div class="col-md-3 ftr_navi ftr">
					 <h3>NAVIGATION</h3>
					 <ul>
						 <li><a href="index.jsp">Home</a></li>
						 <li><a href="about.jsp">About</a></li>
						<li><a href="service.jsp">service</a></li>
						<li><a href="gallery.jsp">Gallery</a></li>
						<li><a href="login.jsp">Login</a></li>
						<li><a href="register.jsp">Register</a></li>
						 
					 </ul>
				 </div>
				 <div class="col-md-3 ftr_navi ftr">
					 <h3>MEMBERS</h3>
					 <ul>
						 <li><a href="#">Customer Support</a></li>
						 <li><a href="#">Platinum Support</a></li>
						 <li><a href="#">Gold Support</a></li>						
						 <li><a href="#">Standard Support</a></li>
						 <li><a href="#">Training</a></li>
					 </ul>
				 </div>
				 <div class="col-md-3 get_in_touch ftr">
					  <h3>GET IN TOUCH</h3>
					  <p>E-2, phase-2, Ispatpally</p>
					  <p>Bidhannagar, Durgapur</p>
					  <p>W.B, country-India</p>
					  <p>+91 000-0000-00</p>
					  <a href="mailto:touristblog@gmail.com">touristblog@gmail.com</a>
				 </div>
				 <div class="col-md-3 ftr-logo">
					 <a href="index.jsp"><h3>Tourist blog</h3></a>
					 <p>© 2015 Travels. All rights  Reserved | Design by &nbsp;<a href="http://w3layouts.com">W3Layouts</a></p>
				 </div>
				<div class="clearfix"> </div>
			 </div>
		  </div>
		 <!---End-container---->
		 <!---->
<script type="text/javascript">
		$(document).ready(function() {
				/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
				*/
		$().UItoTop({ easingType: 'easeOutQuart' });
});
</script>
<a href="#to-top" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!----> 
</body>
</html>	