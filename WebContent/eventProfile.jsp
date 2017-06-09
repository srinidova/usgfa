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
<script type="text/javascript">
	var evenData = '${sessionScope.sessEvent}';
	$(document).ready(function() {
		showEventData(evenData);
	});
</script>
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
	<%--  <jsp:include page="banner.jsp"/>  --%>
	<!----------------------banner end---------------------------------->
<head>

<script type="text/javascript">
$(document)
.ready(
		function() {
			var html = '';
			$
					.ajax({
						url : "emp/eventService/getEventProfile",
						success : function(data) {
							$
									.each(
											data.EventProfile,
											function(key, val) {
											    $('#eventProfEventName').text(data.EventProfile[key].eventName);
												 
												$('#eventProfNoOfDays').text(data.EventProfile[key].noOfDays); 
												$('#eventProfDateTimeFrom ').text(data.EventProfile[key].timeFrom);
												$('#eventProfDateTimeEnd').text(data.EventProfile[key].timeEnd);
												$('#eventProfAddress').text(data.EventProfile[key].address);
												$('#eventProfMoreInfo').text(data.EventProfile[key].moreInfo);
												$('#eventProfEventId').val(data.EventProfile[key].eventId); 
											})
											$.each(
													data.EVENTFILES,
													function(key, val) {
														html = html
														+'<li>'
														+'<div class="fff">'
															+'<div class="photo">'
																+'<a class="g-image" href="#" data-image-id="" data-toggle="modal" data-title="" data-caption="" data-image="images/g1.jpeg" data-target="#image-gallery"> <img class="img-responsive" src="images/g1.jpeg" alt="Short alt text"> </a>'
															+'</div>'
															+'<div class="img_tiltle" style="margin-top: 7px;">'
																+'<h2>Image 1</h2>'
															+'</div>'
															+'<div class="caption" style="margin-top: 0px;">'
																+'<div class="checkbox"> <label> <input id="login-remember" type="checkbox" name="remember" value="1"> Show as Public </label>'
																	+'<div class="suceee_msg">'
																		+'/* <h4>Updated successfully</h4> */'
																	+'</div>'
																+'</div>'
																+'<div class="delete_box"> <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
																	+'<div class="suceee_msg">'
																		+'/* <h4>Delete Message</h4> */'
																	+'</div>'
																+'</div>'
															+'</div>'
														+'</div>'
														+'</li>'

													})
													$(html).appendTo("#eventImages");
						}
					});
		});
function editProfEvent() {
	var eventId = $("#eventProfEventId").val();
	var eventObject = new Object();
	eventObject.eventId = eventId;
	$.ajax({
		data : eventObject,
		url : "emp/eventService/getEventId",
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
				<h2>Event Profile</h2>
				<div class="line3"></div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>

<div class="container" style="margin-top: 20px;">
	<div class="row">
		<div class=" col-md-12 ">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">Event Form Profile</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-10 col-lg-8 col-md-offset-2">
							<table
								class="table table-user-information  table-bordered table-responsive">
								<tbody>
									<tr>
										<td class="text-nowrap"><b>Event Name:</b></td>
										<td><div id="eventProfEventName"></div> <input
											type="hidden" class="form-control" id="eventProfEventId"
											name="eventProfEventId"></td>
									</tr>
									<tr>
										<td><b>No.of days</b></td>
										<td><div id="eventProfNoOfDays"></div></td>
									</tr>
									<tr>
										<td><b>Time From:</b></td>
										<td><div id="eventProfDateTimeFrom"></div></td>
									</tr>
									<tr>
										<td><b>Time End:</b></td>
										<td><div id="eventProfDateTimeEnd"></div></td>
									</tr>
									<tr>
										<td><b>Address:</b></td>
										<td><div id="eventProfAddress"></div> <!-- <span id="eventProf_address"></span>, <span id="eventProf_place"></span></br> 
												<span id="eventProf_landMark"></span></br>
												<span id="eventProf_mandal"></span>, <span id="eventProf_district"></span></br>
												<span id="eventProf_state""></span> - <span id="eventProf_pincode"></span> -->
										</td>
									</tr>
									<tr>
										<td><b>More Info:</b></td>
										<td><div id="eventProfMoreInfo"></div></td>
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
						<div class="col-md-6">


							<div class="control-box pager ">
								<a class="left fa fa-angle-left btn btn-default button-arrow"
									href="#myCarousel" data-slide="prev"></a> <a
									class="right fa fa-angle-right btn btn-default button-arrow"
									href="#myCarousel" data-slide="next"></a>
							</div>

							<div class="carousel slide" id="myCarousel">
								<div class="carousel-inner">
									<div class="item active">
										<ul style="padding-left: 0px;">
											<div id="programImages"></div>
											<li>
												<div class="fff">
													<div class="photo">
														<a class="g-image" href="#" data-image-id=""
															data-toggle="modal" data-title="" data-caption=""
															data-image="images/g1.jpeg" data-target="#image-gallery">
															<img class="img-responsive" src="images/g1.jpeg"
															alt="Short alt text">
														</a>
													</div>
													<div class="img_tiltle" style="margin-top: 7px;">
														<h2>Image 1</h2>
													</div>
													<div class="caption" style="margin-top: 0px;">
														<div class="checkbox">
															<label> <input id="login-remember"
																type="checkbox" name="remember" value="1"> Show
																as Public
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
											</li>
										</ul>
									</div>
									<div class="item ">
										<ul style="padding-left: 0px;">
											<li>
												<div class="fff">
													<div class="photo">
														<a class="g-image" href="#" data-image-id=""
															data-toggle="modal" data-title="" data-caption=""
															data-image="images/g2.jpg" data-target="#image-gallery">
															<img class="img-responsive" src="images/g2.jpg"
															alt="Short alt text">
														</a>
													</div>
													<div class="img_tiltle" style="margin-top: 7px;">
														<h2>Image 2</h2>
													</div>
													<div class="caption" style="margin-top: 0px;">
														<div class="checkbox">
															<label> <input id="login-remember"
																type="checkbox" name="remember" value="1"> Show
																as Public
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
							<div class="control-box pager ">
								<a class="left fa fa-angle-left btn btn-default button-arrow"
									href="#myCarousel1" data-slide="prev"></a> <a
									class="right fa fa-angle-right btn btn-default button-arrow"
									href="#myCarousel1" data-slide="next"></a>
							</div>
							<div class="carousel slide" id="myCarousel1">
								<div class="carousel-inner">
									<div class="item active">
										<ul style="padding-left: 0px;">
											<li>
												<div class="fff">
													<div class="">
														<iframe src="https://player.vimeo.com/video/152115588"
															width="100%" height="339" frameborder="0"
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
											</li>
										</ul>
									</div>
									<!-- /Slide1 -->
									<!-- /Slide2 -->

									<div class="item ">
										<ul style="padding-left: 0px;">
											<li>
												<div class="fff">
													<div class="">
														<iframe src="https://player.vimeo.com/video/152115588"
															width="100%" height="339" frameborder="0"
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
					<div class="row">
						<div class="col-md-12">
							<div class="member_registration" style="margin-left: 0px;">
								<h2>Guests</h2>
							</div>
							<div class="card-block p-0"
								style="overflow-y: scroll; height: 250px; width: 100%;">
								<table class="table table-bordered table-responsive ">
									<thead class="">
										<tr>
											<th>Title</th>
											<th>Name</th>
											<th>Designation</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Mr</td>
											<td>September 14, 2013</td>
											<td>jhlilk22@yahoo.com</td>
										</tr>
										<tr>
											<td>Mr</td>
											<td>September 14, 2013</td>
											<td>jhlilk22@yahoo.com</td>
										</tr>
										<tr>
											<td>Mr</td>
											<td>September 14, 2013</td>
											<td>jhlilk22@yahoo.com</td>
										</tr>
										<tr>
											<td>Mr</td>
											<td>September 14, 2013</td>
											<td>jhlilk22@yahoo.com</td>
										</tr>
										<tr>
											<td>Mr</td>
											<td>September 14, 2013</td>
											<td>jhlilk22@yahoo.com</td>
										</tr>
										<tr>
											<td>Mr</td>
											<td>September 14, 2013</td>
											<td>jhlilk22@yahoo.com</td>
										</tr>
										<tr>
											<td>Mr</td>
											<td>September 14, 2013</td>
											<td>jhlilk22@yahoo.com</td>
										</tr>
										<tr>
											<td>Mr</td>
											<td>September 14, 2013</td>
											<td>jhlilk22@yahoo.com</td>
										</tr>
										<tr>
											<td>Mr</td>
											<td>September 14, 2013</td>
											<td>jhlilk22@yahoo.com</td>
										</tr>
									</tbody>
								</table>
							</div>
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
					<span> <a href="eventEdit.jsp" onClick="editProfEvent()"
						data-original-title="Edit this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<%} else{%>
				<div class="panel-footer">
					<span> <a data-original-title="Edit this user" data-toggle="tooltip"
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
