<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="cust" tagdir="/WEB-INF/tags" %>

<cust:main>
<div class="contact">
	<div class="container">
		<h3>Login</h3>
			<div class="contact-main">
				<div class="contact-top">
					<div class="col-md-8 col-md-offset-2 contact-top">
						<form action="login" method="post" class="form-horizontal">
								<div class="form-group">
									<label class="form-label col-md-2">Email id</label>
									<div class="col-md-10">
										<input type="text" class="form-control" name="emailid"/>
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
							</form>
							<b>${requestScope['msg']}</b>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</cust:main>
