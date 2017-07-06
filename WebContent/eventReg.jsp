<!doctype html>
<html>
<head>
<script type="text/javascript">
function eventFarmValidation() {
	
	var eventName = document.getElementById("eventName");
	var noOfDays = document.getElementById("noOfDays");
	var timeFrom = document.getElementById("timeFrom");
	var timeEnd = document.getElementById("timeEnd");
	var address = document.getElementById("address");
	var place = document.getElementById("place");
	var mandal = document.getElementById("mandal");
	var moreInfo = document.getElementById("moreInfo");
	var district = document.getElementById("district");
	var landMark = document.getElementById("landMark");
	var pincode = document.getElementById("pincode");
	var msg = "";
	var title = "";
	$("#eventRegFailMsg").text("");
	if (eventName.value.length == 0) {
		msg = "errEventName";
		title = "Event Name ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		eventName.focus();
		return false;
	}else if (noOfDays.value.length == 0) {
		msg = "errNoofdays";
		title = "No.of days";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		noOfDays.focus();
		return false;
	} else if (timeFrom.value.length == 0) {
		msg = "errTimeFrom";
		title = "Date & Time From";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		timeFrom.focus();
		return false;
	}else if (timeEnd.value.length == 0) {
		msg = "errTimeEnd";
		title = "Date & Time From";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		timeEnd.focus();
		return false;
	}else if (address.value.length == 0) {
		msg = "errAddress";
		title = "Address";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		address.focus();
		return false;
	}else if (place.value.length == 0) {
		msg = "errPlace";
		title = "Place";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		place.focus();
		return false;
	}else if (mandal.value.length == 0) {
		msg = "errMandal";
		title = "Mandal";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		mandal.focus();
		return false;
	}else if (district.value.length == 0) {
		msg = "errDistrict";
		title = "District";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		district.focus();
		return false;
	}else if (pincode.value.length > 0 && pincode.value.length != 6) {
		msg = "errEveRegPinCode";
		title = "Pin Code";

		$("#" + msg).text(title + " must have six numbers");
		$("#" + msg).show();
		pincode.focus();
		return false;
	} else {
		$("#errEventName").text("");
		$("#errTimeFrom").text("");
		$("#errTimeEnd").text("");
		$("#errAddress").text("");
		$("#errPlace").text("");
		$("#errMandal").text("");
		$("#errMoreInfo").text("");
		$("#errDistrict").text("");
		$("#errLandMark").text("");
		$("#errEveRegPinCode").text("");
		saveEvent();
	}

}
function saveEvent(){
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
	 var title = $("#title").val();
	 var name = $("#name").val();
	 var designation = $("#designation").val();
	 var file = $("#file")[0].files[0];
	 
		var elmsGstTitle = document.querySelectorAll("[id='guestTitle']")
		var elmsGstName = document.querySelectorAll("[id='guestName']")
		var elmsGstDesi = document.querySelectorAll("[id='guestDesi']")
		//alert("------elmsGstTitle length-----------"+elmsGstTitle.length+"------elmsGstName length-----------"+elmsGstName.length+"------elmsGstDesi length-----------"+elmsGstDesi.length);
		var guestTitle = "";
		var guestName = "";
		var guestDesi = "";
		for (var i = 0; i < elmsGstName.length - 1; i++) {
			if (guestTitle.length > 0)
				guestTitle = guestTitle + "~" + elmsGstTitle[i].value;
			else
				guestTitle = guestTitle + elmsGstTitle[i].value;

			if (guestName.length > 0)
				guestName = guestName + "~" + elmsGstName[i].value;
			else
				guestName = guestName + elmsGstName[i].value;

			if (guestDesi.length > 0)
				guestDesi = guestDesi + "~" + elmsGstDesi[i].value;
			else
				guestDesi = guestDesi + elmsGstDesi[i].value;

		}
		
		var formData = new FormData();
		formData.append("eventName", eventName);
		formData.append("noOfDays", noOfDays);
		formData.append("timeFrom", timeFrom);
		formData.append("timeEnd", timeEnd);
		formData.append("address", address);
		formData.append("place", place);
		formData.append("mandal", mandal);
		formData.append("moreInfo", moreInfo);
		formData.append("district", district);
		formData.append("state", state);
		formData.append("landMark", landMark);
		formData.append("pincode", pincode);
		formData.append("file", file);
		
		formData.append("guestTitle", guestTitle);
		formData.append("guestName", guestName);
		formData.append("guestDesi", guestDesi);
		

		$.ajax({
			type: 'POST',
			url : "emp/eventService/addEvent",
        	data: formData,
        	cache: false,
        	contentType: false,
        	processData: false,
			success : function(data) {
				if (data.Msg == 'success') {
					window.location.href = "eventList.jsp";
				}else{
					$("#eventRegFailMsg").text("Event Registration Failed");
				}  
			}
		});
}

function pincodeCheck(fName, title, msg) {
	var fieldName = document.getElementById(fName);
	var number = /^[0-9]+$/;
	if (!fieldName.value.match(number)) {			
		$("#" + msg).text(title + " must have numbers only");
		$("#" + msg).show();
		fieldName.focus();
		return false;
	}else if(fieldName.value.length != 6){
		$("#" + msg).text(title + " must have six numbers");
		$("#" + msg).show();
		fieldName.focus();
		return false;
	} else {
		$("#" + msg).text("");
		return true;
	}
}

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
	<%-- <jsp:include page="banner.jsp"/>  --%>
	<!----------------------banner end---------------------------------->
<head>

</head>
<!----------------------body_content start-------------------------->
<div id="aboutus">
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>Event New</h2>
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
					<label for="event_name"><h4>* These fields are
							required</h4></label>
				</div>

				<div class="col-md-5">
					<div class="form-group">
						<label for="event_name">Event Name *</label> <span class="errMsg" id="errEventName"></span>
						<input type="text" pattern="^[_A-z0-9]{1,}$" class="form-control" id="eventName"
							name="eventName" maxlength="30" onkeyup="validateTitle(id,'Event Name','errEventName',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="no_of_days">No.of days *</label> <span class="errMsg" id="errNoofdays"></span>
						<input type="text" class="form-control" id="noOfDays" name="noOfDays" maxlength="3"
						onkeyup="allNumber(id,'No.of days','errNoofdays');">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="time_from">Date & Time From *</label> <span class="errMsg" id="errTimeFrom"></span>
						<div class='input-group date' id="eventTimeFrom">
							<input type='text' class="form-control" id="timeFrom"
								name="timeFrom" maxlength="30" onkeyup="validateTitle(id,'Date & Time From','errTimeFrom',5,30);"/> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="time_end">Date & Time End *</label> <span class="errMsg" id="errTimeEnd"></span>
						<div class='input-group date' id="eventTimeEnd">
							<input type='text' class="form-control" id="timeEnd" name="timeEnd" maxlength="30"
							onkeyup="validateTitle(id,'Date & Time End','errTimeEnd',5,30);"/> 
								<span class="input-group-addon"> 
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="event_address">Address *</label> <span class="errMsg" id="errAddress"></span>
						<textarea class="form-control" rows="5" id="address"
							name="address" maxlength="250" onkeyup="emptyCheck(id,'Address','errAddress');"></textarea>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark"> Place/City *</label> <span class="errMsg" id="errPlace"></span> 
						<input type="text" class="form-control" id="place" name="place" maxlength="30" 
						onkeyup="validateTitle(id,'Place/City','errPlace',5,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="Place_city">Mandal *</label> <span class="errMsg" id="errMandal"></span> 
						<input type="text"
							class="form-control" id="mandal" name=" mandal" maxlength="30" onkeyup="validateTitle(id,'Mandal','errMandal',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="more_info">More Info</label> <span class="errMsg" id="errMoreInfo"></span> 
						<textarea class="form-control" rows="5" id="moreInfo" name="moreInfo" maxlength="250">
						</textarea>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="district">District *</label> <span class="errMsg" id="errDistrict"></span> 
						<input type="text" class="form-control" id="district" name="district" maxlength="30"
						 onkeyup="validateTitle(id,'District','errDistrict',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="state"> State</label> <select class="form-control"
							id="state">
							<option value="Telangana">Telangana</option>
							<option value="AndhraPradesh">AndhraPradesh</option>
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="state">Land Mark</label> <span class="errMsg" id="errLandMark"></span> 
						<input type="text" class="form-control" id="landMark" name="landMark" maxlength="250">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="pin_code">Pin Code </label> <span class="errMsg" id="errEveRegPinCode"></span> 
						<input type="text" class="form-control" id="pincode" name="pincode" maxlength="6" 
						onkeyup="pincodeCheck(id,'Pin Code','errEveRegPinCode');">
					</div>
				</div>
				<div class="col-md-5">
					<div class="upload_img">
						<form method="post" action="emp/commonUtils/upload"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="Upload Photo">Upload Event Photos / Videos</label> <input
									id="file" name="file" class="file form-control" type="file">
								<!-- <a href="#"><button
										class="btn btn-success btn-sm text-right">Upload</button></a> -->
							</div>
						</form>
					</div>
				</div>
				<!-- <div class="row"></div> -->
			</div>

		</div>
		<!-- <div class="clearfix"></div> -->

		<!-- </form> -->
	</div>
	<div class="clearfix"></div>

	<!------------------------------guests form--------------------------------------->
	<div class="input_fields_wrap">
		<div class="row">
			<div class="col-md-10">
				<div class="guest_registration">
					<h2>Guests</h2>
				</div>
			</div>
			<div class="col-md-12">
				<div class="from">
					<div class="col-md-3">
						<div class="form-group">
							<label for="title">Title</label> 
							<select class="form-control" id="guestTitle" name="guestTitle">
								<option value="Mr">Mr</option>
								<option value="Ms">Ms</option>
								<option value="Dr">Dr</option>
								<option value="Prof">Prof</option>
							</select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="name">Name</label> <input type="text" maxlength="30"
								class="form-control" id="guestName" name="guestName">
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="designation">Designation</label> <input type="text" maxlength="30"
								class="form-control" id="guestDesi" name="guestDesi">
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
			<a href='#'><button class="btn btn-success btn-sm text-right "
					onclick="eventFarmValidation();">Submit</button></a>

		</div>
		<div class="message" id="eventfrm_message">
			<h3>
				<aside class="formFailMsg" id="eventRegFailMsg"></aside>
			</h3>
		</div>

	</div>

	<!-------------------------submit button end--------------------------------------->
	<div class="clearfix"></div>
	<div id="guests_block" style="display: none;">
		<div class="row">
			<div class="col-md-12">
				<div class="from">
					<div class="col-md-3">
						<div class="form-group">
							<label for="title">Title</label> <select class="form-control" id="guestTitle" name="guestTitle">
								<option value="Mr">Mr</option>
								<option value="Ms">Ms</option>
								<option value="Dr">Dr</option>
								<option value="Prof">Prof</option>
							</select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="name">Name</label> <input type="text"
								class="form-control" id="guestName" name="guestName">
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="designation">Designation</label> <input type="text"
								class="form-control" id="guestDesi" name="guestDesi">
						</div>
					</div>
					<div class="col-md-2">
						<div class="add_button">
							<button class="btn btn-primary btn-sm remove_field">
								<i class="fa fa-minus" aria-hidden="true"></i>
							</button>
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
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
<script type="text/javascript">
    $(function () {
	
        $('#eventTimeFrom,#eventTimeEnd').datetimepicker({
			 useCurrent: false,
			 format: 'DD/MM/YYYY LT'
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
	  $("#moreInfo").val("");
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
