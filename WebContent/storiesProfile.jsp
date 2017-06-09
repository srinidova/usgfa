<!doctype html>
<%
boolean bAdmin = false;
String sRole=(String)session.getAttribute("LOGINROLE"); 
if(sRole != null && sRole.equals("Admin")){
	 bAdmin = true;
} 

%>
<html>
<head>
<script type="text/javascript" src="js/event.js"></script>
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
	<%-- <jsp:include page="banner.jsp"/>  --%>
	<!----------------------banner end---------------------------------->
<head>

<script type="text/javascript">
	var dispImages = "";
	$(document).ready(
					function() {
						$
								.ajax({
									url : "emp/storiesService/getStoriesProfile",
									success : function(data) {
										$
												.each(
														data.StoriesProfile,
														function(key, val) {
															$('#storiesProfName')
																	.text(
																			data.StoriesProfile[key].name);
															$('#storiesProfFarmName')
																	.text(
																			data.StoriesProfile[key].farmName);
															$('#storiesProfState')
																	.text(
																			data.StoriesProfile[key].farmState);
															$('#storiesProfDistrict')
																	.text(
																			data.StoriesProfile[key].district);
															$('#stroiesProfMandal')
																	.text(
																			data.StoriesProfile[key].mandal);
															$('#storiesProfPlace')
															.text(
																	data.StoriesProfile[key].place);
															$('#storiesProfStoriesId')
																	.val(
																			data.StoriesProfile[key].storiesId);
														})
														$.each(
																data.STORIESFILES,
																function(key, val) {
																	dispImages = dispImages
																	+'<div class="item active">'
																	+'<ul class="thumbnails">'
																		+'<li class="col-md-12">'
																			+'<div class="fff">'
																				+'<div class="thumbnail">'
																					+'<a href="#"> '
																					+'<img src="images/5326574-a-sheep-wallpapers.jpg" class="img-responsive" alt="">'
																					+'</a>'
																				+'</div>'
																				+'<div class="img_tiltle">'
																					+'<h2>Image 1</h2>'
																				+'</div>'
																				+'<div class="caption">'
																					+'<div class="checkbox">'
																						+'<label>'
																						+'<input id="login-remember" type="checkbox" name="remember" value="1"> Show as Public'
																						+'</label>'
																						+'<div class="suceee_msg">'
																						+'</div>'
																					+'</div>'
																					+'<div class="delete_box">'
																						+'<a href="#"> <i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
																						+'<div class="suceee_msg">'
																						+'</div>'
																					+'</div>'
																				+'</div>'
																			+'</div>'
																		+'</li>'
																	+'</ul>'
																+'</div>'

																})
									}
								});
					});
	function editProfStories() {
		var storiesId = $("#storiesProfStoriesId").val();
		var storiesObject = new Object();
		storiesObject.storiesId = storiesId;
		$.ajax({
			data : storiesObject,
			url : "emp/storiesService/getStoriesId",
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
				<h2>Stories Profile</h2>
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
					<h3 class="panel-title">Stories Profile</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-10 col-lg-8 col-md-offset-2">
							<table
								class="table table-user-information  table-bordered table-responsive">
								<tbody>
									<tr>
										<td class="text-nowrap"><b>Name:</b></td>
										<td>
											<div id="storiesProfName"></div> <input type="hidden"
											class="form-control" id="storiesProfStoriesId"
											name="storiesProfStoriesId">
										</td>
									</tr>
									<tr>
										<td><b>Farm Name</b></td>
										<td><div id="storiesProfFarmName"></div></td>
									</tr>
									<tr>
										<td><b>State:</b></td>
										<td><div id="storiesProfState"></div></td>
									</tr>
									<tr>
										<td><b>District:</b></td>
										<td><div id="storiesProfDistrict"></div></td>
									</tr>
									<tr>
										<td><b>mandal:</b></td>
										<td><div id="stroiesProfMandal"></div></td>
									</tr>
									<tr>
										<td><b>place:</b></td>
										<td><div id="storiesProfPlace"></div></td>
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
											<li class="col-md-12">
												<div class="fff">
													<div class="thumbnail">
														<a href="#"> <img
															src="images/5326574-a-sheep-wallpapers.jpg"
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
															<div class="suceee_msg"></div>
														</div>
														<div class="delete_box">
															<a href="#"><i class="fa fa-trash-o"
																aria-hidden="true"></i> Delete</a>
															<div class="suceee_msg"></div>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div id="carousel-example" class="carousel slide"
										data-ride="carousel">
										<!-- Wrapper for slides -->
										<div class="carousel-inner" id="storiesImages"></div>
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
																<!--  <h4>Updated successfully</h4> -->
															</div>
														</div>
														<div class="delete_box">
															<a href="#"><i class="fa fa-trash-o"
																aria-hidden="true"></i> Delete</a>
															<div class="suceee_msg">
																<!-- <h4>Delete Message</h4> -->
															</div>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-6 ">
							<nav>
								<ul class="control-box pager" style="width: 98%;">
									<li><a data-slide="prev" href="#myCarousel1" class=""><i
											class="glyphicon glyphicon-chevron-left"></i></a></li>
									<li><a data-slide="next" href="#myCarousel1" class="">
											<i class="glyphicon glyphicon-chevron-right"></i>
									</a></li>
								</ul>
							</nav>
							<div class="carousel slide" id="myCarousel1">
								<div class="carousel-inner">
									<div class="item active">
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
														<h2>video 1</h2>
													</div>
													<div class="caption">
														<div class="checkbox">
															<label> <input id="login-remember"
																type="checkbox" name="remember" value="1"> Show
																as Public
															</label>
															<div class="suceee_msg">
																<!--  <h4>Updated successfully</h4> -->
															</div>
														</div>
														<div class="delete_box">
															<a href="#"><i class="fa fa-trash-o"
																aria-hidden="true"></i> Delete</a>
															<div class="suceee_msg">
																<!-- <h4>Delete Message</h4> -->
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
																<!--  <h4>Updated successfully</h4> -->
															</div>
														</div>
														<div class="delete_box">
															<a href="#"><i class="fa fa-trash-o"
																aria-hidden="true"></i> Delete</a>
															<div class="suceee_msg">
																<!--  <h4>Delete Message</h4> -->
															</div>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>

							</div>

						</div>
					</div>
					<div class="row">
						<div class="col-md-12">


							<div class="card-footer p-0  hidden">
								<nav aria-label="...">
									<ul class="pagination justify-content-end mt-3 mr-3">
										<li class="page-item disabled"><span class="page-link">Previous</span>
										</li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item active"><span class="page-link">2<span
												class="sr-only">(current)</span>
										</span></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">Next</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<%if(bAdmin){ %>
				<div class="panel-footer">
					<span> <a href="storiesEdit.jsp" onClick="editProfStories()"
						data-original-title="Edit this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<%} else{%>
				<div class="panel-footer">
					<span> <a 
						data-original-title="Edit this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<%}%>
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
