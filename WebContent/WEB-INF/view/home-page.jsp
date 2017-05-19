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

    <title>Online image cropper</title>

    <!-- Bootstrap core CSS -->
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">

  </head>

  <body>
    <!-- Some white spaces -->
	<div class="row">
	   	<div style="width: 100%; height: 30px;"></div>
	 </div>
    <div class="container">
	<div class="row">
		<div class="col-sm-12">
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
					</ul>
				</li>
			</ul>
			<div class="row">
	   			<div style="width: 100%; height: 30px;"></div>
	  		</div>
			<div class="carousel slide" id="carousel-397226">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-397226">
					</li>
					<li data-slide-to="1" data-target="#carousel-397226">
					</li>
					<li data-slide-to="2" data-target="#carousel-397226">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="Carousel Bootstrap First" src="http://globalconnecttours.com/wp-content/uploads/2016/06/banner_hd_wallpaper_blue_hd_wallpaper_hd-1.jpg" />
						<div class="carousel-caption">
							<h4>
								Beauty of nature
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="Carousel Bootstrap Second" src="http://reelsofcinema.com/wp-content/uploads/AngryBirdsBannerCritica.jpg" />
						<div class="carousel-caption">
							<h4>
								Angry birds 7
							</h4>
							<p>
								On an island occupied by the cheeriest birds imaginable, Red is a bit of an outcast. His cynical outlook has kept him at odds with the other birds, but a bit of cynicism might be just what they need.							
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="Carousel Bootstrap Third" src="http://hd-wallpapers.us/wp-content/uploads/2014/05/dodge-challenger-silver-2015-1600x500.jpg" />
						<div class="carousel-caption">
							<h4>
								Dodge Challenger Silver 2015
							</h4>
							<p>
								Everyone will tell you, you don’t mess with an icon. But since when has the Dodge brand ever listened to the “everyones” of the world? That’s right. Never. So we took this model of muscle—the Dodge Challenger—and we made it even better. And bolder. Because we’re the Dodge brand. And that’s what we do.
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-397226" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-397226" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
			<div class="page-header">
				<h1>
					Crop and resize your pictures <br>
					<small>Easily crop, resize, and edit your images online for free .jpg / .png / .gif</small>
				</h1>
			</div> 
		</div>
		<form:form action="cropImage" modelAttribute="userDoc" method="POST" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<!-- Text input-->
					<div class="input-group">
		                <label class="input-group-btn">
		                    <span class="btn btn-primary">
		                        <span class="glyphicon glyphicon-search"></span> Browse&hellip; <input name="fileUploaded" type="file" style="display: none;" >
		                    </span>
		                </label>
		                <input name="name" type="text" class="form-control" readonly/>
		            </div>
				</div>
		   </div><br>
		   <div class="row">
				<div class="col-md-4 col-md-offset-6">
					<button type="submit" class="btn btn-block active btn-success">
						CONTINUE <span class="glyphicon glyphicon-menu-right"></span>
					</button>
				</div>
			</div>
		</form:form>
	   <div class="row">
	   	<div style="width: 100%; height: 30px;"></div>
	   </div>
	   <div class="row">
	   	<div class="col-md-10 col-md-offset-1">
			<p>
				Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
			</p>
		 </div>	
		</div>	
	</div>
</div>
</body>
</html>
                    