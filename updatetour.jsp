<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="cust" tagdir="/WEB-INF/tags" %>

<cust:main loginrequired="true">
<!-- Creating tour bean object... -->
<jsp:useBean id="tbean" class="bean.TourBean"></jsp:useBean>
<c:if test="${empty  param.tourpostid}">
	<c:redirect url="mytour.jsp"/>
</c:if>
<c:set  var="tourpost" value="${tbean.getTourPostById(param.tourpostid)}"/>


<div class="contact">
	<div class="container">
		<h3>Tour Post</h3>
			<div class="contact-main">
				<div class="contact-top">
					<div class="col-md-8 col-md-offset-2 contact-top">
						<form  action="updatetourpost" method="post" class="form-horizontal">
								<div class="form-group">
									<label class="form-label col-md-2">Title</label>
									<div class="col-md-10">
										<input type="text" class="form-control" name="title" value="${tourpost.title}"/>
									</div>
								</div>
								<div class="form-group">
								 <label class="form-label col-md-2">Place</label>
								 <div class="col-md-10">
								 	
								   <select class="form-control" name="placeid">
									   <option value="">---Select---</option>
									   <c:forEach items="${tbean.getAllPlaces()}" var="p">
									   		<c:choose>
									   			<c:when test="${tourpost.place.placeid==p.placeid}">
									   				<option selected="selected" value="${p.placeid}">${p.placename}</option>
									   			</c:when>
									   			<c:otherwise>
									   				<option value="${p.placeid}">${p.placename}</option>
									   			</c:otherwise>
									   		</c:choose>
									   </c:forEach>
								   </select>
								 </div>
								</div>
								<div class="form-group">
								 <label class="form-label col-md-2">Tour Details</label>
								 <div class="col-md-10">
								   <textarea class="form-control" rows="6" name="tourdetails" placeholder="Type something here..">${tourpost.tourdetails}</textarea>
								 </div>
								</div>
								<div class="form-group">
								 <label class="form-label col-md-2">Map</label>
								 <div class="col-md-10">
								   <textarea class="form-control" rows="6" name="map">${tourpost.map}</textarea>
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
										<button type="submit" class="btn btn-success" name="btnPost">Update</button>
									</div>
								</div>
							</form>
							<br/><br/>
							<h3>Add Tour Images...</h3><hr/><br/>
							<form  action="uploadtourimage" method="post" class="form-horizontal" enctype="multipart/form-data">
								<input type="hidden" name="tourpostid" value="${param.tourpostid}"/>
							    <div class="form-group">
								   <label class="form-label col-md-2">Upload Picture</label>
								    <div class="col-md-8">
								     <input type="file" name="tourimage">
								    </div>
								    <div class="col-md-2">
										<button type="submit" class="btn btn-success" name="btnUpload">Upload</button>
									</div>
								 </div>								
							</form>
							
							
							<h3>${requestScope['msg']}</h3>
							
							<div class="col-md-8 col-md-offset-2 contact-top">
								
									<c:forEach items="${tbean.getAllTourImages(param.tourpostid)}" var="i">
								   		<div class="col-md-4">
								   			<img src="data:image/jpg;base64,${i.image}" width="100%"/>
								   		</div>
								   		
								    </c:forEach>
							
							</div>	
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</cust:main>
