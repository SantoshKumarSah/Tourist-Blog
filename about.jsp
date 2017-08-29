<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="cust" tagdir="/WEB-INF/tags" %>
<cust:main>
           <!--inner-page-about-->
<div class="abouts">
		<div class="container">
			<h3>About Us</h3>
			<div class="about-main">
				<div class="about-top">
					<div class="col-md-5 about-top-left">
						<img src="images/a1.jpg" class="img-responsive" alt=""/>
					<div class="col-md-7 about-top-right">
						<h4>Let's find some beautiful place to get lost.</h4>
						<p>...so many people live within unhappy cicumstances and yet will not take the initiative to change their situtation because they are conditioned to a life of security,conformity,and conservatism,all of which may appear to give one peace of mind,but in reality nothing is more damaging to the adventurous spirit within a man than a secure future.</p>
						<p>The very basic core of a man's living spirit is his passion for adventure.The joy of life comes from our encounters with new experiences ,and hence there is no greater joy then to have an endlessly changing horizon,for each day,to have a new and different sun </p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>	 
	 <!------->
	 <div class="who_are">
	     <div class="container">			
				 <h5>WHO WE ARE</h5>
				 <h4>The story behind us.</h4>
				 <p>A number of days ago we took the trip.Before we left we started searching for 
				 a website where we can search the new tour place. When we couldn't find anything
				 like that then we started dreaming of a better way to search the new tour place.
				 then the tourist blog was set up by us.</p>
				 <h4>Why tourist blog is the best choice?</h4>
			 
				 <div class="about-list">
					 <ul>
						 <li><a href="">Our services are free.</a></li>
						 <li><a href="">Work directly in our online application.</a></li>
						 <li><a href="">Use it on every computer, tablet and mobile.</a></li>
						 <li><a href="">Add unlimited amount of pictures.</a></li>
						  <li><a href="">Never lose your travel stories.We keep it safe for you.</a></li>
						 <li><a href="">Save travel routes with oue unique mapping option.</a></li>
						 <li class="none"><a href="">Share your stories with family and friends...</a></li>
						  <li><a href="">...or keep them to yourself.</a></li>
					 </ul>		 
				 </div>			 
         </div>
	 </div>
	 <!------->
	 <div class="team-work1">
	  <div class="container">
		 <h4 class="team">OUR TEAM</h4>
		 <div class="team-grids">
		  <div class="col-md-3 team-grid1">
				 <img src="images/img2.jpg" alt=""/>
				 <h4><a href="single.html">Durgesh Kumari Shukla</a></h4>
				 <p>"Be Brave.Take Risks.Nothing Can Substitute Experience..."</p>
				 <p>Persuing Btech 3rd year,BCETW,Durgapur,West Bengal</p>
			 </div>
			 <div class="col-md-3 team-grid1">
				 <img src="images/img6.jpg" alt=""/>
				 <h4><a href="single.html">Santosh Kumar Sah</a></h4>
				 <p>"Life Is Either A Great Adventure Or Nothing... "</p>
				 <p>Persuing Btech 3rd year,BCET,Durgapur,West Bengal</p>
			 </div>
			 <div class="col-md-3 team-grid1">
				 <img src="images/img3.jpg" alt=""/>
				 <h4><a href="single.html">Gunjan Prasad</a></h4>
				 <p>"A Journey Of A Thousand Miles Begin With A Single Step..."</p>
				 <p>Persuing Btech 3rd year,BCETW,Durgapur,WEST Bengal</p>
			 </div>
			 <div class="col-md-3 team-grid1">
				 <img src="images/img5.jpg" alt=""/>
				 <h4><a href="single.html">Goutami Mehta</a></h4>
				 <p>"A Good Traveller Is One Who Know How To Travel With The Mind..."</p>
				 <p>Persuing Btech 3rd year,BCETW,Durgapur,WEST Bengal</p>
			 </div>
			 <div class="col-md-3 team-grid1">
				 <img src="images/img4.jpg" alt=""/>
				 <h4><a href="single.html">Neha Srivastava</a></h4>
				 <p>"Travel Is The Only Thing You Buy That Makes You Richer..."</p>
				 <p>Persuing Btech 3rd year,BCETW,Durgapur,WEST Bengal</p>
			 </div>
			 <div class="col-md-3 team-grid1">
				 <img src="images/img1.jpg" alt=""/>
				 <h4><a href="single.html">Priya Shankar</a></h4>
				 <p>"Travelling Open Eyes,Warms Hearts & Frees Minds..."</p>
				 <p>Persuing Btech 3rd year,BCETW,Durgapur,WEST Bengal</p>
			 </div>
			 <div class="clearfix"></div>
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