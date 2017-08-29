<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="cust" tagdir="/WEB-INF/tags" %>
<cust:main>
<!-- Creating tour bean object... -->
<jsp:useBean id="tbean" class="bean.TourBean"></jsp:useBean>
            <!--inner-page-about-->
<!--light-box-files -->
		<script src="js/jquery.chocolat.js"></script>
		<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen" charset="utf-8" />
		<!--light-box-files -->
		<script type="text/javascript" charset="utf-8">
		$(function() {
			$('.moments-bottom a').Chocolat();
		});
		</script>
<!--/light-box-files -->
<div class="gallery">
	<div class="container">
		<h3>Gallery</h3>
			<div class="moments-bottom">
				<div class="moments-1">
				<c:forEach items="${tbean.getAllTourImages(param.tourpostid)}" var="i">
			   		<div class="col-md-4 moments-left">
			   			<img src="data:image/jpg;base64,${i.image}" width="100%"/>
			   		</div>			   		
			    </c:forEach>
			    </div>
				<div class="moments-1">
					<div class="col-md-4 moments-left">
						<a href="images/2.jpg">
							<img src="images/2.jpg" alt="name" />
						</a>
					</div>
					<div class="col-md-4 moments-left">
						<a href="images/6.jpg">
							<img src="images/6.jpg" alt="name" />
						</a>
					</div>
					<div class="col-md-4 moments-left">
						<a href="images/4.jpg">
							<img src="images/4.jpg" alt="name" />
						</a>
					</div>
				</div>
				<div class="moments-1">
					<div class="col-md-4 moments-left">
						<a href="images/3.jpg">
							<img src="images/3.jpg" alt="name" />
						</a>
					</div>
					<div class="col-md-4 moments-left">
						<a href="images/1.jpg">
							<img src="images/1.jpg" alt="name" />
						</a>
					</div>
					<div class="col-md-4 moments-left">
						<a href="images/5.jpg">
							<img src="images/5.jpg" alt="name" />
						</a>
					</div>
					<div class="clearfix"> </div>
				</div>
					<div class="moments-1">
					<div class="col-md-4 moments-left">
						<a href="images/20.jpg">
							<img src="images/20.jpg" alt="name" />
						</a>
					</div>
					<div class="col-md-4 moments-left">
						<a href="images/24.jpg">
							<img src="images/24.jpg" alt="name" />
						</a>
					</div>
					<div class="col-md-4 moments-left">
						<a href="images/21.jpg">
							<img src="images/21.jpg" alt="name" />
						</a>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
	</div>

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
</cust:main>