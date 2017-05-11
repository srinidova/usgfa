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
			&& maxLenCheck(eventName, 10, "Event Name", "eventMessage")
			&& allLetter(eventName, "Event Name", "eventMessage")
			&& emptyCheck(noOfDays, "No.of days", "eventMessage")
			&& emptyCheck(timeFrom, "Time From", "eventMessage")
			&& emptyCheck(timeEnd, "Time End", "eventMessage")
			&& emptyCheck(address, "Address", "eventMessage")
			&& emptyCheck(place, "Place/City", "eventMessage")
			&& emptyCheck(mandal, "Mandal", "eventMessage")
			&& emptyCheck(moreInfo, "More Info", "eventMessage")
			&& emptyCheck(district, "District", "eventMessage")
			&& emptyCheck(landMark, "Land Mark", "eventMessage")
			&& emptyCheck(pincode, "Pin Code", "eventMessage")
			&& minLenCheck(pincode, 6, "Pin Code", "eventMessage")
			&& maxLenCheck(pincode, 6, "Pin Code", "eventMessage")
			&& allNumber(pincode, 6, "Pin Code", "eventMessage")
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
						$('#eventEditPincode').val(data.EditEvent[key].pincode);
						alert("-------in editEvent--Jsp---pincode=="+data.EditEvent[key].pincode);
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
	alert("pincode----------------"+pincode);
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
				alert('in to error');
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
						<div class="col-md-5">
							<div class="form-group">
								<label for="event_name">Event Name</label> 
								<input type="text" class="form-control" id="eventEditEventName" name="eventEditEventName">
									 <input type="hidden" class="form-control" id="eventId"name="eventId"> 
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="no_of_days">No.of days</label> <input type="text"
									class="form-control" id="eventEditNoOfDays" name="eventEditNoOfDays">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="time_from">Time From </label>
								<div class='input-group date' id='TimeFrom'>
									<input type='text' class="form-control" id="eventEditTimeFrom"
										name="timeFrom" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="time_end">Time End </label>
								<div class='input-group date' id='TimeEnd'>
									<input type='text' class="form-control" id="eventEditTimeEnd"
										name="eventEditTimeEnd" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="event_address">Address</label>
								<textarea class="form-control" rows="5" id="eventEditAddress"
									name="eventEditAddress"></textarea>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="land_mark"> Place/City</label> <input type="text"
									class="form-control" id="eventEditPlace"
									name="eventEditPlace">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="Place_city">Mandal</label> <input type="text"
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
								<label for="district">District</label> <input type="text"
									class="form-control" id="eventEditDistrict"
									name="eventEditDistrict">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="state"> State</label>
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

				<!------------------------------guests form--------------------------------------->
				<div class="input_fields_wrap">
					<div class="row">
						<div class="col-md-10">
							<div class="member_registration">
								<h2>Guests</h2>
							</div>
						</div>
						<div class="col-md-12">
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
	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	 <jsp:include page="footer.jsp"/>
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
