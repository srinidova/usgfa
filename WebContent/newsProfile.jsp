<!doctype html>
<html>
<head>
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
	<%-- <jsp:include page="banner.jsp" /> --%>
	<!----------------------banner end---------------------------------->
<head>
<link rel="stylesheet" href="css/chosen.min.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/jquery-ui.min.css">
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<!-- <script  src="https://code.jquery.com/jquery-2.2.4.js"></script> -->
<script src="js/jquery-ui.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/chosen.jquery.js"></script>
<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="js/vendor-date.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//alert("-------in News Profile--Jsp---");
						var html = '';
						$
								.ajax({
									url : "emp/newsService/getNewsProfile",
									success : function(data) {
										$
												.each(
														data.NewsProfile,
														function(key, val) {
															//alert("getNewsProfile---*****123*****-------newsId=="+data.NewsProfile[key].newsId);
															$('#newsProfTitle')
																	.text(
																			data.NewsProfile[key].newsTitle);
															$('#newsProfDate')
																	.text(
																			data.NewsProfile[key].date);
															$('#newsProfPaper')
																	.text(
																			data.NewsProfile[key].paper);
															$('#newsProfLink')
																	.text(
																			data.NewsProfile[key].link);
															$(
																	'#newsProfMoreInfo')
																	.text(
																			data.NewsProfile[key].moreInfo);
															$('#newsProfNewsId')
																	.val(
																			data.NewsProfile[key].newsId);
														})
														
														$.each(
																data.NEWSFILES,
																function(key, val) {
																	alert("NEWSFILES---*****99999999999*****-------filePath=="+data.NEWSFILES[key].filePath);
																	html = html
																	+'<li class="col-md-12">'
																		+'<div class="fff">'
																			+'<div class="thumbnail">'
																				+'<a href="#"> <img src='+data.NEWSFILES[key].filePath+' class="img-responsive" alt=""></a>'
																			+'</div>'
																			+'<div class="img_tiltle">'
																				+'<h2>Image 1</h2>'
																			+'</div>'
																			+'<div class="caption">'
																				+'<div class="checkbox">'
																					+'<label> <input id="login-remember" type="checkbox" name="remember" value="1"> Show as Public </label>'
																					+'<div class="suceee_msg"><h4>Updated successfully</h4></div>'
																				+'</div>'
																				+'<div class="delete_box">'
																					+'<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
																					+'<div class="suceee_msg"><h4>Delete Message</h4></div>'
																				+'</div>'
																			+'</div>'
																		+'</div>'
																	+'</li>'

																})
																$(html).appendTo("#newsImages");
									}
								
								
								});
						

					});
	function editProfNews() {
		//alert("editProfNews---**********-------newsProfNewsId=="+ $("#newsProfNewsId").val());
		var newsId = $("#newsProfNewsId").val();
		//alert("editProfNews---**********-------newsId=="+newsId);
		var newsObject = new Object();
		newsObject.newsId = newsId;
		$.ajax({
			data : newsObject,
			url : "emp/newsService/getNewsId",
			success : function(data) {
				if (data.Msg = "success") {
				}
			}
		});

	}
</script>
</head>
<!----------------------body_content start-------------------------->

<div class="clearfix"></div>
<div id="aboutus">
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>News Profile</h2>
				<div class="line3"></div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>

<div class="container" style="margin-top: 20px;">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-10 toppad">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">News Form Profile</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-10 col-lg-8 col-md-offset-2">
							<table
								class="table table-user-information  table-bordered table-responsive">
								<tbody>
									<tr>
										<td class="text-nowrap"><b> Name Title:</b></td>
										<td>
											<div id="newsProfTitle"></div> <input type="hidden"
											class="form-control" id="newsProfNewsId"
											name="newsProfNewsId">
										</td>
									</tr>
									<tr>
										<td><b>Date</b></td>
										<td><div id="newsProfDate"></div></td>
									</tr>
									<tr>
										<td><b>Paper</b></td>
										<td><div id="newsProfPaper"></div></td>
									</tr>
									<tr>
										<td><b>Link/Url:</b></td>
										<td><div id="newsProfLink"></div></td>
									</tr>

									<tr>
										<td><b>More Info:</b></td>
										<td><div id="newsProfMoreInfo"></div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<nav>
								<ul class="control-box pager text-left">
									<li><a data-slide="prev" href="#myCarousel" class=""><i
											class="glyphicon glyphicon-chevron-left"></i></a></li>
									<li><a data-slide="next" href="#myCarousel" class="">
											<i class="glyphicon glyphicon-chevron-right"></i>
									</a></li>
								</ul>
							</nav>
							<div class="carousel slide" id="myCarousel">
								<div class="carousel-inner">
									<div class="item active">
										<ul class="thumbnails">
											<!-- <div id="newsImages"></div> -->
											<li class="col-md-12">
												<div class="fff">
													<div class="thumbnail">
														<a href="#"> <img
															src="images/5326574-a-sheep-wallpapers.JPG"
															class="img-responsive" alt="">
														</a>
													</div>
													<div class="img_tiltle">
														<h2>Image 1</h2>
													</div>
													<div class="caption">
														<div class="checkbox">
															<label> <input id="login-remember"
																type="checkbox" name="remember" value="1"> Show
																as Public
															</label>
															<div class="suceee_msg">
																<h4>Updated successfully</h4>
															</div>
														</div>
														<div class="delete_box">
															<a href="#"><i class="fa fa-trash-o"
																aria-hidden="true"></i> Delete</a>
															<div class="suceee_msg">
																<h4>Delete Message</h4>
															</div>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div class="item ">
										<ul class="thumbnails">
											<li class="col-md-12">
												<div class="fff">
													<div class="thumbnail">
														<a href="#"><img
															src="images/5326574-a-sheep-wallpapers.jpg" alt=""></a>
													</div>
													<div class="img_tiltle">
														<h2>Image 2</h2>
													</div>
													<div class="caption">
														<div class="checkbox">
															<label> <input id="login-remember"
																type="checkbox" name="remember" value="1"> Show
																as Public
															</label>
															<div class="suceee_msg">
																<h4>Updated successfully</h4>
															</div>
														</div>
														<div class="delete_box">
															<a href="#"><i class="fa fa-trash-o"
																aria-hidden="true"></i> Delete</a>
															<div class="suceee_msg">
																<h4>Delete Message</h4>
															</div>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<!-- /Slide3 -->
								</div>

								<!-- /.control-box -->

							</div>
							<!-- /#myCarousel -->

						</div>
						<div class="col-md-6 col-lg-6 ">

							</nav>
							<div class="carousel slide" id="myCarousel1">
								<div class="carousel-inner">

									<!-- /Slide1 -->
									<!-- /Slide2 -->

									<div class="item ">
										<ul class="thumbnails">
											<li class="col-md-12">
												<div class="fff">
													<div class="thumbnail">
														<iframe src="https://player.vimeo.com/video/152115588"
															width="100%" height="258" frameborder="0"
															webkitallowfullscreen="" mozallowfullscreen=""
															allowfullscreen=""></iframe>
													</div>
													<div class="img_tiltle">
														<h2>video 2</h2>
													</div>
													<div class="caption">
														<div class="checkbox">
															<label> <input id="login-remember"
																type="checkbox" name="remember" value="1"> Show
																as Public
															</label>
															<div class="suceee_msg">
																<h4>Updated successfully</h4>
															</div>
														</div>
														<div class="delete_box">
															<a href="#"><i class="fa fa-trash-o"
																aria-hidden="true"></i> Delete</a>
															<div class="suceee_msg">
																<h4>Delete Message</h4>
															</div>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<!-- /Slide3 -->
								</div>

								<!-- /.control-box -->

							</div>
							<!-- /#myCarousel -->

						</div>
					</div>

				</div>
				<div class="panel-footer">
					<span> <a href="newsEdit.jsp" onclick="editProfNews()"
						data-original-title="Edit this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
