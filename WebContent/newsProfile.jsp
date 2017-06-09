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

<script type="text/javascript">
var dispImages = '';
	$(document)
			.ready(
					function() {
						$
								.ajax({
									url : "emp/newsService/getNewsProfile",
									success : function(data) {
										$
												.each(
														data.NewsProfile,
														function(key, val) {
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
																	dispImages = dispImages
																	+'<div class="item next left">'
																	+'<div class="row">'
																		+'<div class="col-md-12">'
																			+'<div class="col-item">'
																				+'<div class="photo">'
																					+'<a class="g-image" href="#" data-image-id="2" data-toggle="modal" data-title="" data-caption="" data-image="'+data.NEWSFILES[key].filePath+'" data-target="#image-gallery">'
																						+'<img class="img-responsive" src="'+data.NEWSFILES[key].filePath+'" alt="Short alt text">'
																					+'</a>'
																				+'</div>'
																				+'<div class="img_tiltle" style="margin-top: 7px;">'
																					+'<h2>Image 222</h2>'
																				+'</div>'
																				+'<div class="caption" style="margin-top: 0px;">'
																					+'<div class="checkbox">'
																						+'<label>'
																							+'<a href="#" onclick="updateShowAsPublic();">'
																								+'<input id="login-remember" type="checkbox" name="remember" value="1"> Show as Public'
																							+'</a>'
																						+'</label>'
																						+'<div class="suceee_msg">'
																							+'<!-- <h4>Updated successfully</h4> -->'
																						+'</div>'
																					+'</div>'
																					+'<div class="delete_box">'
																						+'<a href="#" onclick="deleteFile();"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
																						+'<div class="suceee_msg">'
																							+'<!-- <h4>Delete Message</h4> -->'
																						+'</div>'
																					+'</div>'
																				+'</div>'
																			+'</div>'
																		+'</div>'
																	+'</div>'
																+'</div>'
																})
																document.getElementById("newsImages").innerHTML = dispImages;
									}
								});
						

					});
	function editProfNews() {
		var newsId = $("#newsProfNewsId").val();
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
	function updateShowAsPublic(fileId){
		var uploadFileObject = new Object();
		uploadFileObject.fileId = "7ec737d4-d179-4620-9c8e-3450ccd7ffdf"; 
		uploadFileObject.showAsPublic = "0";
		$.ajax({
			data : uploadFileObject,
			url : "emp/uploadService/updateShowAsPublic",
			success : function(data) {
				if (data.Msg = "success") {
				}
			}
		});
	}
	function deleteFile(fileId){
		var newsObject = new Object();
		newsObject.newsId = "677b75af6f6143f38ad7b3045d15821a"; 
		$.ajax({
			data : newsObject,
			url : "emp/uploadService/deleteImage",
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
					<!----------------------photo_gallery------------------------------>

					<div class="row">
						<div class="modal fade" id="image-gallery" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
							style="display: none;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">�</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="image-gallery-title"></h4>
									</div>
									<div class="modal-body">
										<img id="image-gallery-image" class="img-responsive"
											src="images/g2.jpg">
									</div>
									<div class="modal-footer">
										<div class="col-md-2">
											<button type="button" class="btn btn-primary"
												id="show-previous-image" style="display: none;">Previous</button>
										</div>
										<div class="col-md-8 text-justify" id="image-gallery-caption"></div>
										<div class="col-md-2">
											<button type="button" id="show-next-image"
												class="btn btn-default">Next</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="row">

							<div class="col-md-12" style="margin-bottom: 10px;">
								<!-- Controls -->
								<div class="controls pull-right ">
									<a class="left fa fa-angle-left btn btn-default button-arrow"
										href="#carousel-example" data-slide="prev"></a> <a
										class="right fa fa-angle-right btn btn-default button-arrow"
										href="#carousel-example" data-slide="next"></a>
								</div>
							</div>
						</div>
						<div id="carousel-example" class="carousel slide"
							data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner" id="newsImages">
								
							</div>
						</div>
					</div>
					<!----------------------photo_gallery end------------------------------>

                    <!----------------------video_gallery------------------------------>
					<div class="col-md-6">
						<div class="row">

							<div class="col-md-12 " style="margin-bottom: 10px;">
								<!-- Controls -->
								<div class="controls pull-right">
									<a class="left fa fa-angle-left btn btn-default button-arrow"
										href="#carousel-example1" data-slide="prev"></a> <a
										class="right fa fa-angle-right btn btn-default button-arrow"
										href="#carousel-example1" data-slide="next"></a>
								</div>
							</div>
						</div>
						<div id="carousel-example1" class="carousel slide "
							data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item">
									<div class="row">
										<div class="col-sm-12">
											<div class="col-item">
												<div class="photo">
													<iframe src="https://player.vimeo.com/video/73051736"
														width="100%" height="347" frameborder="0"
														webkitallowfullscreen="" mozallowfullscreen=""
														allowfullscreen=""></iframe>
												</div>

												<div class="img_tiltle" style="margin-top: 7px;">
													<h2>Video 1</h2>
												</div>

												<div class="caption" style="margin-top: 0px;">
													<div class="checkbox">
														<label> <input id="login-remember" type="checkbox"
															name="remember" value="1"> Show as Public
														</label>
														<div class="suceee_msg">
															<!-- <h4>Updated successfully</h4> -->
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
										</div>
									</div>
								</div>
								<div class="item active">
									<div class="row">
										<div class="col-md-12">
											<div class="col-item">
												<div class="photo">
													<iframe src="https://player.vimeo.com/video/73051736"
														width="100%" height="347" frameborder="0"
														webkitallowfullscreen="" mozallowfullscreen=""
														allowfullscreen=""></iframe>
												</div>
											</div>

											<div class="img_tiltle" style="margin-top: 7px;">
												<h2>Video 1</h2>
											</div>

											<div class="caption" style="margin-top: 0px;">
												<div class="checkbox">
													<label> <input id="login-remember" type="checkbox"
														name="remember" value="1"> Show as Public
													</label>
													<div class="suceee_msg">
														<!-- <h4>Updated successfully</h4> -->
													</div>
												</div>
												<div class="delete_box">
													<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>
														Delete</a>
													<div class="suceee_msg">
														<!-- <h4>Delete Message</h4> -->
													</div>
												</div>
											</div>




										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!----------------------video_gallery end------------------------------>

				</div>
				<%if(bAdmin){ %>
				<div class="panel-footer">
					<span> <a href="newsEdit.jsp" onclick="editProfNews()"
						data-original-title="Edit this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<%}else {%>
				<div class="panel-footer">
					<span> <a data-original-title="Edit this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<% }%>
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
