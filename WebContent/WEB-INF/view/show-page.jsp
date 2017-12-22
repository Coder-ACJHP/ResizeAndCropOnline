<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="org.apache.commons.codec.binary.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Image cropper">
	<meta name="author" content="Coder ACJHP">

	<title>IMAGE CROPPER</title>
	<!-- Bootstrap core and CSS -->
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.Jcrop.min.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.Jcrop.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/crop.js"></script>
</head>

<body>
	<div class="container">
		<!-- Some white spaces -->
	<div class="row">
		<div style="width: 100%; height: 30px;"></div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-tabs">
					<li class="active"><a href="selectFile">Home</a></li>
					<li class="dropdown pull-right">
						<a href="#" data-toggle="dropdown" class="dropdown-toggle">Extras List<strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="https://github.com/Coder-ACJHP/ResizeAndCropOnline">Source code</a></li>
							<li class="divider">
							<li><a href="http://www.kariyer.net/ozgecmis/onur-isik?o=c15o">About developer</a></li>
						</ul></li>
				</ul>
				<div class="row">
					<div style="width: 100%; height: 30px;"></div>
				</div>
				<div class="jumbotron">
					<h3>Select area from the image to crop then hit the 'Crop'
						button.</h3>
					<hr>
					<img alt="Bootstrap Image Preview" id="target" src="data:image/jpeg;base64,${picture}" class="img-thumbnail" />
				</div>
			</div>
		</div>
		<form:form action="serveIt" method="POST">
			<input type="hidden" name="x" id="x" />
			<input type="hidden" name="y" id="y" />
			<input type="hidden" name="w" id="w" />
			<input type="hidden" name="h" id="h" />
			<br>
			<button type="submit" class="btn active btn-primary btn-block">
				Crop <span class="glyphicon glyphicon-scissors" aria-hidden="true"></span>
			</button>
		</form:form>
		<div class="row">
			<div class="col-md-6 col-md-offset-0">
				<form:form action="resizeIt" method="POST">
					<div class="alert alert-info">
						<h2 class="control-label">
							<b>Or select your favorite size : </b>
						</h2>
						<div class="form-inline">
							<label class="radio"> 200 x 200 <input name="pic_size"
								value="200" type="radio"> |
							</label> <label class="radio"> 400 x 400 <input name="pic_size"
								value="400" type="radio"> |
							</label> <label class="radio"> 800 x 600 <input name="pic_size"
								value="600" type="radio"> |
							</label> <label class="radio"> 1200 x 800 <input name="pic_size"
								value="800" type="radio">
							</label>
						</div>
					</div>
					<button type="submit" class="btn active btn-info btn-block">
						Resize <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
					</button>
				</form:form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>