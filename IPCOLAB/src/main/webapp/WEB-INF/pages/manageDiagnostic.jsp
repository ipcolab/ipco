<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="IPCOLab">
    <meta name="author" content="NEU CCIS Dept">
    
    <link rel="icon" type="image/png" href="https://png.icons8.com/law/ultraviolet/16/000000" />
	<title>Manage Diagnostic</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/metro-bootstrap/3.1.1.2/css/metro-bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="https://cdn.tinymce.com/4/tinymce.min.js"></script>
	<style type="text/css">
		<%@include file="../css/manageDiagnostic.css" %>
		<%@include file="../css/header.css" %>
	</style>
	<script type="text/javascript">
		<%@include file="../js/manageDiagnostic.js" %>
		<%@include file="../js/progress.js" %>
	</script>
	<script type="text/javascript">
		setInterval("checkLoad()",1000);
	</script>
</head>
<body>
<div id="preLoaderDiv"></div>
<jsp:include page="header.jsp"></jsp:include>
	<div class="jumbotron content">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="adminHome.action">Home</a></li>
		  	<li class="breadcrumb-item active"><span class="h3">Manage Diagnostic</span></li>
		</ol>
		<div class="container text-center">
			<span class="h2">Manage Diagnostic</span>
			<p>Add-Remove-Edit Categories and Diagnostic questions, all at one place.</p>
		</div>
		<div class="jumbotron">
			<div class="container-fluid text-left">
				<div class="row">
					<div class="col-sm-12">
						<div class="jumbotron category_holder">
							<div class="row">
								<div class="col-sm-2">
								<a class="btn btn-info btn-block" data-toggle="modal"
									data-target="#addNewCategory" role="button"><i class="glyphicon glyphicon-plus">Add Category</i></a>
								</div>
								<div class="col-sm-2 pull-right">
								<a class="btn btn-info btn-block" href="manageRelatedDiagnostic.action" role="button">View Related Questions</a>
								</div>
							</div>
							<c:if test="${not (fn:length(allCategories)>0)}">
							<br>
							<div class="row">
								<div class="col-sm-12">
								<span class="h2"><i class="glyphicon glyphicon-warning-sign">&nbsp;&nbsp;</i>No categories available. You might want to add the first one.</span>
								</div>
							</div>
							</c:if>
						</div>
						<c:if test="${fn:length(allCategories)>0}">
						<c:forEach items="${allCategories}" var="category" varStatus="categoryNo">
							<div class="jumbotron category_holder">
								<div class="row">
									<div class="col-sm-6">
									<span class="container_name h3 span-category-${category.categoryId}" 
										data-toggle="collapse" data-target="#diagnostics_for-${category.categoryId}" id="category_name_${category.categoryId}">${category.categoryTitle}</span>
									</div>
									<div class="col-sm-3 pull-right">
									<button class="btn btn-info" data-toggle="collapse" data-target="#viewCategoryDesc_${category.categoryId}"><i class="glyphicon glyphicon-info-sign">&nbsp;Description&nbsp;</i></button>
									<button class="btn btn-warning" id="${category.categoryId}" name="${category.categoryTitle}" onclick="renameCategory(this)"><i class="glyphicon glyphicon-pencil">&nbsp;Rename&nbsp;</i></button>
									<a class="btn btn-danger" id="deleteId_${category.categoryId}" role="button" onclick="deleteCategory(this)"><i class="glyphicon glyphicon-trash">&nbsp;Remove&nbsp;</i></a>
									</div>
									<input type="hidden" id="categoryNotEmpty_${category.categoryId}" value="${fn:length(category.diagnosticQuestions)>0}" />
								</div>
								
								<div class="panel-collapse collapse" id="viewCategoryDesc_${category.categoryId}">
									<div class="container-fluid categoryDescContainer_${category.categoryId}">
										<div id="categoryDescContent_${category.categoryId}" class="desc-body">${category.categoryDesc}</div>
										<div class="row"><div class="col-sm-2 pull-right">
											<button class="btn btn-warning" onclick="editCategoryDesc(${category.categoryId})"><i class="glyphicon glyphicon-edit">&nbsp;Edit&nbsp;</i></button>
										</div></div>
									</div>
									<div class="container-fluid form-group categoryDescEditor_${category.categoryId} desc-body" style="display: none">
										<textarea id="categoryDescEdit_${category.categoryId}" name="categoryDesc" rows="5" placeholder="Enter Category Description here." >${category.categoryDesc}</textarea>
										<div class="row">
										<div class="col-sm-2 pull-right desc-body">
											<button class="btn btn-success" onclick="updateCategoryDesc(${category.categoryId})"><i class="glyphicon glyphicon-check">&nbsp;Update</i></button>
										</div>
										</div>
									</div><hr>
								</div>
							
								<div class="panel-collapse collapse in" id="diagnostics_for-${category.categoryId}">
									<div class="jumbotron diagnostic_holder">
										<div class="row">
											<div class="col-sm-4">
												<form action="gotoAddDiagnostic.action" method="post">
													<input type="hidden" name="categoryId" value="${category.categoryId}"/>
													<!-- <input type="submit" class="btn btn-info" role="button" value="Add a Diagnostic Question"/> -->
													<button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-plus">Add Diagnostic Question</span></button>
												</form>
											</div>
										</div>
										<c:if test="${not (fn:length(category.diagnosticQuestions)>0)}">
										<br>
										<div class="row">
											<div class="col-sm-12">
											<span class="h3">No diagnostic question available. You might want to add the first one.</span>
											</div>
										</div>
										</c:if>
									</div>
									<c:if test="${fn:length(category.diagnosticQuestions)>0}">
									<c:forEach items="${category.diagnosticQuestions}" var="diagnostic" varStatus="diagnosticNo">
									<div class="jumbotron diagnostic_holder">
										<div class="row">
											<div class="col-sm-8">
											<span class="container_name p collapsed span-diagnostic-${diagnostic.diagnosticId}" 
												data-toggle="collapse" data-target="#topics_for-${diagnostic.diagnosticId}" id="diagnosticName_${diagnostic.diagnosticId}">${diagnostic.activity.activityTitle}</span>
											</div>
											<div class="col-sm-4">
											<button class="btn btn-info" id="relatedDiagnostic_${diagnostic.diagnosticId}" onclick="addRelatedDiagnostic(this)">Associate a Diagnostic Question</button>
											<button class="btn btn-warning" id="editDiagnostic_${diagnostic.diagnosticId}" name="${diagnostic.activity.activityTitle}" onclick="editDiagnostic(id)"><i class="glyphicon glyphicon-edit">&nbsp;Edit&nbsp;</i></button>
											<a class="btn btn-danger" id="deleteId_${diagnostic.diagnosticId}" role="button" onclick="deleteDiagnostic(this)"><i class="glyphicon glyphicon-trash">&nbsp;Remove&nbsp;</i></a>
											</div>
										</div>
								
										<div class="panel-collapse collapse" id="topics_for-${diagnostic.diagnosticId}">
											<div class="jumbotron activity_holder">
												<div class="container-fluid">
												<div class="alert alert-info diag-qstn" role="alert">
													<div class="row">
														<div class="col-sm-8">${diagnostic.activity.activityText}</div>
														<c:forEach items="${diagnostic.options}" var="option">
														<div class="col-sm-2">
														<a class="btn ${option.isCorrect=='true'?'btn-success':'btn-default'} btn-block" role="button" >${option.optionText}</a>
														</div>
														</c:forEach>
													</div>
												</div>
												</div>
												<div class="row">
													<c:if test="${fn:length(diagnostic.topics)>0}">
													<c:forEach items="${diagnostic.topics}" var="topic" varStatus="topicNo">
													<div class="col-sm-4">
														<span class="w3-tag w3-padding w3-round-large w3-black w3-center">${topic.topicName}</span>
										      			<!-- <div class="tile black"> -->
										        				<%-- <h4 class="title">${topic.topicName}</h4> --%>
										       		 		<%-- <p>${topic.topicDesc}</p> --%>
										      			<!-- </div> -->
										      			
										   	 		</div>
													</c:forEach>
													</c:if>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									</c:if>
								</div>
							</div>
						</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="manageDiagnosticModal.jsp"></jsp:include>
	<div id="bottom"></div>
</body>
</html>