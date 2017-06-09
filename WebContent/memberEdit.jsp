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
<!-- <script type="text/javascript" src="js/member.js"></script> -->
</head>
<body onload="test2();">
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
	function memberEditFarmValidation() {
		$("#memberMessage").text("");
		var firstName = document.getElementById("memberEditFirstName");
		var middleName = document.getElementById("memberEditMiddleName");
		var lastName = document.getElementById("memberEditLastName");
		var mobile = document.getElementById("memberEditMobile");
		var email = document.getElementById("memberEditEmail");
		var address = document.getElementById("memberEditAddress");
		var place = document.getElementById("memberEditPlace");
		var mandal = document.getElementById("memberEditMandal");
		var district = document.getElementById("memberEditDistrict");
		var pincode = document.getElementById("memberEditPincode");
		var memberType = document.getElementById("editMemberType");
		var amount = document.getElementById("editAmount");
		var haveFarm = $('input[name=yesno]:checked', '#haveFarm').val();
		
		var farmName = document.getElementById("memberFarmEditFarmName");
		var farmPlace = document.getElementById("memberFarmEditFarmPlace");
		var farmAddress = document.getElementById("memberFarmEditFarmAddress");
		var farmMandal = document.getElementById("memberFarmEditFarmMandal");
		var farmDistrict = document.getElementById("memberFarmEditFarmDistrict");
		var aboutFarm = document.getElementById("memberFarmEditAboutFarm");
		var farmPincode = document.getElementById("memberFarmEditFarmPincode");
		$("#memberEditFailMsg").text("");
	if (firstName.value.length == 0) {
		msg = "errFirstName";
		title = "First Name ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		firstName.focus();
		return false;
	} else if (mobile.value.length == 0) {
		msg = "errEditMemMobile";
		title = "Mobile/Contact No";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		mobile.focus();
		return false;
	}else if (mobile.value.length > 0 && mobile.value.length != 10) {
		msg = "errEditMemMobile";
		title = "Mobile/Contact No";

		$("#" + msg).text(title + " must have ten numbers");
		$("#" + msg).show();
		mobile.focus();
		return false;
	}else if (place.value.length == 0) {
		msg = "errEditMemPlace";
		title = "Place/City";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		place.focus();
		return false;
	}else if (mandal.value.length == 0) {
		msg = "errEditMemMandal";
		title = "Mandal";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		mandal.focus();
		return false;
	}else if (district.value.length == 0) {
		msg = "errEditMemMandal";
		title = "District";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		district.focus();
		return false;
	}else if (pincode.value.length > 0 && pincode.value.length != 6) {
		msg = "errEditMemPincode";
		title = "Pin Code";

		$("#" + msg).text(title + " must have six numbers");
		$("#" + msg).show();
		pincode.focus();
		return false;
	}else if (haveFarm == 'yes' && farmName.value.length == 0) {
		msg = "errEditMemFarmName";
		title = "Farm Name";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmName.focus();
		return false;
	}else if (haveFarm == 'yes' && farmPlace.value.length == 0) {
		msg = "errEditMemFarmPlace";
		title = "Farm Place/City";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmPlace.focus();
		return false;
	}else if (haveFarm == 'yes' && farmMandal.value.length == 0) {
		msg = "errEditMemFarmMandal";
		title = "Mandal";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmMandal.focus();
		return false;
	}else if (haveFarm == 'yes' && farmDistrict.value.length == 0) {
		msg = "errEditMemFarmDistrict";
		title = "District";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmDistrict.focus();
		return false;
	}else if (haveFarm == 'yes' && farmPincode.value.length > 0 && farmPincode.value.length != 6) {
		msg = "errMemberFarmEditFarmPincode";
		title = "Farm Pin Code";

		$("#" + msg).text(title + " must have six numbers");
		$("#" + msg).show();
		farmPincode.focus();
		return false;
	}else{
		$("#memberFarmEditFarmName").text("");
		$("#memberFarmEditFarmPlace").text("");
		$("#memberFarmEditFarmMandal").text("");
		$("#memberFarmEditFarmDistrict").text("");
		$("#errMemberFarmEditFarmPincode").text("");
		memberUpdate1();
	}
		

	}
	function selectAmount(fName){
		var fieldName = document.getElementById(fName);
		if(fieldName.value == 'Life'){
			document.getElementById("editAmount").value = '15,000.00';
		}else{
			document.getElementById("editAmount").value = '500.00';
		}
	}
	
	
	$(document).ready(
			function() {
				$.ajax({
					url : "emp/memberService/editMember",
					success : function(data) {
						$.each(data.EditMember, function(key, val) {
							$('#memberId').val(data.EditMember[key].memberId);
							$('#memberEditTitle').val(
									data.EditMember[key].title);
							$('#memberEditFirstName').val(
									data.EditMember[key].firstName);
							$('#memberEditMiddleName').val(
									data.EditMember[key].middleName);
							$('#memberEditLastName').val(
									data.EditMember[key].lastName);
							$('#memberEditMobile').val(
									data.EditMember[key].mobile);
							$('#memberEditEmail').val(
									data.EditMember[key].email);
							$('#memberEditAddress').val(
									data.EditMember[key].address);
							$('#memberEditPlace').val(
									data.EditMember[key].place);
							$('#memberEditMandal').val(
									data.EditMember[key].mandal);
							$('#memberEditDistrict').val(
									data.EditMember[key].district);
							$('#memberEditState').val(
									data.EditMember[key].state);
							$('#memberEditPincode').val(
									data.EditMember[key].pincode);
							$('#memberEditProfession').val(
									data.EditMember[key].profession);
							$('#editMemberType').val(
									data.EditMember[key].memberType);
							$('#editAmount').val(
									data.EditMember[key].amountPaid);
							$('#memberFarmEditHaveFarm').val(data.EditMember[key].haveFarm);
						})
					}
				});
			});
	function memberUpdate1() {
		var memberId = $("#memberId").val();
		var title = $("#memberEditTitle").val();
		var firstName = $("#memberEditFirstName").val();
		var middleName = $("#memberEditMiddleName").val();
		var lastName = $("#memberEditLastName").val();
		var mobile = $("#memberEditMobile").val();
		var email = $("#memberEditEmail").val();
		var address = $("#memberEditAddress").val();
		var place = $("#memberEditPlace").val();
		var mandal = $("#memberEditMandal").val();
		var district = $("#memberEditDistrict").val();
		var state = $("#memberEditState").val();
		var pincode = $("#memberEditPincode").val();
		var profession = $("#memberEditProfession").val();
		var memberType = $("#editMemberType").val();
		var amount = $("#editAmount").val();
		var haveFarm = $('input[name=yesno]:checked', '#haveFarm').val();

		var farmId = $("#memberFarmEditFarmId").val();
		var farmName = $("#memberFarmEditFarmName").val();
		var farmPlace = $("#memberFarmEditFarmPlace").val();
		var farmAddress = $("#memberFarmEditFarmAddress").val();
		var farmMandal = $("#memberFarmEditFarmMandal").val();
		var farmDistrict = $("#memberFarmEditFarmDistrict").val();
		var aboutFarm = $("#memberFarmEditAboutFarm").val();
		var farmState = $("#memberFarmEditFarmState").val();
		var farmPincode = $("#memberFarmEditFarmPincode").val();
		
        
		var memberObject = new Object();
		memberObject.memberId = memberId;
		memberObject.title = title;
		memberObject.firstName = firstName;
		memberObject.middleName = middleName;
		memberObject.lastName = lastName;
		memberObject.mobile = mobile;
		memberObject.email = email;
		memberObject.address = address;
		memberObject.place = place;
		memberObject.mandal = mandal;
		memberObject.district = district;
		memberObject.state = state;
		memberObject.pincode = pincode;
		memberObject.profession = profession;
		memberObject.haveFarm = haveFarm;
		memberObject.memberType = memberType;
		memberObject.amount = amount;
		memberObject.farmId = farmId;
		memberObject.farmName = farmName;
		memberObject.farmPlace = farmPlace;
		memberObject.farmAddress = farmAddress;
		memberObject.farmMandal = farmMandal;
		memberObject.farmDistrict = farmDistrict;
		memberObject.aboutFarm = aboutFarm;
		memberObject.farmState = farmState;
		memberObject.farmPincode = farmPincode;

		$.ajax({
			data : memberObject,
			url : "emp/memberService/memberUpdate",
			success : function(data) {
				if (data.Msg == 'success') {
					window.location.href = "memberList.jsp";
				}else{
					$("#memberEditFailMsg").text("Member Edit Failed");
				} 
			}
		});

	}

	function test() {
		$.ajax({
			url : "emp/farmService/getFarm",
			success : function(data) {

				$.each(data.MemberFarmEdit, function(key, val) {
					$('#memberFarmEditFarmName').val(
							data.MemberFarmEdit[key].farmName);
					$('#memberFarmEditFarmPlace').val(
							data.MemberFarmEdit[key].farmPlace);
					$('#memberFarmEditFarmAddress').val(
							data.MemberFarmEdit[key].farmAddress);
					$('#memberFarmEditFarmMandal').val(
							data.MemberFarmEdit[key].farmMandal);
					$('#memberFarmEditFarmDistrict').val(
							data.MemberFarmEdit[key].farmDistrict);
					$('#memberFarmEditAboutFarm').val(
							data.MemberFarmEdit[key].aboutFarm);
					$('#memberFarmEditFarmState').val(
							data.MemberFarmEdit[key].farmState);
					$('#memberFarmEditFarmPincode').val(
							data.MemberFarmEdit[key].farmPincode);
					$('#memberFarmEditFarmId').val(data.MemberFarmEdit[key].farmId);
				})
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
	
	function mobileCheck(fName, title, msg) {
		var fieldName = document.getElementById(fName);
		var number = /^[0-9]+$/;
		if (!fieldName.value.match(number)) {			
			$("#" + msg).text(title + " must have numbers only");
			$("#" + msg).show();
			fieldName.focus();
			return false;
		}else if(fieldName.value.length != 10){
			$("#" + msg).text(title + " must have ten numbers");
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
<!----------------------body_content start-------------------------->

<div class="clearfix"></div>
<div id="aboutus">
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>Member Edit</h2>
				<div class="line3"></div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>

<div class="clearfix"></div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="member_registration">
				<h2>Personal Info</h2>
			</div>
			<div class="form-group">
				<label for="event_name"><h4>* These fields are required</h4></label>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="title">Title</label> <select class="form-control"
							id="memberEditTitle" name="memberEditTitle">
							<!-- <option selected="selected" >--select--</option> -->
							<option value="Mr">Mr</option>
							<option value="Ms">Ms</option>
							<option value="Dr">Dr</option>
							<option value="Prof">Prof</option>
						</select> <input type="hidden" class="form-control" id="memberId"
							name="memberId">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="first_name">First Name *</label> <span class="errMsg" id="errEditMemFirstName"></span>
						<input type="text" class="form-control" id="memberEditFirstName"
							name="memberEditFirstName" maxlength="30" onkeyup="validateTitle(id,'First Name','errEditMemFirstName',3,30);">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="middle_name">Middle Name</label> 
						<input type="text" class="form-control" id="memberEditMiddleName" name="memberEditMiddleName" maxlength="30" >
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="surname_last_name">Surname/Last Name</label> <input
							type="text" class="form-control" id="memberEditLastName"
							name="memberEditLastName" maxlength="30">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="mobile_contact_no">Mobile/Contact No *</label> <span class="errMsg" id="errEditMemMobile"></span>
						<input type="text" class="form-control" id="memberEditMobile"
							name="memberEditMobile" maxlength="10" onkeyup="mobileCheck(id,'Mobile/Contact No','errEditMemMobile')">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="email">Email</label> <span class="errMsg" id="errEditMemEmail"></span>
						<input type="text"
							class="form-control" id="memberEditEmail" name="memberEditEmail" maxlength="30" onkeyup="eMail(id,'Email','errEditMemEmail');">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="address">Address</label>
						<textarea class="form-control" rows="5" id="memberEditAddress"
						name="memberEditAddress" maxlength="250"></textarea>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="place_city">Place/City *</label> <span class="errMsg" id="errEditMemPlace"></span>
						<input type="text" class="form-control" id="memberEditPlace" name="memberEditPlace" maxlength="30"
							 onkeyup="validateTitle(id,'Place/City','errEditMemPlace',3,30);">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="mandal">Mandal *</label> <span class="errMsg" id="errEditMemMandal"></span>
						<input type="text"
							class="form-control" id="memberEditMandal"
							name="memberEditMandal" maxlength="30" onkeyup="validateTitle(id,'Mandal','errEditMemMandal',3,30);">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="district">District *</label> <span class="errMsg" id="errEditMemDistrict"></span>
						<input type="text"
							class="form-control" id="memberEditDistrict"
							name="memberEditDistrict" maxlength="30" onkeyup="validateTitle(id,'District','errEditMemDistrict',3,30)">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="state">State</label> <select class="form-control"
							id="memberEditState" name="memberEditState">
							<!-- <option selected="selected" >--select--</option> -->
							<option value="Telangana">Telangana</option>
							<option value="AndhraPradesh">AndhraPradesh</option>
						</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="pin_code">Pin Code</label> <span class="errMsg" id="errEditMemPincode"></span>
						<input type="text"
							class="form-control" id="memberEditPincode"
							name="memberEditPincode" maxlength="6" onkeyup="pincodeCheck(id,'Pin Code','errEditMemPincode');">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="profession">Profession</label> <select
							class="form-control" id="memberEditProfession"
							name="memberEditProfession">
							<!-- <option selected="selected" >--select--</option> -->
							<option value="Doctor">Doctor</option>
							<option value="Professor">Professor</option>
						</select>
					</div>
				</div>

				<!-------------------------Upload Photo--------------------------------------->
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-2">
							<div class="image">
								<img src="images/img.png"
									class="img-responsive img-thumbnail g-image" href="#"
									data-image-id="1" data-toggle="modal" data-title=""
									data-caption="" data-image="images/placeholder.jpg"
									data-target="#image-gallery">
							</div>
						</div>
						<div class="upload_img">
							<form method="post" action="emp/commonUtils/upload"
								enctype="multipart/form-data">
								<div class="form-group col-md-6">
									<label for="Upload Photo">Select Photo(s)</label> <input
										id="file" name="file" class="file form-control" type="file">
									<a href="#"><button
											class="btn btn-success btn-sm text-right">Upload</button></a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>



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
								<img id="image-gallery-image" class="img-responsive" src="">
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
			<!-------------------------Upload Photo end--------------------------------------->

		</div>
		<div class="clearfix"></div>




		<!-------------------------Farm Info--------------------------------------->
		<div class="farm_info">
			<div class="col-md-12">
				<div id="haveFarm" class="form-group">
					<h2>Do you have Farm</h2>
					<label class="radio-inline"> 
						<input type="radio" name="yesno" id="yesno" value="yes" onclick="test()"> Yes
					</label> 
					<label class="radio-inline"> 
						<input type="radio" name="yesno" id="yesno" checked value="no"> No
					</label>
				</div>
			</div>
			<div id="moreFields" style="float: left;"></div>
		</div>
		<div class="clearfix"></div>
		<!-------------------------Farm Info end--------------------------------------->

		<!-------------------------Member Registration--------------------------------------->

		<div class="col-md-12">
			<div class="member_registration">
				<h2>Member Registration</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="membership_type">Membership Type</label> 
						<select class="form-control" id="editMemberType" name="editMemberType" onchange="selectAmount(id);">
							<option selected="selected" value="Ordinary">Ordinary</option>
							<option value="Life">Life</option>
							<%if(bAdmin){ %>
							<option value="Admin">Admin</option>
							<%}%>
						</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="amount">Amount</label> 
						<input type="text" class="form-control" id="editAmount" name="editAmount" disabled>
					</div>
				</div>
			</div>
		</div>

		<!-------------------------Member Registration end--------------------------------------->

		<!-------------------------submit button--------------------------------------->
		<div class="col-md-12">
			<div class="submit_button text-right">
				<a href='#'><button class="btn btn-success btn-sm text-right "
						onclick="memberEditFarmValidation();">Submit</button></a>
			</div>
			<div class="message" id="memberfrm_message">
				<h3>
				         <aside class="formFailMsg" id="memberEditFailMsg"></aside>
			       </h3>
			</div>
		</div>

		<!-------------------------submit button end--------------------------------------->


		<div class="clearfix"></div>
	</div>
</div>
<div id="farmFields">
	<div class="col-md-12">
		<div class="member_registration">
			<h2>Farm Info</h2>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="farm_name">Farm Name *</label> <span class="errMsg" id="errEditMemFarmName"></span>
					<input type="text"
						class="form-control" id="memberFarmEditFarmName"
						name="memberFarmEditFarmName" maxlength="30" onkeyup="validateTitle(id,'Farm Name','errEditMemFarmName',3,30);"> 
						<input type="hidden" class="form-control" id="memberFarmEditFarmId" name="memberFarmEditFarmId">
						<input type="hidden" class="form-control" id="memberFarmEditHaveFarm" name="memberFarmEditHaveFarm">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="farm_place_city">Farm Place/City *</label> <span class="errMsg" id="errEditMemFarmPlace"></span>
					<input
						type="text" class="form-control" id="memberFarmEditFarmPlace"
						name="memberFarmEditFarmPlace" maxlength="30" onkeyup="validateTitle(id,'Farm Place/City','errEditMemFarmPlace',3,30);">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="farm_address">Farm Address</label> <span class="errMsg" id="errEditMemFarmAddress"></span>
					<textarea class="form-control" rows="5" id="memberFarmEditFarmAddress" name="memberFarmEditFarmAddress" maxlength="250"></textarea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="mandal">Farm Mandal *</label> <span class="errMsg" id="errEditMemFarmMandal"></span>
					<input type="text"
						class="form-control" id="memberFarmEditFarmMandal"
						name="memberFarmEditFarmMandal" maxlength="30" onkeyup="validateTitle(id,'Mandal','errEditMemFarmMandal',3,30);">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="district">Farm District *</label> <span class="errMsg" id="errEditMemFarmDistrict"></span>
					<input type="text"
						class="form-control" id="memberFarmEditFarmDistrict"
						name="memberFarmEditFarmDistrict" maxlength="30" onkeyup="validateTitle(id,'District','errEditMemFarmDistrict',3,30);">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="about_you_farm">About You/Farm</label>
					<textarea class="form-control" rows="5"
						id="memberFarmEditAboutFarm" name="memberFarmEditAboutFarm" maxlength="250"></textarea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="farm_state">Farm State</label> <select
						class="form-control" id="memberFarmEditFarmState"
						name="memberFarmEditFarmState">
						<!-- <option selected="selected" >--select--</option> -->
						<option>Telangana</option>
						<option>AndhraPradesh</option>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="farm_pin_code">Farm Pin Code </label> <span class="errmsg" id="errMemberFarmEditFarmPincode"></span>
					<input
						type="text" class="form-control" id="memberFarmEditFarmPincode"
						name="memberFarmEditFarmPincode" maxlength="6" onkeyup="pincodeCheck(id,'Farm Pin Code','errMemberFarmEditFarmPincode');">
				</div>
			</div>

			<!-------------------------Upload Photo--------------------------------------->
			<div class="row">
				<div class="col-md-12">
					<!--<div class="col-md-3">
          <div class="image"> <img src="images/img.png" class="img-responsive"> </div>
        </div>-->
					<div class="upload_img">
						<div class="form-group col-md-7">
							<label for="Upload Photo">Upload Farm Photo(s)</label> <input
								id="file-0b" class="file form-control" type="file">
						</div>
					</div>
				</div>
			</div>
			<div id="gallery_section">
				<div class="container">
					<div class="row">

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
								<div class="carousel-inner">
									<div class="item active left">
										<div class="row">
											<div class="col-sm-12">
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
																<!-- <h4>Delete Message</h4> -->
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
							</div>
						</div>
						<!----------------------video_gallery end------------------------------>

					</div>
				</div>
			</div>

		</div>

		<!-------------------------Upload Photo end--------------------------------------->

	</div>
</div>
<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
<script>
	$(function() {
		if ($('[name="yesno"]:checked').val() == 'no') {
			$('#moreFields').html('');
		}
		$(document).on('change', '[name="yesno"]', function() {
			var html = '';
			if ($(this).val() == 'yes') {
				html = $('#farmFields').html();
			}
			$('#moreFields').html(html);
		})

	})
	
function setRadioCheckedValue(radio_name, val) {
	//alert("gets here");
	//var oRadio = document.forms[0].elements[radio_name];
	var oRadio = document.getElementById("yesno");
	//alert("oRadio=="+oRadio.length);
	for(var i = 0; i < oRadio.length; i++) { 
		if(oRadio[i].value == val) {
			oRadio[i].checked;
		}
	}
} 

	

			function test2 () {
			//alert("memberFarmEditHaveFarm=="+$("#memberFarmEditHaveFarm").val());
			if($("#memberFarmEditHaveFarm").val() == 'yes'){
				document.getElementById("yesno").checked = 'true';
				test();
				var html = '';
				html = $('#farmFields').html();
				$('#moreFields').html(html);
			}

			}

</script>
</body>
</html>
<jsp:include page="login.jsp" />
