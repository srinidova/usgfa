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
function saveEvent(){
	//alert(" in to js page----------------");
	var eventName = $("#eventName").val();
	var noOfDays =$("#noOfDays").val();
	var timeFrom = $("#timeFrom").val();
	var timeEnd = $("#timeEnd").val();
	var address = $("#address").val();
	var place = $("#place").val();
	var mandal = $("#mandal").val();
	var moreInfo = $("#moreInfo").val();
	var district = $("#district").val();
	var state = $("#state").val();
	var landMark = $("#landMark").val();
	var pincode = $("#pincode").val();
	//alert("eventName----------------"+eventName);
	//alert("noOfDays----------------"+noOfDays);
	
	var eventObject = new Object();
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
	
	
	$
	.ajax({
		data : eventObject,
		url : "emp/eventService/addEvent",
		success : function(data) {
			if (data.Msg = "success") {
				//alert("b4...........");
				//window.location.href = "newsList.jsp";
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
					<h2>Event Form</h2>
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
								<label for="event_name">Event Name</label> <input type="text"
									class="form-control" id="eventName" name="eventName">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="no_of_days">No.of days</label> <input type="text"
									class="form-control" id="noOfDays" name="noOfDays">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="time_from">Time From </label>
								<div class='input-group date' id='timeFrom'>
									<input type='text' class="form-control" id="timeFrom"
										name="timeFrom" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="time_end">Time End </label>
								<div class='input-group date' id='timeEnd'>
									<input type='text' class="form-control" id="timeEnd"
										name="timeEnd" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="event_address">Address</label>
								<textarea class="form-control" rows="5" id="address"
									name="address"></textarea>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="land_mark"> Place/City</label> <input type="text"
									class="form-control" id="place"
									name="place">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="Place_city">Mandal</label> <input type="text"
									class="form-control" id="mandal"
									name=" mandal">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="more_info">More Info</label>
								<textarea class="form-control" rows="5" id="moreInfo"
									name="moreInfo"></textarea>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="district">District</label> <input type="text"
									class="form-control" id="district"
									name="district">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="state"> State</label>
								 <select class="form-control" id = "state">
									<option value="Telangana">Telangana</option>
									<option value="AndhraPradesh">AndhraPradesh</option>
								</select>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="state">Land Mark</label> <input type="text"
									class="form-control" id="landMark"
									name="landMark">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="pin_code">Pin Code</label> <input type="text"
									class="form-control" id="pincode"
									name="pincode">
							</div>
						</div>
						<div class="col-md-5">
							<div class="upload_img">
							<form method="post" action="emp/commonUtils/upload" enctype="multipart/form-data">
								 <div class="form-group col-md-6">
									<label for="Upload Photo">Upload Event Photos / Videos</label>
									<input id="file"  name ="file" class="file form-control" type="file">
									<a href="#"><button class="btn btn-success btn-sm text-right">Upload</button></a>
								</div>
								</form>
							</div>
						</div> 
						<div class="row">
       <!--  <div class="col-md-12">
          <div class="col-md-2">
            <div class="image"> <img src="images/img.png" class="img-responsive img-thumbnail" > </div>
          </div>
          <div class="upload_img">
          <form method="post" action="emp/commonUtils/upload" enctype="multipart/form-data">
            <div class="form-group col-md-6">
              <label for="Upload Photo">Upload Event Photos / Videos</label>
             <input id="file"  name ="file" class="file form-control" type="file">
              <a href="#"><button class="btn btn-success btn-sm text-right">Upload</button></a>
            </div>
            <!-- </form> -->
          </div>
        </div> -->
      </div>
						<div class="clearfix"></div>

					</form>
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
										<label for="title">Title</label> <select class="form-control">
											<option selected="selected" id="guestfrm_title"
												name="title[]">--select--</option>
											<option>Mr</option>
											<option>Ms</option>
											<option>Dr</option>
											<option>Prof</option>
										</select>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label for="name">Name</label> <input type="text"
											class="form-control" id="guestfrm_name">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label for="designation">Designation</label> <input
											type="text" class="form-control" id="guestfrm_designation"
											name="designation">
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
						<a href='eventList.jsp'><button
								class="btn btn-success btn-sm text-right "
								onclick="saveEvent();">Submit</button></a>

					</div>
					<div class="message" id="eventfrm_message">
						<h3>saved sucessfully</h3>
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
