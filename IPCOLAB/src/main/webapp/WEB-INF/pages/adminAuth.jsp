<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> -->
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="IPCOLab">
    <meta name="author" content="NEU CCIS Dept">
    
    <link rel="icon" type="image/png" href="https://png.icons8.com/law/ultraviolet/16/000000" />
    
	<title>Admin Authentication</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<style type="text/css">
		<%@include file="../css/adminAuth.css" %>
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		<%@include file="../js/adminAuth.js" %>
		<%@include file="../js/progress.js" %>
	</script>
	<script type="text/javascript">
		setInterval("checkLoad()",1000);
	</script>
</head>
<body>
<div id="preLoaderDiv"></div>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-6 col-md-6 carousel-col">
			<div id="ipco-carousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
				    <li data-target="#ipco-carousel" data-slide-to="0" class="active"></li>
				    <li data-target="#ipco-carousel" data-slide-to="1"></li>
				    <li data-target="#ipco-carousel" data-slide-to="2"></li>
				    <li data-target="#ipco-carousel" data-slide-to="3"></li>
		  		</ol>

	  			<!-- Wrapper for slides -->
	  			<div class="carousel-inner" role="listbox">
	    			<div class="item active">
	      				<img src="http://loremflickr.com/1920/1080/random=1" alt="loremflickr.com">
				      	<div class="carousel-caption">
				        	Image caption!!?? 
				        	A description of the image perhaps!
			      		</div>
	    			</div>
	    			<div class="item">
	      				<img src="http://loremflickr.com/g/1920/1080/paris?random=1" alt="loremflickr.com">
	    			</div>
	    			<div class="item">
	      				<img src="http://loremflickr.com/1920/1080/random=2" alt="loremflickr.com">
				      	<div class="carousel-caption">
				        	Image caption??!!
				        	A description of the image perhaps!
			      		</div>
	    			</div>
	    			<div class="item">
	      				<img src="http://loremflickr.com/g/1920/1080/paris?random=2" alt="loremflickr.com">
	    			</div>
	  			</div>

	  			<!-- Controls -->
	  			<a class="left carousel-control" href="#ipco-carousel" role="button" data-slide="prev">
	    			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    			<span class="sr-only">Previous</span>
	  			</a>
	  			<a class="right carousel-control" href="#ipco-carousel" role="button" data-slide="next">
	    			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    			<span class="sr-only">Next</span>
	  			</a>
			</div>
		</div>
		<div class="col-sm-6 col-md-6 login-col">
			<div class="panel panel-login">
				<div class="panel-heading">
					<div class="row" id="login-view">
						<div class="col-xs-12">
							<a href="#" class="active" id="login-form-link">Login</a>
						</div>
					</div>
					<div class="row hide" id="reset-view">
						<div class="col-xs-6">
							<a href="#" id="email-form-link">Email</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="reset-form-link">Reset</a>
						</div>
					</div>
					<hr>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<span class="errorMsg alert alert-danger"></span>
							<input type="hidden" id="errorMsg" value="${errorMsg}" /> 
						</div>
					</div>
					<div class="row" id="login-form-view">
						<div class="col-sm-12">
							<form:form id="login-form" action="adminLogin.action" modelAttribute="adminLogin" method="post" role="form" style="display: block;">
								<div class="form-group input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><form:input type="text" path="username" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="" required="ture"/>
								</div>
								<div class="form-group input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span><form:input type="password" path="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password" required="ture"/>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12">
											<div class="text-center">
												<a href="#" tabindex="5" class="forgot-password" id="forgot-password">Forgot Username or Password?</a>
											</div>
										</div>
									</div>
								</div>
							</form:form>	
						</div>
					</div>
					<div class="row hide" id="reset-form-view">
						<div class="col-lg-12">
							<form id="email-form" action="#" method="post" role="form" style="display: block;">
								<div class="form-group input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
									<input type="email" name="email" id="resetEmail" tabindex="1" class="form-control" placeholder="Email Address" value="" required/>
									<span class="input-group-addon"><i class="email-check glyphicon glyphicon-refresh glyphicon-refresh-animate"></i></span>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6">
											<input type="button" name="cancel-reset" id="cancel-reset" tabindex="4" class="cancel-reset form-control btn btn-danger" value="Cancel">
										</div>
										<div class="col-sm-6">
											<input type="button" name="reset-next" id="reset-next" tabindex="4" class="form-control btn btn-success" value="Next">
										</div>
									</div>
								</div>
							</form>	
							<form:form id="reset-form" action="resetAdminCredential.action" modelAttribute="newAdminCredential" method="post" role="form" style="display: none;" onsubmit="return validateRegister(this.id);">
								<div class="form-group input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
									<form:input type="text" path="username" name="username" id="resetUsername" tabindex="1" class="form-control" placeholder="Username" value="" required="true" readonly="true"/>
									<span class="input-group-addon"><i class="username-check glyphicon glyphicon-refresh glyphicon-refresh-animate"></i></span>
								</div>
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
										<div class="form-group input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span><form:input type="password" path="password" name="password" id="resetPassword" tabindex="2" class="form-control" placeholder="Password" required="true"/>
										</div>
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6">
										<div class="form-group input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span><input type="password" name="confirm-password" id="resetConfirm-password" tabindex="2" class="form-control" placeholder="Confirm Password" required/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6">
											<input type="button" name="reset-cancel" id="reset-cancel" tabindex="4" class="cancel-reset form-control btn btn-danger" value="Cancel">
										</div>
										<div class="col-sm-6">
											<input type="submit" name="reset-submit" id="reset-submit" tabindex="4" class="form-control btn btn-register" value="Update">
										</div>
									</div>
								</div>
								<form:input type="hidden" path="credentialId" id="reset-credentialId" />
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="bottom"></div>
</body>
</html>