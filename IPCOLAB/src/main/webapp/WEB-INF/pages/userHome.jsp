<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<!-- <meta charset="ISO-8859-1"> -->
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="IPCOLab">
    <meta name="author" content="NEU CCIS Dept">
    
    <link rel="icon" type="image/png" href="https://png.icons8.com/law/ultraviolet/16/000000" />
    
	<title>Home</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/metro-bootstrap/3.1.1.2/css/metro-bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		<%@include file="../css/header.css" %>
		<%@include file="../css/userHome.css" %>
	</style>
	<script type="text/javascript">
		<%@include file="../js/userHome.js" %>
		<%@include file="../js/progress.js" %>
	</script>
	<script type="text/javascript">
		setInterval("checkLoad()",1000);
	</script>
</head>
<body>
<div id="preLoaderDiv"></div>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- <div class="jumbotron title">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="userProfile.action">Profile</a></li>
		  	<li class="breadcrumb-item active"><span class="h3">Choose Tutorial</span></li>
		</ol>
		<div class="container text-center">
			<h1>Choose Tutorial</h1>
			<p>Take one of the Overview tutorial or Customize your tutorial.</p>
		</div>
	</div> -->
	<div class="jumbotron content user">
	<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="userProfile.action">Profile</a></li>
		  	<li class="breadcrumb-item active"><span class="h3">Choose Tutorial</span></li>
	</ol>
	<div class="container-fluid text-center">
		<span class="h2">Choose Tutorial</span>
		<p>Take one of the Overview tutorial or Customize your tutorial.</p>
	</div>
	<div class="container-fluid option-content">
		<div class="row">
			<div class="col-sm-3">
				<div class="thumbnail tile tile-large tile-turquoise option-desc" id="option-1-desc">
					<a href="#">
					<h4 class="tile-text text-center"><strong>Overview of IP : </strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</h4>
					</a>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="thumbnail tile tile-large tile-green-sea option" id="option-1">
				<a href="#" id="gotoBasicProfile.action">
				<h1 class="tile-text text-center">Overview  <br/>of IP</h1>
				</a>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="thumbnail tile tile-large tile-peter-river option" id="option-2">
				<a href="#" id="loadDiagnostic.action">
					<h1  class="tile-text text-center" >Customize Tutorial</h1>
					</a>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="thumbnail tile tile-large tile-belize-hole option-desc" id="option-2-desc">
					<a href="#">
					<h4 class="tile-text text-center"><strong>Customize Tutorial : </strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</h4>
					</a>
				</div>
			</div>
		</div>
	</div>
	</div>
	<form action="#" id="customForm" method="post"></form>
	<div id="bottom"></div>
</body>
</html>