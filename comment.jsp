<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="cust" tagdir="/WEB-INF/tags" %>

<cust:main loginrequired="true">
<div class="contact">
	<div class="container">
		<!-- Creating tour bean object... -->
		<jsp:useBean id="tbean" class="bean.TourBean"></jsp:useBean>
		<h3>Tour Post</h3>
			<div class="contact-main">
				<div class="contact-top">
					<div class="col-md-8 col-md-offset-2 contact-top">
						<form  action="addtourpost" method="post" class="form-horizontal">
								<div class="form-group">
									<label class="form-label col-md-2">Title</label>
									<div class="col-md-10">
										<input type="text" class="form-control" name="title"/>
									</div>
								</div>
								<div class="form-group">
								 <label class="form-label col-md-2">Place Id</label>
								 <div class="col-md-10">
								   <select class="form-control" name="placeid">
									   <option value="">---Select---</option>
									   <c:forEach items="${tbean.getAllPlaces()}" var="p">
									   		<option value="${p.placeid}">${p.placename}</option>
									   </c:forEach>
								   </select>
								 </div>
								</div>
								<div class="form-group">
								 <label class="form-label col-md-2">Tour Details</label>
								 <div class="col-md-10">
								   <textarea class="form-control" rows="6" name="tourdetails" placeholder="Type something here.."></textarea>
								 </div>
								</div>
								<div class="form-group">
								 <label class="form-label col-md-2">Map</label>
								 <div class="col-md-10">
								   <textarea class="form-control" rows="6" name="map"></textarea>
								 </div>
								</div>
								<!-- <div class="form-group">
								 <label class="form-label col-md-2">Upload Picture</label>
								 <div class="col-md-10">
								 <input type="file" name="Upload picture">
								 </div>
								</div> -->
								<div class="form-group">
									<div class="col-md-10 col-md-offset-2">
										<button type="submit" class="btn btn-success" name="btnPost">Post</button>
									</div>
								</div>
							</form>
							<h3>${requestScope['msg']}</h3>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</cust:main>
