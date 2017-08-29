<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="cust" tagdir="/WEB-INF/tags" %>

<cust:main>
<!-- Creating tour bean object... -->
<jsp:useBean id="tbean" class="bean.TourBean"></jsp:useBean>

<div class="contact">
	<div class="container">
		<h3>View Tour</h3>
			<div class="contact-main">
				<div class="contact-top">
					<c:forEach items="${tbean.allTourPost}" var="t">
						 <div class="col-md-4 contact-top">
							 <div style="padding:20px;background-color: #ccc;border-radius:10px;">
								<h3 style="font-size:16pt;text-align: left">${t.title}</h3><hr/>
								<p>${t.shortDescription}
								 <a href="details.jsp?tourpostid=${t.tourpostid}">...details</a>
								</p>
							 </div>
						  </div>
					 </c:forEach>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</cust:main>
