<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="cust" tagdir="/WEB-INF/tags" %>

<cust:main>
<div class="contact">
	<div class="container">
		<h3><marquee>Sign up with your email address and start working on your travel diaries right away!</marquee></h3>
		
			<div class="contact-main">
				<div class="contact-top">
					<div class="col-md-8 col-md-offset-2 contact-top">
						<form action="register" method="post" class="form-horizontal">
								<div class="form-group">
								  <label class="form-label col-md-2">Email id</label>
									<div class="col-md-10">
									<input type="text" class="form-control" name="emailid"/>
									</div>
								</div>
								<div class="form-group">
									<label class="form-label col-md-2">Name</label>
									<div class="col-md-10">
									<input type="text" class="form-control" name="name"/>
									</div>
								</div>
								<div class="form-group">
									<label class="form-label col-md-2">Address</label>
									<div class="col-md-10">
										<textarea class="form-control" rows="6" name="address"></textarea>
									</div>
								</div>
								
								<div class="form-group">
								 <label class="form-label col-md-2">Password</label>
								 <div class="col-md-10">
								   <input type="password" class="form-control" name="password"/>
								 </div>
								</div>
								<div class="form-group">
									<div class="col-md-10 col-md-offset-2">
										<button type="submit" class="btn btn-success" name="btnSubmit">Submit</button>
									</div>
								</div>
								<h>Already have an account?</h>
								<a href="login.jsp">Log in</a>
							</form>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</cust:main>
