<!doctype html>
<html>
<head>
<!-- <script type="text/javascript" src="js/event.js"></script> -->
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
function eventEditFarmValidation() {
	$("#eventMessage").text("");
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
	var msg = "";
	var title = "";
	$("#eventEditFailMsg").text("");
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
	}else if (timeFrom.value.length == 0) {
		msg = "errEditTimeFrom";
		title = "Date & Time From ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		timeFrom.focus();
		return false;
	}else if (timeEnd.value.length == 0) {
		msg = "errEditTimeEnd";
		title = "Date & Time End ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		timeEnd.focus();
		return false;
	}else if (address.value.length == 0) {
		msg = "errEditAddress";
		title = "Address  ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		address.focus();
		return false;
	}else if (place.value.length == 0) {
		msg = "errEditPlace";
		title = "Place/City   ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		place.focus();
		return false;
	}else if (mandal.value.length == 0) {
		msg = "errEditMandal";
		title = "Mandal ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		mandal.focus();
		return false;
	}else if(district.value.length == 0){
		
		msg = "errEditDistrict";
		title = "District";
		
		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		district.focus();
		return false;
	}else if(pincode.value.length > 0 && pincode.value.length != 6){
		msg ="errEditPinCode";
		title = "Pin Code";
		
		$("#" + msg).text(title + " must have six numbers");
		$("#" + msg).show();
		pincode.focus();
		return false;
	}else{
		$("#errEditEventName").text("");
		$("#errEditPinCode").text("");
		
		eventUpdate();
		return true;
	}

}
$(document).ready(function() {
	var content = "";
	$.ajax({
		url : "emp/eventService/editEvent",
		success : function(data) {
				$.each(
						data.EditEvent,
						function(key, val) {
							
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
						$('#eventEditMoreInfo').val(data.EditEvent[key].moreInfo);
						
						
						
						}
				)
				showEventImages(data);
				$.each(
						data.EventGuestEdit,
						function(key, val) {
							content = content
							+'<tr>'
							+'<td>'+data.EventGuestEdit[key].title+'</td>'
							+'<td>'+data.EventGuestEdit[key].name+'</td>'
							+'<td>'+data.EventGuestEdit[key].designation+'</td>'
							+'<td>'
							+'<div class="add_button" style="margin-top: 0px;">'
									+'<button id='+data.EventGuestEdit[key].guestId+' class="btn btn-primary btn-sm add_field_button" onclick="deleteGuest(this.id)">'
										+'<i class="fa fa-minus" aria-hidden="true"></i'
									+'</button>'
								+'</div>'
								+'</td>'
						+'</tr>'; 
					})
					$('tbody').html(content); 
		}
	});
});
function eventUpdate(){
	var eventId = $("#eventId").val();
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
	var file = $("#file")[0].files[0];
	
	    var elmsGstTitle = document.querySelectorAll("[id='guestTitle']")
		var elmsGstName = document.querySelectorAll("[id='guestName']")
		var elmsGstDesi = document.querySelectorAll("[id='guestDesi']")
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
		formData.append("eventId", eventId);
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
			url : "emp/eventService/eventUpdate",
        	data: formData,
        	cache: false,
        	contentType: false,
        	processData: false,
			success : function(data) {
				if (data.Msg == 'success') {
					window.location.href = "eventList.jsp";
				}else{
					$("#eventEditFailMsg").text("Event Edit Failed");
				}  
			}
		});
		
/* 	var eventObject = new Object();
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
	 $
	.ajax({
		data : eventObject,
		url : "emp/eventService/eventUpdate",
		success : function(data) {
			if (data.Msg == 'success') {
				window.location.href = "eventList.jsp";
			}else{
				$("#eventEditFailMsg").text("Event Edit Failed");
			} 
		}
	});  */
	
}
function deleteGuest(guestId){
	var guestObject = new Object();
	guestObject.guestId = guestId;
	var content = "";
	$.ajax({
		data : guestObject,
		url : "emp/eventService/deleteGuest",
		success : function(data) {
			$.each(
					data.EventGuestEdit,
					function(key, val) {
						content = content
						+'<tr>'
						+'<td>'+data.EventGuestEdit[key].title+'</td>'
						+'<td>'+data.EventGuestEdit[key].name+'</td>'
						+'<td>'+data.EventGuestEdit[key].designation+'</td>'
						+'<td>'
						+'<div class="add_button" style="margin-top: 0px;">'
								+'<button id='+data.EventGuestEdit[key].guestId+' class="btn btn-primary btn-sm add_field_button" onclick="deleteGuest(this.id)">'
									+'<i class="fa fa-minus" aria-hidden="true"></i'
								+'</button>'
							+'</div>'
							+'</td>'
					+'</tr>'; 
				})
				$('tbody').html(content); 
		
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

function showEventImages(data){
	var dispImages = '';
	var dispClas = '';
	var dispChkd = '';
	$.each(
			data.EVENTFILES,
			function(key, val) {
				alert(data.EVENTFILES[key].showPublic);
				if(data.EVENTFILES[key].showPublic == 1){
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
								     +'<img src="'+data.EVENTFILES[key].filePath+'" class="img-responsive" alt="">'
								+'</a>'
							+'</div>'
							+'<div class="caption">'
								+'<div class="checkbox">'
									+'<label>'
									    +'<input id="'+data.EVENTFILES[key].fileId+'" onclick="updateShowAsPublicNews(this.id);" type="checkbox" value="'+data.EVENTFILES[key].fileId+'" name="remember"  '+ dispChkd +'> Show as Public'
									+'</label>'
									+'<div class="suceee_msg"></div>'
								+'</div>'
								+'<div class="delete_box">'
									+'<a href="#" name="'+data.EVENTFILES[key].fileId+'" onclick="deleteFileNews(this.name);"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
									+'<div class="suceee_msg"></div>'
								+'</div>'
							+'</div>'
						+'</div>'
					+'</li>'
				+'</ul>'
			+'</div>'
			})
			document.getElementById("eventEditImages").innerHTML = dispImages;
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
					<label for="event_name"><h4>* These fields are
							required</h4></label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="event_name">Event Name*</label> <span class ="errMsg" id=errEditEventName></span>
						<input type="text"
							class="form-control" id="eventEditEventName"
							name="eventEditEventName" maxlength="30" onkeyup="validateTitle(id,'Event Name','errEditEventName',3,30);"> <input type="hidden"
							class="form-control" id="eventId" name="eventId">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="no_of_days">No.of days *</label> <span class ="errMsg" id=errEditNoOfDays></span>
						<input type="text"
							class="form-control" id="eventEditNoOfDays"
							name="eventEditNoOfDays" maxlength="3" onkeyup="allNumber(id,'No.of days','errEditNoOfDays')">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="time_from">Date & Time From *</label> <span class="errMsg" id="errEditTimeFrom"></span>
						<div class='input-group date' id="eventEditTimeFrom1">
							<input type='text' class="form-control" id="eventEditTimeFrom"
								name="timeFrom" maxlength="30" onkeyup="validateTitle(id,'Date & Time From','errEditTimeFrom',5,30);"/> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="time_end">Date & Time End *</label> <span class="errMsg" id ="errEditTimeEnd"></span>
						<div class='input-group date' id="eventEditTimeEnd1">
							<input type='text' class="form-control" id="eventEditTimeEnd"
								name="eventEditTimeEnd" maxlength="30" onkeyup="validateTitle(id,'Date & Time End','errEditTimeEnd',5,30);"/> <span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="event_address">Address *</label> <span class="errMsg" id="errEditAddress"></span>
						<textarea class="form-control" rows="5" id="eventEditAddress"
							name="eventEditAddress" maxlength="250" onkeyup="emptyCheck(id,'Address','errEditAddress');"></textarea>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark"> Place/City *</label> <span class="errMsg" id="errEditPlace"></span>
						<input type="text" class="form-control" id="eventEditPlace" name="eventEditPlace" maxlength="30"
						onkeyup="validateTitle(id,'Place/City ','errEditPlace',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="Place_city">Mandal *</label> <span class="errMsg" id ="errEditMandal"></span>
						<input type="text"
							class="form-control" id="eventEditMandal" name=" eventEditMandal" maxlength="30" onkeyup="validateTitle(id,'Mandal','errEditMandal',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="more_info">More Info</label>
						<textarea class="form-control" rows="5" id="eventEditMoreInfo"
							name="eventEditMoreInfo" maxlength="250"></textarea>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="district">District *</label> <span class="errMsg" id="errEditDistrict"></span>
						<input type="text"
							class="form-control" id="eventEditDistrict"
							name="eventEditDistrict" maxlength="30" onkeyup="validateTitle(id,'District','errEditDistrict',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="state"> State *</label> <select class="form-control"
							id="eventEditstate">
							<option value="Telangana">Telangana</option>
							<option value="AndhraPradesh">AndhraPradesh</option>
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="state">Land Mark</label> <input type="text"
							class="form-control" id="eventEditLandMark"
							name="eventEditLandMark" maxlength="250">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="pin_code">Pin Code</label> <span class="errMsg" id="errEditPincode"></span>
						<input type="text"
							class="form-control" id="eventEditPincode"
							name="eventEditPincode" maxlength="6" onkeyup="pincodeCheck(id,'Pin Code','errEditPincode')">
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
				<div class="clearfix"></div>

				<!-- </form> -->
			</div>
			<div class="clearfix"></div>

			<!----------------------photo_gallery------------------------------>
			<div class="col-md-5" style="margin-left: 250px;">
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
				<div id="carousel-example" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner" id="eventEditImages">
						</div>
				</div>
			</div>
			<!----------------------photo_gallery end------------------------------>
			<!------------------------------guests form--------------------------------------->
			<div class="input_fields_wrap">
				<div class="row">
					<div class="col-md-10">
						<div class="guest_registration">
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
								<!-- 	<tr>
										<td>Mr</td>
										<td>September 14, 2013</td>
										<td>jhlilk22@yahoo.com</td>
										<td><div class="add_button" style="margin-top: 0px;">
												<button class="btn btn-primary btn-sm add_field_button">
													<i class="fa fa-minus" aria-hidden="true"></i>
												</button>
											</div></td>
									</tr> -->
									<div id="guestListData"></div>
<!-- 									<tr>
										<td>Mr</td>
										<td>September 14, 2013</td>
										<td>jhlilk22@yahoo.com</td>
										<td><div class="add_button" style="margin-top: 0px;">
												<button class="btn btn-primary btn-sm add_field_button">
													<i class="fa fa-minus" aria-hidden="true"></i>
												</button>
											</div></td>
									</tr>
									<tr>
										<td>Mr</td>
										<td>September 14, 2013</td>
										<td>jhlilk22@yahoo.com</td>
										<td><div class="add_button" style="margin-top: 0px;">
												<button class="btn btn-primary btn-sm add_field_button">
													<i class="fa fa-minus" aria-hidden="true"></i>
												</button>
											</div></td>
									</tr> -->

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
								<select class="form-control" id="guestTitle" name="guestTitle">
									<option>Mr</option>
									<option>Ms</option>
									<option>Dr</option>
									<option>Prof</option>
								</select> <!-- <input type="hidden" class="form-control" id="guestEditguestId"
									name="guestEditguestId"> -->
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
									class="form-control" id="guestDesi"
									name="guestDesi">
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
					<a href='#'><button class="btn btn-success btn-sm text-right "
							onclick="eventEditFarmValidation();">Submit</button></a>
				</div>
				<div class="message" id="eventfrm_message">
					<h3>
				         <aside class="formFailMsg" id="eventEditFailMsg"></aside>
			       </h3>
				</div>
			</div>

			<!-------------------------submit button end--------------------------------------->
			<div class="clearfix"></div>
		</div>


	</div>
</div>

<!-- <div id="guests_block" style="display: none;">
	<div class="row">
		<div class="col-md-10">
			<div class="from">
				<div class="col-md-3">
					<div class="form-group">
						<label for="title">Title</label> <select class="form-control">
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
						<label for="name">Name</label> <input type="text"
							class="form-control" id="name" name="name[]">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="designation">Designation</label> <input type="text"
							class="form-control" id="designation" name="designation[]">
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
</div> -->
<!-- </div>
</div>
</div> -->
<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />


<!----------------------footer end --------------------------------->
<script type="text/javascript">
    $(function () {
	
        $('#eventEditTimeFrom1,#eventEditTimeEnd1').datetimepicker({
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
