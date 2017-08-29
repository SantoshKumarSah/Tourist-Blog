<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="cust" tagdir="/WEB-INF/tags" %>

<cust:main>
<!-- Creating tour bean object... -->
<jsp:useBean id="tbean" class="bean.TourBean"></jsp:useBean>

<div class="contact">
	<div class="container">
		<h3>Add Place</h3>
			<div class="contact-main">
				<div class="contact-top">
					<div class="col-md-8 col-md-offset-2 contact-top">
						<form action="addplace" method="post" class="form-horizontal">
								<div class="form-group">
									<label class="form-label col-md-2">Place Name</label>
									<div class="col-md-10">
										<input type="text" class="form-control" name="placename"/>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-10 col-md-offset-2">
										<button type="submit" class="btn btn-success" name="btnAdd">Add</button>
									</div>
								</div>
							</form>
					</div>
					<div class="col-md-8 col-md-offset-2 contact-top">
						<table class="table table-bordered table-responsive">
							<c:set var="i" value="1"/>
							<tr>
								<th>Sl No</th>
								<th>Place Name</th>
								<th></th>
							</tr>
							<c:forEach items="${tbean.getAllPlaces()}" var="p">
						   		<tr>
						   			<td>${i}</td>
						   			<td>${p.placename}</td>
						   			<td><a href="delplace?placeid=${p.placeid}" class="btn btn-danger">Delete</a></td>
						   		</tr>
						   		<c:set var="i" value="${i+1}"/>
						   </c:forEach>
						</table>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</cust:main>
