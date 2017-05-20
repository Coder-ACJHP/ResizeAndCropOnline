<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Error - Java Arabic Community</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href='//fonts.googleapis.com/css?family=Offside' rel='stylesheet'>
<style type="text/css" >
body{
	font-family: 'Offside';font-size: 22px;
	background: -moz-linear-gradient(45deg, #00ffff 0%, #ffff00 87%, #ffff00 100%); /* ff3.6+ */
	background: -webkit-gradient(linear, left bottom, right top, color-stop(0%, #00ffff), color-stop(87%, #ffff00), color-stop(100%, #ffff00)); /* safari4+,chrome */
	background: -webkit-linear-gradient(45deg, #00ffff 0%, #ffff00 87%, #ffff00 100%); /* safari5.1+,chrome10+ */
	background: -o-linear-gradient(45deg, #00ffff 0%, #ffff00 87%, #ffff00 100%); /* opera 11.10+ */
	background: -ms-linear-gradient(45deg, #00ffff 0%, #ffff00 87%, #ffff00 100%); /* ie10+ */
	background: linear-gradient(45deg, #00ffff 0%, #ffff00 87%, #ffff00 100%); /* w3c */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffff00', endColorstr='#00ffff',GradientType=1 );
}
.wrap{
	margin:0 auto;
	padding: 0;
	width:100%;
}
.logo{
	text-align:center;
	margin-top:100px;
}
.logo img{
	width:250px;
}
.logo p{
	color:#272727;
	font-size:35px;
	margin-top:1px;
}	
.logo p span{
	color:lightgreen;
}	
.sub a{
	color:#fff;
	background:#272727;
	text-decoration:none;
	margin-top: 140px;
	padding:10px 20px;
	font-size:13px;
	font-family: arial, serif;
	font-weight:bold;
	-webkit-border-radius:.5em;
	-moz-border-radius:.5em;
	-border-radius:.5em;
	
}
.sub-sub {
	margin-top: 200px;
}		
</style>
</head>


<body>
 <div class="wrap">
	<div class="logo">
			<label style="font-size: 100px;">${headerError}</label>
			<p>${error}</p>
			<img src="${pageContext.request.contextPath}/resources/images/Logo.png"/>
			<div class="sub">
			  <p class="sub-sub"><a href="${pageContext.request.contextPath }/tools/selectFile">Back </a></p>
			</div>
	</div>
 </div>
</body>
</html>