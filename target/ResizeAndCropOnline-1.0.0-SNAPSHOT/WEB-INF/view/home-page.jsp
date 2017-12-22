<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Image cropper">
    <meta name="author" content="Coder ACJHP">

    <title>Online image cropper</title>

  <!-- Bootstrap core and CSS -->
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>

  </head>

<body>
	<div class="container">
				<!-- HANDLE ERRORS AND SHOW ON SMALL MODAL -->
	<c:if test="${not empty error}">
		<script type="text/javascript">
		    $(document).ready(function(){
		        $("#myModal").modal('show');
		    });
		</script>
		<div id="myModal" class="modal fade">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h3 class="modal-title">Error !</h3>
		            </div>
		            <div class="modal-body">
		                <label style="color:red; font-size: 18px;">${error}!</label>
		            </div>
		        </div>
		    </div>
		</div>
	</c:if>

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
				<li class="dropdown pull-right">
					 <a href="#" data-toggle="dropdown" class="dropdown-toggle">Extras List<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							<a href="https://github.com/Coder-ACJHP/ResizeAndCropOnline">Source code</a>
						</li>
						<li class="divider">
						<li>
							<a href="http://www.kariyer.net/ozgecmis/onur-isik?o=c15o">About developer</a>
						</li>
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
				Double-click any photo or select it and click the &quot;Crop&quot; button and we&quot;ll draw a box around the 
				portion that will be cropped. Resize or scale your photo and the cropped area by pulling the anchors 
				on the corners, then click the checkmark once you&quot;re done. Our image cropper is one smart cookie: 
				it will automatically snap in line with other design elements to give your design perfect alignment. 
				You won&quot;t even have to worry about losing data — if you ever want to crop your photo again you&quot;ll see 
				the whole original photo, just like the first time.			
			</p>
		 </div>	
		</div>	
	</div>
</div>
	</div>  
</body>
</html>
                    