<!doctype html>
<html>
<head>
<!-- <script type="text/javascript" src="js/event.js"></script> -->
</head>
<body>
    <!----------------------top_header start-------------------------------->
    <jsp:include page="includes.jsp"/> 
    <!----------------------top_header end----------------------------------> 
    <body>
        <!----------------------top_header start---------------------------->
        <jsp:include page="topheader.jsp"/> 
        <!----------------------top_header end------------------------------> 

        <!----------------------header  start------------------------------->
        <jsp:include page="header.jsp"/> 
        <!----------------------header end----------------------------------> 

        <!----------------------menus start--------------------------------->
        <jsp:include page="menu.jsp"/> 
        <!----------------------menus end-----------------------------------> 

        <!----------------------banner start-------------------------------->
        <%-- <jsp:include page="banner.jsp"/>  --%>
        <!----------------------banner end----------------------------------> 
        <head>

<script type="text/javascript">
function eventEditFarmValidation() {
	//alert("==Entered==");
	$("#eventMessage").text("");
	//alert("==1==");
	var eventName = document.getElementById("eventEditEventName");
	var noOfDays = document.getElementById("eventEditNoOfDays");
	var timeFrom = document.getElementById("eventEditTimeFrom");
	var timeEnd = document.getElementById("eventEditTimeEnd");
	var address = document.getElementById("eventEditAddress");
	var place = document.getElementById("eventEditPlace");
	var mandal = document.getElementById("eventEditMandal");
	var moreInfo = document.getElementById("eventEditMoreInfo");
	var district = document.getElementById("eventEditDistrict");
	var landMark = document.getElementById("eventEditLandMark");
	var pincode = document.getElementById("eventEditPincode");
	//alert("==2==");
	if (emptyCheck(eventName, "Event Name", "eventMessage")
			&& minLenCheck(eventName, 5, "Event Name", "eventMessage")
			&& maxLenCheck(eventName, 30, "Event Name", "eventMessage")
			&& allLetter(eventName, "Event Name", "eventMessage")
			&& emptyCheck(noOfDays, "No.of days", "eventMessage")
			&& allNumber(noOfDays, "No.of days", "eventMessage")
			&& minLenCheck(noOfDays, 1, "No.of days", "eventMessage")
			&& maxLenCheck(noOfDays, 3, "No.of days", "eventMessage")
			&& emptyCheck(timeFrom, "Time From", "eventMessage")
			&& minLenCheck(timeFrom, 5, "Time From", "eventMessage")
			&& maxLenCheck(timeFrom, 30, "Time From", "eventMessage")
			&& emptyCheck(timeEnd, "Time End", "eventMessage")
			&& minLenCheck(timeEnd, 5, "Time End", "eventMessage")
			&& maxLenCheck(timeEnd, 30, "Time End", "eventMessage")
			&& emptyCheck(address, "Address", "eventMessage")
			&& minLenCheck(address, 5, "Address", "eventMessage")
			&& maxLenCheck(address, 250, "Address", "eventMessage")
			&& emptyCheck(place, "Place/City", "eventMessage")
			&& allLetter(place, "Place/City", "eventMessage")
			&& minLenCheck(place, 5, "Place/City", "eventMessage")
			&& maxLenCheck(place, 30, "Place/City", "eventMessage")
			&& emptyCheck(mandal, "Mandal", "eventMessage")
			&& allLetter(mandal, "Mandal", "eventMessage")
			&& minLenCheck(mandal, 5, "Mandal", "eventMessage")
			&& maxLenCheck(mandal, 30, "Mandal", "eventMessage")
			&& emptyCheck(moreInfo, "More Info", "eventMessage")
			&& minLenCheck(moreInfo, 5, "More Info", "eventMessage")
			&& maxLenCheck(moreInfo, 30, "More Info", "eventMessage")
			&& emptyCheck(district, "District", "eventMessage")
			&& allLetter(district, "District", "eventMessage")
			&& minLenCheck(district, 5, "District", "eventMessage")
			&& maxLenCheck(district, 30, "District", "eventMessage")
			&& emptyCheck(landMark, "Land Mark", "eventMessage")
			&& minLenCheck(landMark, 5, "Land Mark", "eventMessage")
			&& maxLenCheck(landMark, 30, "Land Mark", "eventMessage")
			&& emptyCheck(pincode, "Pin Code", "eventMessage")
			&& allNumber(pincode, "Pin Code", "eventMessage")
			&& minLenCheck(pincode, 6, "Pin Code", "eventMessage")
			&& maxLenCheck(pincode, 6, "Pin Code", "eventMessage")
			) {

		eventUpdate();
	}

}
$(document).ready(function() {
	//alert("-------in editEvent--Jsp---");
	$.ajax({
		url : "emp/eventService/editEvent",
		success : function(data) {
				$.each(
						data.EditEvent,
						function(key, val) {
							//alert("-------in editEvent--Jsp---eventTitle=="+data.EditEvent[key].timeFrom);
							
						$('#eventId').val(data.EditEvent[key].eventId);	
						$('#eventEditEventName').val(data.EditEvent[key].eventName);
					 	$('#eventEditNoOfDays').val(data.EditEvent[key].noOfDays);
						$('#eventEditTimeFrom').val(data.EditEvent[key].timeFrom);
						$('#eventEditTimeEnd').val(data.EditEvent[key].timeEnd);
						$('#eventEditAddress').val(data.EditEvent[key].address);
						$('#eventEditPlace').val(data.EditEvent[key].place);
						$('#eventEditMandal').val(data.EditEvent[key].mandal);
						$('#eventEditDistrict').val(data.EditEvent[key].district);
						$('#eventEditstate').val(data.EditEvent[key].state);
						$('#eventEditLandMark').val(data.EditEvent[key].landMark);
						$('#eventEditPincode').val(data.EditEvent[key].pinCode);
						//alert("-------in editEvent--Jsp---pincode=="+data.EditEvent[key].pincode);
						$('#eventEditMoreInfo').val(data.EditEvent[key].moreInfo);
						
						
						
						}
				)
				$.each(
											data.EventGuestEdit,
											function(key, val) {
												//alert("memberFarmEditFarmName --------- farmName=="+data.MemberFarmEdit[key].farmState);
												$('#guestEditTitle').val(data.EventGuestEdit[key].title);
												$('#guestEditName').val(data.EventGuestEdit[key].name);
												$('#guestEditDesignation').val(data.EventGuestEdit[key].designation);
												$('#guestEditguestId').val(data.MemberFarmEdit[key].guestId);
												
										})
		}
	});
});
function eventUpdate(){
	//alert(" in to eventUpdate js page----------------");
	var eventId = $("#eventId").val();
	//alert("eventId----------------"+eventId);
	var eventName = $("#eventEditEventName").val();
	var noOfDays =$("#eventEditNoOfDays").val();
	var timeFrom = $("#eventEditTimeFrom").val();
	var timeEnd = $("#eventEditTimeEnd").val();
	var address = $("#eventEditAddress").val();
	var place = $("#eventEditPlace").val();
	var mandal = $("#eventEditMandal").val();
	var moreInfo = $("#eventEditMoreInfo").val();
	var district = $("#eventEditDistrict").val();
	var state = $("#eventEditstate").val();
	var landMark = $("#eventEditLandMark").val();
	var pincode = $("#eventEditPincode").val();
	
	//alert("eventName----------------"+eventName);
	//alert("noOfDays----------------"+noOfDays);
	
	var eventObject = new Object();
	eventObject.eventId = eventId;
	eventObject.eventName = eventName;
	eventObject.noOfDays = noOfDays;
	eventObject.timeFrom = timeFrom;
	eventObject.timeEnd = timeEnd;
	eventObject.address = address;
	eventObject.place = place;
	eventObject.mandal = mandal;
	eventObject.moreInfo = moreInfo;
	eventObject.district = district;
	eventObject.state = state;
	eventObject.landMark = landMark;
	eventObject.pincode = pincode; 
	//alert("eventId----------------"+eventId);
	//alert("pincode----------------"+pincode);
	 $
	.ajax({
		data : eventObject,
		url : "emp/eventService/eventUpdate",
		success : function(data) {
			if (data.Msg = "success") {
				//alert("b4...........");
				window.location.href = "eventList.jsp";
				//alert("a4...........");
			}
			else{
				//alert('in to error');
			}
		}
	}); 
	
}
</script>
</head>
	<!----------------------body_content start-------------------------->
	<div id="aboutus">
		<div class="container">
			<div class="row">
				<div class="aboutus">
					<h2>Event Edit</h2>
					<div class="line3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>

	<div class="container" style="margin-top: 30px;">
		<div class="row">
			<div class="col-md-12">

				<div class="from">
					<!-- <form name="myForm" method="post" id="contact-form"
						class="form-horizontal" action="" onsubmit=""> -->
				<div class="form-group">
					<label for="event_name"><h4>* These fields are required</h4></label>
				</div>
				<div class="col-md-5">
							<div class="form-group">
								<label for="event_name">Event Name*</label> 
								<input type="text" class="form-control" id="eventEditEventName" name="eventEditEventName">
									 <input type="hidden" class="form-control" id="eventId"name="eventId"> 
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="no_of_days">No.of days *</label> <input type="text"
									class="form-control" id="eventEditNoOfDays" name="eventEditNoOfDays">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="time_from">Date & Time From *</label>
								<div class='input-group date' id="eventEditTimeFrom1">
									<input type='text' class="form-control" id="eventEditTimeFrom"
										name="timeFrom" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="time_end">Date & Time End *</label>
								<div class='input-group date' id="eventEditTimeEnd1">
									<input type='text' class="form-control" id="eventEditTimeEnd"
										name="eventEditTimeEnd" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="event_address">Address *</label>
								<textarea class="form-control" rows="5" id="eventEditAddress"
									name="eventEditAddress"></textarea>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="land_mark"> Place/City *</label> <input type="text"
									class="form-control" id="eventEditPlace"
									name="eventEditPlace">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="Place_city">Mandal *</label> <input type="text"
									class="form-control" id="eventEditMandal"
									name=" eventEditMandal">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="more_info">More Info</label>
								<textarea class="form-control" rows="5" id="eventEditMoreInfo"
									name="eventEditMoreInfo"></textarea>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="district">District *</label> <input type="text"
									class="form-control" id="eventEditDistrict"
									name="eventEditDistrict">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="state"> State *</label>
								 <select class="form-control" id = "eventEditstate">
									<option value="Telangana">Telangana</option>
									<option value="AndhraPradesh">AndhraPradesh</option>
								</select>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="state">Land Mark</label> <input type="text"
									class="form-control" id="eventEditLandMark"
									name="eventEditLandMark">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="pin_code">Pin Code</label> <input type="text" class="form-control" id="eventEditPincode" name="eventEditPincode">
							</div>
						</div>
						<div class="col-md-5">
							<div class="upload_img">
							<form method="post" action="emp/commonUtils/upload" enctype="multipart/form-data">
								<div class="form-group">
									<label for="Upload Photo">Upload Event Photos / Videos</label>
									<input id="file"  name ="file" class="file form-control" type="file">
									<a href="#"><button class="btn btn-success btn-sm text-right">Upload</button></a>
								</div>
								</form>
							</div>
						</div>
						<div class="clearfix"></div>

					<!-- </form> -->
				</div>
				<div class="clearfix"></div>
				
				<!----------------------photo_gallery------------------------------>

							<div class="row">
								<div class="modal fade" id="image-gallery" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
									style="display: none;">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">×</span><span class="sr-only">Close</span>
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
												<div class="col-md-8 text-justify"
													id="image-gallery-caption"></div>
												<div class="col-md-2">
													<button type="button" id="show-next-image"
														class="btn btn-default">Next</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-5">
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
									Wrapper for slides
									<div class="carousel-inner">
										<div class="item active left">
											<div class="row">
												<div class="col-md-12">
													<div class="col-item">
														<div class="photo">
															<a class="g-image" href="#" data-image-id="1"
																data-toggle="modal" data-title="" data-caption=""
																data-image="images/g2.jpg" data-target="#image-gallery">
																<img class="img-responsive" src="images/g2.jpg"
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
																	<h4>Delete Message</h4>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="item next left">
											<div class="row">
												<div class="col-md-12">
													<div class="col-item">
														<div class="photo">
															<a class="g-image" href="#" data-image-id="2"
																data-toggle="modal" data-title="" data-caption=""
																data-image="images/g1.jpeg" data-target="#image-gallery">
																<img class="img-responsive" src="images/g1.jpeg"
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
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> 
							<!----------------------photo_gallery end------------------------------>

							<!----------------------video_gallery------------------------------>
							 <div class="col-md-5">
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
									Wrapper for slides
									<div class="carousel-inner">
										<div class="item">
											<div class="row">
												<div class="col-md-12">
													<div class="col-item">
														<div class="photo">
															<iframe src="https://player.vimeo.com/video/73051736"
																width="100%" height="275" frameborder="0"
																webkitallowfullscreen="" mozallowfullscreen=""
																allowfullscreen=""></iframe>
														</div>

														<div class="img_tiltle" style="margin-top: 7px;">
															<h2>Video 1</h2>
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
												</div>
											</div>
										</div>
										<div class="item active">
											<div class="row">
												<div class="col-md-12">
													<div class="col-item">
														<div class="photo">
															<iframe src="https://player.vimeo.com/video/73051736"
																width="100%" height="275" frameborder="0"
																webkitallowfullscreen="" mozallowfullscreen=""
																allowfullscreen=""></iframe>
														</div>
													</div>

													<div class="img_tiltle" style="margin-top: 7px;">
														<h2>Video 1</h2>
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
																<h4>Delete Message</h4>
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
				

				<!------------------------------guests form--------------------------------------->
				<div class="input_fields_wrap">
					<div class="row">
						<div class="col-md-10">
							<div class="member_registration">
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
												<th>Delete</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Mr</td>
												<td>September 14, 2013</td>
												<td>jhlilk22@yahoo.com</td>
												<td><div class="add_button" style="margin-top:0px;">
										<button class="btn btn-primary btn-sm add_field_button">
											<i class="fa fa-minus" aria-hidden="true"></i>
										</button>
									</div></td>
											</tr>
											<tr>
												<td>Mr</td>
												<td>September 14, 2013</td>
												<td>jhlilk22@yahoo.com</td>
												<td><div class="add_button" style="margin-top:0px;">
										<button class="btn btn-primary btn-sm add_field_button">
											<i class="fa fa-minus" aria-hidden="true"></i>
										</button>
									</div></td>
											</tr>
											<tr>
												<td>Mr</td>
												<td>September 14, 2013</td>
												<td>jhlilk22@yahoo.com</td>
												<td><div class="add_button" style="margin-top:0px;">
										<button class="btn btn-primary btn-sm add_field_button">
											<i class="fa fa-minus" aria-hidden="true"></i>
										</button>
									</div></td>
											</tr>
											
										</tbody>
									</table>
								</div>
						</div>
						
					</div>
				</div>
				
				<div class="row">
							<div class="col-md-10">
								<!-- <div class="member_registration" style="margin-left: 0px;">
									<h2>Guests</h2>
								</div> -->
					
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
						
						<div class="row">
						<div class="col-md-10">
							<div class="from">
								<div class="col-md-3">
									<div class="form-group">
										<label for="title">Title</label> 
										<select class="form-control">
											<option selected="selected" id="guestEditTitle"
												name="guestEditTitle">--select--</option>
											<option>Mr</option>
											<option>Ms</option>
											<option>Dr</option>
											<option>Prof</option>
										</select>
										<input type="hidden" class="form-control" id="guestEditguestId"
							name="guestEditguestId">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label for="name">Name</label> <input type="text"
											class="form-control" id="guestEditName" name ="guestEditName">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label for="designation">Designation</label> <input
											type="text" class="form-control" id="guestEditDesignation"
											name="guestEditDesignation">
									</div>
								</div>
								<div class="col-md-2">
									<div class="add_button">
										<button class="btn btn-primary btn-sm add_field_button">
											<i class="fa fa-plus" aria-hidden="true"></i>
										</button>
									</div>

								</div>
							</div>
						</div>
						</div>

				<!------------------------------guests form end--------------------------------------->

				<!-------------------------submit button--------------------------------------->
				<div class="col-md-10">
					<div class="submit_button text-right">
						<a href='#'><button class="btn btn-success btn-sm text-right " onclick="eventEditFarmValidation();">Submit</button></a>
					</div>
					<div class="message" id="eventfrm_message">
						<h3><aside class=" " id="eventMessage" style="display: none">Save Sucessfully</aside></h3>
					</div>
				</div>

				<!-------------------------submit button end--------------------------------------->
				<div class="clearfix"></div>
			</div>
			
			
		</div>
	</div>

<div id="guests_block" style="display:none;">
  <div class="row">
    <div class="col-md-10">
      <div class="from">
        <div class="col-md-3">
          <div class="form-group">
            <label for="title">Title</label>
            <select class="form-control">
              <option selected="selected" id="title" name="title[]">--select--</option>
              <option>Mr</option>
              <option>Ms</option>
              <option>Dr</option>
              <option>Prof</option>
            </select>
          </div>
        </div>
        <div class="col-md-3">
          <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name[]">
          </div>
        </div>
        <div class="col-md-3">
          <div class="form-group">
            <label for="designation">Designation</label>
            <input type="text" class="form-control" id="designation" name="designation[]">
          </div>
        </div>
        <div class="col-md-2">
          <div class="add_button">
            <button class="btn btn-primary btn-sm remove_field"> <i class="fa fa-minus" aria-hidden="true"></i> </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>
</div>
	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	 <jsp:include page="footer.jsp"/>
	 
	 
	<!----------------------footer end --------------------------------->
	<script type="text/javascript">
    $(function () {
	
        $('#eventEditTimeFrom1,#eventEditTimeEnd1').datetimepicker({
			 useCurrent: false
			});

		$('.cross_icon').click(function(){
			alert('asdfasdf')
			$(this).parent().remove()
			});
    });
	
	function addItem(e){
		var html = $('.addOne').html();
		$('#content_block').append(html);
		//$(e).append(html);
		
		
				
	}
</script> 
<script type="text/javascript">
  
  
  $(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
			var html = $('#guests_block').html();
            $(wrapper).append(html); //add input box
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
	
        e.preventDefault(); $(this).closest('div.row').remove(); x--;
    })
});
  
  
  
  
           
        </script> 
</body>
</html>
<jsp:include page="login.jsp" />
