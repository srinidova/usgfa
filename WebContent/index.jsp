
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="css/chosen.min.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/jquery-ui.min.css">

<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/chosen.jquery.js"></script>
<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script> -->

<meta charset="UTF-8">
<title>USGFA</title>
</head>
<body>
	<!----------------------top_header start-------------------------------->
	<jsp:include page="includes.jsp" />
	<!----------------------top_header end---------------------------------->
<body>
	<!----------------------top_header start---------------------------->
	<jsp:include page="topheader.jsp" />
	<!----------------------top_header end------------------------------>

	<!----------------------header  start------------------------------->
	<jsp:include page="header.jsp" />
	<!----------------------header end---------------------------------->

	<!----------------------menus start--------------------------------->
	<jsp:include page="menu.jsp" />
	<!----------------------menus end----------------------------------->

	<!----------------------banner start-------------------------------->
	<jsp:include page="banner.jsp" />
	<!----------------------banner end---------------------------------->
	<!----------------------body_content------------------------------>
	<script type="text/javascript">
		$(document).ready(function() {
			getPublicImagesHome();
			getPublicVideosHome();
			showService('events');
		});
		function getNewsDetailsHome() {
			$.ajax({
				url : "emp/newsService/getNewsDetailsHome",
				success : function(data) {
					showNewsList(data);
				}

			});
		}
		function getEventDetailsHome() {
			$.ajax({
				url : "emp/eventService/getEventDetailsHome",
				success : function(data) {
					showEventList(data);
					
				}

			});
		}
		function getProgramDetailsHome() {
			$.ajax({
				url : "emp/programService/getProgramDetailsHome",
				success : function(data) {
					showProgramList(data);
				}

			});
		}
		function getStoriesDetailsHome() {
			$.ajax({
				url : "emp/storiesService/getStoriesDetailsHome",
				success : function(data) {
					showStoriesList(data);
				}

			});
		}

		function getPublicImagesHome() {
			var dispImages = '';
			var dispClas = '';
			$.ajax({
						url : "emp/uploadService/getPublicImagesHome",
						success : function(data) {
							$.each(
											data.getPublicImages,
											function(key, val) {
												//alert(data.getPublicImages[key].filePath);
												if (key == 0) {
													dispClas = "item active";
												} else {
													dispClas = "item";
												}
												dispImages = dispImages
														+ '<div class="'+ dispClas +'">'
														+ '<ul class="thumbnails">'
														+ '<li class="col-md-12">'
														+ '<div class="fff">'
														+ '<div class="thumbnail">'
														+ '<a class="g-image" href="#" data-image-id="" data-toggle="modal" data-title="" data-caption="" data-image="'+data.getPublicImages[key].filePath+'" data-target="#image-gallery">'
														+ '<img src="'+data.getPublicImages[key].filePath+'" class="img-responsive" alt=""  align="middle">'
														+ '</img></a>' + '</div>'
														+ '</li>'
														+ '</ul>' + '</div>'
											})
							document.getElementById("publicImages").innerHTML = dispImages;
							$.getScript('/usgfa/js/popup.js');
						}

					});
		}
		function getPublicVideosHome() {
			var dispVideos = '';
			var dispClas = '';
			$.ajax({
				url : "emp/uploadService/getPublicVideosHome",
				success : function(data) {
					$.each(
							data.getPublicVideos,
							function(key, val) {
								alert("filePath=="+data.getPublicVideos[key].filePath);
								if (key == 0) {
									dispClas = "item active";
								} else {
									dispClas = "item";
								}
								dispVideos = dispVideos
										+ '<div class="'+ dispClas +'">'
										+ '<ul class="thumbnails">'
										+ '<li class="col-md-12">'
										+ '<div class="fff">'
										+ '<div class="thumbnail">'
										+ '<a class="g-image" href="#" data-image-id="" data-toggle="modal" data-title="" data-caption="" data-image="'+data.getPublicVideos[key].filePath+'" data-target="#image-gallery1">'
										+ '<iframe src="'+data.getPublicVideos[key].filePath+'" class="img-responsive" alt=""  align="middle" style="text-align: center;width: 100%">'
										+ '</iframe></a>' + '</div>'
										+ '</li>'
										+ '</ul>' + '</div>'
							})
			alert("dispVideos=="+dispVideos);
			document.getElementById("publicVideos").innerHTML = dispVideos;
			$.getScript('/usgfa/js/popup.js');
				}

			});
		}
		
		function showService(serType){
			if(serType == 'events'){
				getEventDetailsHome();
			}else if(serType == 'programs'){
				getProgramDetailsHome();
			}else if(serType == 'news'){
				getNewsDetailsHome();
			}else if(serType == 'stories'){
				getStoriesDetailsHome();
			}
		}
		function showEventList(data){
			var html = '';
			var dispClas = '';
			$.each(
					data.EventDetailsHome,
					function(key, val) {
					if (key == 0) {
						dispClas = "col-md-4";
					} else {
						dispClas = "col-md-4 col-sm-12 col-xs-12";
					}
							html = html
							+'<div class='+dispClas+'>'
							+'<div class="col-item">'
							+'<div class="event">'
								+'<div class="date">'
									+'<h2>'+data.EventDetailsHome[key].timeFrom+'</h2>'
								+'</div>'
								+'<div class="event_name">'
									+'<h2>'+data.EventDetailsHome[key].eventName+'</h2>'
								+'</div>'
								+'<div id="eventGuests"></div>'
								+'<div class="event_details">'
									+'<p>'+data.EventDetailsHome[key].moreInfo+'</p>'
								+'</div>'
								+'<div class="row">'
									+'<div class="readmore">'
										+'<a id='+data.EventDetailsHome[key].eventId+' href="#" onclick="getEventProfile(this.id)">More info...</a>'
									+'</div>'
								+'</div>'
							+'</div>'
							+'</div>'
						+'</div>';
					}
			)
			document.getElementById("eventListData").innerHTML = html;
			document.getElementById("eventGuests").innerHTML = "aaaaaaaaaaaaaa";
			
		}
		function getEventProfile(eventId){
			var eventObject = new Object();
			eventObject.eventId = eventId;
			$.ajax({
				data : eventObject,
				url : "emp/eventService/getEventId",
				success : function(data) {
					if (data.Msg = "success") {
						window.location.href = "eventProfile.jsp";
					}
				}
			}); 
		}
		function showProgramList(data){
			var html = '';
			var dispClas = '';
			$.each(
					data.ProgramDetailsHome,
					function(key, val) {
					if (key == 0) {
						dispClas = "col-md-4";
					} else {
						dispClas = "col-md-4 col-sm-12 col-xs-12";
					}
							html = html
							+'<div class='+dispClas+'>'
							+'<div class="col-item">'
							+'<div class="event">'
								+'<div class="date">'
									+'<h2>'+data.ProgramDetailsHome[key].dateAndTimeFrom+'</h2>'
								+'</div>'
								+'<div class="event_name">'
									+'<h2>'+data.ProgramDetailsHome[key].programName+'</h2>'
								+'</div>'
								+'<div class="event_details">'
									+'<p>'+data.ProgramDetailsHome[key].moreInfo+'</p>'
								+'</div>'
								+'<div class="row">'
									+'<div class="readmore">'
										+'<a id='+data.ProgramDetailsHome[key].programId+' href="#" onclick="getProgramProfile(this.id)">More info...</a>'
									+'</div>'
								+'</div>'
							+'</div>'
							+'</div>'
						+'</div>';
					}
			)
			document.getElementById("programListData").innerHTML = html;
			
		}
		function getProgramProfile(programId){
			var programObject = new Object();
			programObject.programId = programId;
			$.ajax({
				data : programObject,
				url : "emp/programService/getProgramId",
				success : function(data) {
					if (data.Msg = "success") {
						window.location.href = "programProfile.jsp";
					}
				}
			});
		}
		function showNewsList(data){
			var html = '';
			var dispClas = '';
			$.each(
					data.NewsDetailsHome,
					function(key, val) {
					if (key == 0) {
						dispClas = "col-md-4";
					} else {
						dispClas = "col-md-4 col-sm-12 col-xs-12";
					}
							html = html
							+'<div class='+dispClas+'>'
							+'<div class="col-item">'
							+'<div class="event">'
								+'<div class="date">'
									+'<h2>'+data.NewsDetailsHome[key].date+'</h2>'
								+'</div>'
								+'<div class="event_name">'
									+'<h2>'+data.NewsDetailsHome[key].newsTitle+'</h2>'
								+'</div>'
								+'<div class="event_details">'
									+'<p>'+data.NewsDetailsHome[key].moreInfo+'</p>'
								+'</div>'
								+'<div class="row">'
									+'<div class="readmore">'
										+'<a id='+data.NewsDetailsHome[key].newsId+' href="#" onclick="getNewsProfile(this.id)">More info...</a>'
									+'</div>'
								+'</div>'
							+'</div>'
							+'</div>'
						+'</div>';
					}
			)
			document.getElementById("newsListData").innerHTML = html;
			
		}
		function getNewsProfile(newsId){
			var newsObject = new Object();
			newsObject.newsId = newsId;
			$.ajax({
				data : newsObject,
				url : "emp/newsService/getNewsId",
				success : function(data) {
					if (data.Msg = "success") {
						window.location.href = "newsProfile.jsp";
					}
				}
			});
		}
		function showStoriesList(data){
			var html = '';
			var dispClas = '';
			$.each(
					data.StoriesDetailsHome,
					function(key, val) {
					if (key == 0) {
						dispClas = "col-md-4";
					} else {
						dispClas = "col-md-4 col-sm-12 col-xs-12";
					}
							html = html
							+'<div class='+dispClas+'>'
							+'<div class="col-item">'
							+'<div class="event">'
								+'<div class="date">'
									+'<h2>'+data.StoriesDetailsHome[key].title+'</h2>'
								+'</div>'
								+'<div class="event_name">'
									+'<h2>'+data.StoriesDetailsHome[key].name+'</h2>'
								+'</div>'
								+'<div class="event_details">'
									+'<p>'+data.StoriesDetailsHome[key].aboutFarm+'</p>'
								+'</div>'
								+'<div class="row">'
									+'<div class="readmore">'
										+'<a id='+data.StoriesDetailsHome[key].storiesId+' href="#" onclick="getStoriesProfile(this.id)">More info...</a>'
									+'</div>'
								+'</div>'
							+'</div>'
							+'</div>'
						+'</div>';
					}
			)
			document.getElementById("storiesListData").innerHTML = html;
			
		}
		function getStoriesProfile(storiesId){
			var storiesObject = new Object();
			storiesObject.storiesId = storiesId;
			$.ajax({
				data : storiesObject,
				url : "emp/storiesService/getStoriesId",
				success : function(data) {
					if (data.Msg = "success") {
						window.location.href = "storiesProfile.jsp";
					}
				}
			});
		}
	</script>
	<div id="body_content">

		<!----------------------about_us------------------------------>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="about_us">
						<h2>ABOUT US</h2>
						<div class="line4">
							<img src="images/line.png">
						</div>
						<div class="pera">
							<p>Nunc ullamcorper sollicitudin arcu, ut fermentum magna
								ultricies quis. Proin aliquet, est ut pellentesque malesuada,
								purus enim egestas nisl, eget mollis justo lorem facilisis orci.
								Sed in tristique nulla.Nunc ullamcorper sollicitudin arcu, ut
								fermentum magna ultricies quis. Proin aliquet, est ut
								pellentesque malesuada, purus enim egestas nisl, eget mollis
								.justo lorem facilisis orci. Sed in tristique nulla.Nunc
								ullamcorper sollicitudin arcu, ut fermentum magna ultricies
								quis. Proin aliquet, est ut pellentesque malesuada, purus enim
								egestas nisl.</p>
							<a href="aboutUs.jsp">READ MORE</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<!----------------------about_us end------------------------------>

		<!----------------------gallery_section------------------------------>
		<div id="gallery_section">
			<div class="container">
				<div class="row">

					<!----------------------photo_gallery------------------------------>


					<div class="col-md-6">
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="gallery">
									<h2>GALLERY</h2>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<!-- Controls -->
								<div class="row">
									<div class="col-md-12" style="margin-bottom: 10px;">
										<div class="controls pull-right ">
											<a class="left fa fa-angle-left btn btn-default button-arrow"
												href="#carousel-example" data-slide="prev"></a> <a
												class="right fa fa-angle-right btn btn-default button-arrow"
												href="#carousel-example" data-slide="next"></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="carousel-example" class="carousel slide"
							data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="row">
								<div class="modal fade" id="image-gallery" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">×</span><span class="sr-only">Close</span>
												</button>
												<h4 class="modal-title" id="image-gallery-title"></h4>
											</div>
											<div class="modal-body" id="modelBodyPhotoProf">
												<img id="image-gallery-image" class="img-responsive" src="">
											</div>
											<div class="modal-footer">
												<div class="col-md-2">
													<button type="button" class="btn btn-primary"
														id="show-previous-image">Previous</button>
												</div>
												<div class="col-md-8 text-justify"
													id="image-gallery-caption">This text will be
													overwritten by jQuery</div>
												<div class="col-md-2">
													<button type="button" id="show-next-image"
														class="btn btn-default">Next</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-inner" id="publicImages"></div>
						</div>
						<!-- </div> -->
					</div>
					<!----------------------photo_gallery end------------------------------>

					<!----------------------video_gallery------------------------------>
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="gallery">
									<h2>VIDEOS</h2>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<!-- Controls -->
								<div class="row">
									<div class="col-md-12" style="margin-bottom: 10px;">
										<div class="controls pull-right ">
											<a class="left fa fa-angle-left btn btn-default button-arrow"
												href="#carousel-example" data-slide="prev"></a> <a
												class="right fa fa-angle-right btn btn-default button-arrow"
												href="#carousel-example" data-slide="next"></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="carousel-example" class="carousel slide"
							data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="row">
								<div class="modal fade" id="image-gallery1" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">×</span><span class="sr-only">Close</span>
												</button>
												<h4 class="modal-title" id="image-gallery-title"></h4>
											</div>
											<div class="modal-body" id="modelBodyPhotoProf">
												<img id="image-gallery-image" class="img-responsive" src="">
											</div>
											<div class="modal-footer">
												<div class="col-md-2">
													<button type="button" class="btn btn-primary"
														id="show-previous-image">Previous</button>
												</div>
												<div class="col-md-8 text-justify"
													id="image-gallery-caption">This text will be
													overwritten by jQuery</div>
												<div class="col-md-2">
													<button type="button" id="show-next-image"
														class="btn btn-default">Next</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-inner" id="publicVideos"></div>
						</div>
						<!-- </div> -->
					</div>
					<!----------------------video_gallery end------------------------------>

				</div>
			</div>
		</div>
		<div class="clearfix"></div>

		<!----------------------gallery_section end------------------------------>

		<!----------------------service_section------------------------------>
		<div id="service_section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="services">
							<h2>SERVICES</h2>
							<div class="line1"></div>
						</div>
					</div>
					<div class="col-md-12" style="margin-top: 2em;">
						<div class="panel with-nav-tabs ">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab1primary" onclick="showService('events');" data-toggle="tab">EVENTS</a></li>
								<li><a href="#tab2primary" onclick="showService('programs');" data-toggle="tab">PROGRAMS</a></li>
								<li><a href="#tab3primary" onclick="showService('news');" data-toggle="tab">NEWS</a></li>
								<li><a href="#tab4primary" onclick="showService('stories');" data-toggle="tab">Sucess Stories</a></li>
							</ul>
						</div>
						<div class="tabs_content">
							<div class="panel-body">
								<div class="tab-content">

									<!-----------------------event tab---------------------->

									<div class="tab-pane fade in active" id="tab1primary">
										<div id="carousel-example" class="carousel slide">
											<!-- Wrapper for slides -->
											<div class="carousel-inner">
												<div class="item active">
													<div class="row">
														<div id="eventListData">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="more_events">
													<a href='eventList.jsp'>More Events</a>
												</div>
											</div>
										</div>
									</div>

									<!-----------------------event tab end---------------------->

									<!-----------------------programs---------------------->

									<div class="tab-pane fade" id="tab2primary">
										<div id="carousel-example" class="carousel slide">
											<!-- Wrapper for slides -->
											<div class="carousel-inner">
												<div class="item active">
													<div class="row">
														<div id="programListData">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="more_events">
													<a href='programList.jsp'>More Programs</a>
												</div>
											</div>
										</div>
									</div>

									<!-----------------------programs end---------------------->

									<!-----------------------News ---------------------->

									<div class="tab-pane fade" id="tab3primary">
										<div id="carousel-example" class="carousel slide">
											<!-- Wrapper for slides -->
											<div class="carousel-inner">
												<div class="item active">
													<div class="row">
														<div id="newsListData">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="more_events">
													<a href='newsList.jsp'>More News</a>
												</div>
											</div>
										</div>
									</div>

									<!-----------------------News end---------------------->

									<!-----------------------Sucess stories---------------------->
									<div class="tab-pane fade" id="tab4primary">
										<div id="carousel-example" class="carousel slide">
											<!-- Wrapper for slides -->
											<div class="carousel-inner">
												<div class="item active">
													<div class="row">
														<div id="storiesListData">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="more_events">
													<a href="storiesList.jsp">More Sucess Stories</a>
												</div>
											</div>
										</div>
									</div>

									<!-----------------------Sucess stories end---------------------->

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<!----------------------service_section end------------------------------>

	</div>
	<div class="clearfix"></div>
	<!----------------------body_content end------------------------------>

	<!----------------------footer start ------------------------------->
	<jsp:include page="footer.jsp" />
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />

