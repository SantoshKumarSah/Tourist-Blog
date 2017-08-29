<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="cust" tagdir="/WEB-INF/tags" %>

<cust:main>

<!-- Creating tour bean object... -->
<jsp:useBean id="tbean" class="bean.TourBean"></jsp:useBean>
<c:if test="${empty  param.tourpostid}">
	<c:redirect url="alltour.jsp"/>
</c:if>
<c:set  var="tourpost" value="${tbean.getTourPostById(param.tourpostid)}"/>
<div class="contact">
	<div class="container">
			<h3>${tourpost.title}</h3>
			<div class="contact-main">
				<div class="contact-top">
					<div class="col-md-7 col-md-offset-1 contact-top">
						<p align="justify">
							${tourpost.tourdetails}
						</p>
					</div>
					<div class="col-md-3 col-md-offset-1 contact-top">
						<p align="justify">
							${tourpost.map}
						</p>
					</div>
					<div class="clear"></div>
					
					<c:if test="${not empty sessionScope['logid']}">
						<div class="col-md-8 col-md-offset-2 contact-bottom">
							<br/><br/><br/>
							<form  action="addcomment" method="post" class="form-horizontal">
								<input type="hidden" name="tourpostid" value="${param.tourpostid}"/>
							  	<div class="form-group">
									 
									 <div class="col-md-12">
							
									   <textarea class="form-control" rows="6" name="comment" placeholder="Comment here..."></textarea>
									   <button type="submit" class="btn btn-success" name="btnAdd">Comment</button>
									 </div>
									 
								</div>
								
								
							</form>
							
						</div>
					</c:if>	
					<div class="col-md-8 col-md-offset-2 contact-top">
						<table class="table table-responsive">
							<c:set var="i" value="1"/>
							<c:forEach items="${tbean.getAllComment()}" var="c">
						   		<tr>
						   			<td>${i}</td>
						   			<td>${c.comment}</td>
						   			<td>
						   			<c:if test="${not empty sessionScope['logid'] and sessionScope['logid']==c.user.emailid}">	
						   				<a href="delcomment?commentid=${c.commentid}" class="btn btn-primary">Remove</a>
						   			</c:if>	
						   			</td>
						   		</tr>
						   		<c:set var="i" value="${i+1}"/>
						    </c:forEach>
						</table>
					</div>	
				</div>
			</div>
	</div>
</div>
</cust:main>
