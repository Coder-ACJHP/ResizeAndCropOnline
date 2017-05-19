<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="org.apache.commons.codec.binary.Base64"%>

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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tableStyle.css">
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
					<div align="center">
						<h3>Your image was successfully resized!</h3><br/>
						<span>Choose one of these options to complete your job.</span>
						<c:if test="${error != null}">
							<div class="alert alert-danger">
    							<strong>Warning!</strong> ${error}
  							</div>
						</c:if>
					</div>
					<!-- Some white spaces -->
					<div class="row">
					   	<div style="width: 100%; height: 30px;"></div>
					 </div>
					 
					<table class="mytable">
						<tr style="height:100px">
							<th style="padding-top: 15px;">
							 	<div align="center">	
							 		<a href="saveAsPng">
							 		<img src="http://www.freeiconspng.com/uploads/save-download-icon-8.png" width="72" height="72"></a>
							 		<br/>Download as .png
							 	</div> 	
						 	</th>
							<th style="padding-top: 15px;">
							    <div align="center">	
							    	<a href="saveAsJpg">
							    	<img src="http://www.freeiconspng.com/uploads/save-download-icon-8.png" width="72" height="72"></a>
							    	<br/>Download as .jpg
							    </div>	
							</th>   
						</tr>
						<tr>
							<td>
							    <div align="center">
							    <a href="javascript:history.go(-1)">
							    	<img src="http://www.freeiconspng.com/uploads/return-button-png-31.png" width="72" height="72"></a>
							    	<br/><b>Resume editing.</b>
							    </div>
							</td>
							<td>
							    <div align="center">
							    	<a id="modal-177622" href="#modal-container-177622" role="button" class="btn" data-toggle="modal">
							    	<img src="http://www.freeiconspng.com/uploads/eye-see-view-watch-icon--icon-search-engine-9.png" width="72" height="72"></a>
							    	<br/><b>View image.</b>
							    </div>
							</td>
						 </tr>
					</table>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">			
			<div class="modal fade" id="modal-container-177622" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content modal-lg">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">
								Your image 
							</h4>
						</div>
						<div class="modal-body">
							<img src="data:image/png;base64,${picture}" width="100%" height="100%">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								Close
							</button> 
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>
</body>
</html>