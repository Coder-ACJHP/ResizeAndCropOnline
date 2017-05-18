<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="org.apache.commons.codec.binary.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
	<html lang="en">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Image cropper">
    <meta name="author" content="Coder ACJHP">
	<title>IMAGE CROPPER</title>
<script  type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.Jcrop.min.js"></script>
<script type="text/javascript">
	$(function(){ $('#target').Jcrop({
		onSelect: updateCoords
	}); });
	function updateCoords(c)
	{
		jQuery('#x').val(c.x);
		jQuery('#y').val(c.y);
		jQuery('#w').val(c.w);
		jQuery('#h').val(c.h);
	};
	function checkCoords()
	{
		if (parseInt(jQuery('#w').val())>0) return true;
		alert('Please select a crop region then press submit.');
		return false;
	};
</script>
<!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.Jcrop.min.css"/>
</head>

<body>
	<!-- Some white spaces -->
	<div class="row">
	   	<div style="width: 100%; height: 30px;"></div>
	 </div>
	<div class="container">
	<div class="row">
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="selectFile">Home</a>
				</li>
				<li>
					<a href="#">Extras</a>
				</li>
				<li class="disabled">
					<a href="#">About</a>
				</li>
				<li class="dropdown pull-right">
					 <a href="#" data-toggle="dropdown" class="dropdown-toggle">Dropdown<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							<a href="#">Source code</a>
						</li>
						<li class="divider">
						<li>
							<a href="#">About developer</a>
						</li>
						<li class="divider">
					</ul>
				</li>
			</ul>
			<div class="row">
	   			<div style="width: 100%; height: 30px;"></div>
	 		</div>
			<div class="jumbotron">
				  <h3>
					Select area from the image to crop then hit the 'Crop' button.
				  </h3>
				  <hr>
				  <img alt="Bootstrap Image Preview" id="target"	
				  src="data:image/jpeg;base64,${picture}" class="img-thumbnail"/> 
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
		</div>
	</div>
</div>

	
</body>
</html>