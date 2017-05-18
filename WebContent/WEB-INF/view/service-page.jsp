<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Image cropper">
    <meta name="author" content="Coder ACJHP">

    <title>Download your image</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tableStylw.css">
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
				<li>
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
						</li>
					</ul>
				</li>
			</ul>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h3>Click on the link to download your resized image.</h3><br>
					<table class="mytable">
						<tr>
						 	<th class="myTh"></th>
						    <th class="myTh"></th>
						 </tr>
						 <tr>
						    <td class="myTd"></td>
						    <td class="myTd"></td>
						  </tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>