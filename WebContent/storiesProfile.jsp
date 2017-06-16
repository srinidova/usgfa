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
	/* var dispImages = "";
	var dispClas = ""; */
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
														showStoriesProfImages(data);
														/* $.each(
																data.STORIESFILES,
																function(key, val) {
																	if(key == 0){
																		dispClas = "item active";
																	}else{
																		dispClas = "item";
																	}
																	dispImages = dispImages
																	+'<div class="'+ dispClas +'">'
																	+'<ul class="thumbnails">'
																		+'<li class="col-md-12">'
																			+'<div class="fff">'
																				+'<div class="thumbnail">'
																					+'<a href="#">'
																					     +'<img src="'+data.STORIESFILES[key].filePath+'" class="img-responsive" alt="">'
																					+'</a>'
																				+'</div>'
																				+'<div class="caption">'
																					+'<div class="checkbox">'
																						+'<label>'
																						    +'<input id="login-remember" type="checkbox" name="remember" value="1"> Show as Public'
																						+'</label>'
																						+'<div class="suceee_msg"></div>'
																					+'</div>'
																					+'<div class="delete_box">'
																						+'<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
																						+'<div class="suceee_msg"></div>'
																					+'</div>'
																				+'</div>'
																			+'</div>'
																		+'</li>'
																	+'</ul>'
																+'</div>'
																}) */
																//document.getElementById("storiesImages").innerHTML = dispImages;
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
	function showStoriesProfImages(data){
		var dispImages = '';
		var dispClas = '';
		var dispChkd = '';
		$.each(
				data.STORIESFILES,
				function(key, val) {
					alert(data.STORIESFILES[key].showPublic);
					if(data.STORIESFILES[key].showPublic == 1){
						dispChkd = 'checked';
					}else{
						dispChkd = '';
					}
					if(key == 0){
						dispClas = "item active";
					}else{
						dispClas = "item";
					}
					dispImages = dispImages
					+'<div class="'+ dispClas +'">'
					+'<ul class="thumbnails">'
						+'<li class="col-md-12">'
							+'<div class="fff">'
								+'<div class="thumbnail">'
									+'<a href="#">'
									     +'<img src="'+data.STORIESFILES[key].filePath+'" class="img-responsive" alt="">'
									+'</a>'
								+'</div>'
								+'<div class="caption">'
									+'<div class="checkbox">'
										+'<label>'
										    +'<input id="'+data.STORIESFILES[key].fileId+'" onclick="updateShowAsPublicNews(this.id);" type="checkbox" value="'+data.STORIESFILES[key].fileId+'" name="remember"  '+ dispChkd +'> Show as Public'
										+'</label>'
										+'<div class="suceee_msg"></div>'
									+'</div>'
									+'<div class="delete_box">'
										+'<a href="#" name="'+data.STORIESFILES[key].fileId+'" onclick="deleteFileNews(this.name);"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
										+'<div class="suceee_msg"></div>'
									+'</div>'
								+'</div>'
							+'</div>'
						+'</li>'
					+'</ul>'
				+'</div>'
				})
				document.getElementById("storiesProfImages").innerHTML = dispImages;
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
									<div class="modal-body">
										<img id="image-gallery-image" class="img-responsive" src="">
									</div>
									<div class="modal-footer">
										<div class="col-md-2">
											<button type="button" class="btn btn-primary"
												id="show-previous-image">Previous</button>
										</div>
										<div class="col-md-8 text-justify" id="image-gallery-caption">
											This text will be overwritten by jQuery</div>
										<div class="col-md-2">
											<button type="button" id="show-next-image"
												class="btn btn-default">Next</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="margin-left: 250px;">


							<div class="control-box pager ">
								<a class="left fa fa-angle-left btn btn-default button-arrow"
									href="#myCarousel" data-slide="prev"></a> <a
									class="right fa fa-angle-right btn btn-default button-arrow"
									href="#myCarousel" data-slide="next"></a>
							</div>

							<div class="carousel slide" id="myCarousel">
								<div class="carousel-inner" id="storiesProfImages">
								</div>

								<!-- /.control-box -->

							</div>
							<!-- /#myCarousel -->

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
