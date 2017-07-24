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
<script type="text/javascript">
function memberFarmValidation() {

	$("#memberRegFailMsg").text("");
	var firstName = document.getElementById("firstName");
	var middleName = document.getElementById("middleName");
	var lastName = document.getElementById("lastName");
	var mobile = document.getElementById("mobile");
	var email = document.getElementById("email");
	var address = document.getElementById("address");
	var place = document.getElementById("place");
	var mandal = document.getElementById("mandal");
	var district = document.getElementById("district");
	var pincode = document.getElementById("pincode");
	
	var haveFarm = $('input[name=yesno]:checked', '#haveFarm').val();
	
	var farmName = document.getElementById("farmName");
	var farmPlace = document.getElementById("farmPlace");
	var farmAddress = document.getElementById("farmAddress");
	var farmMandal = document.getElementById("farmMandal");
	var farmDistrict = document.getElementById("farmDistrict");
	var aboutFarm = document.getElementById("aboutFarm");
	var farmPincode = document.getElementById("farmPincode");
	var number = /^[0-9]+$/;
	var emailChk = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/;
	
	 var file = $('#file').val().split('.').pop().toLowerCase();
	
	if (firstName.value.length == 0) {
		msg = "errFirstName";
		title = "First Name ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		firstName.focus();
		return false;
	} else if (mobile.value.length == 0) {
		msg = "errMobile";
		title = "Mobile/Contact No";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		mobile.focus();
		return false;
	}else if (email.value.length > 0 && !email.value.match(emailChk) ) {
    	msg = "errEmail";
		title = "";

		$("#" + msg).text(title + " please enter valid email");
		$("#" + msg).show();
		email.focus();
		return false;

    }else if (place.value.length == 0) {
		msg = "errPlace";
		title = "Place/City";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		place.focus();
		return false;
	}else if (mandal.value.length == 0) {
		msg = "errMandal";
		title = "Mobile/Contact No";

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
	}else if (pincode.value.length > 0 && !pincode.value.match(number) ) {
		msg = "errMemRegPinCode";
		title = "Pin Code";

		$("#" + msg).text(title + " must have numbers only");
		$("#" + msg).show();
		pincode.focus();
		return false;
	}else if (pincode.value.length > 0 && pincode.value.length != 6) {
		msg = "errMemRegPinCode";
		title = "Pin Code";

		$("#" + msg).text(title + " must have six numbers");
		$("#" + msg).show();
		pincode.focus();
		return false;
	}else if (haveFarm == 'yes' && farmName.value.length == 0) {
		msg = "errMemFarmName";
		title = "Farm Name";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmName.focus();
		return false;
	}else if (haveFarm == 'yes' && farmPlace.value.length == 0) {
		msg = "errMemFarmPlace";
		title = "Farm Place/City";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmPlace.focus();
		return false;
	}else if (haveFarm == 'yes' && farmMandal.value.length == 0) {
		msg = "errMemFarmMandal";
		title = "Mandal";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmMandal.focus();
		return false;
	}else if (haveFarm == 'yes' && farmDistrict.value.length == 0) {
		msg = "errMemFarmDistrict";
		title = "District";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmDistrict.focus();
		return false;
	}else if (haveFarm == 'yes' && farmPincode.value.length > 0 && !farmPincode.value.match(number)) {
		msg = "errFarmPincode";
		title = "Farm Pin Code";

		$("#" + msg).text(title + " must have numbers only ");
		$("#" + msg).show();
		farmPincode.focus();
		return false;
	}else if (haveFarm == 'yes' && farmPincode.value.length > 0 && farmPincode.value.length != 6) {
		msg = "errFarmPincode";
		title = "Farm Pin Code";

		$("#" + msg).text(title + " must have six numbers");
		$("#" + msg).show();
		farmPincode.focus();
		return false;
	}else{
		$("#farmName").text("");
		$("#farmPlace").text("");
		$("#farmMandal").text("");
		$("#farmDistrict").text("");
		$("#farmPincode").text("");
		$("#errEmail").text("");
		saveMember();
	}

}

	function saveMember(){
	var title = $("#title").val();
	var firstName =$("#firstName").val();
	var middleName = $("#middleName").val();
	var lastName = $("#lastName").val();
	var mobile = $("#mobile").val();
	var email = $("#email").val();
	var address = $("#address").val();
	var place = $("#place").val();
	var mandal = $("#mandal").val();
	var district = $("#district").val();
	var state = $("#state").val();
	var pincode = $("#pincode").val();
	var profession = $("#profession").val();
	var haveFarm = $('input[name=yesno]:checked', '#haveFarm').val();
	
	var memberType = $("#memberType").val();
	var farmName = $("#farmName").val();
	var farmPlace = $("#farmPlace").val();
	var farmAddress = $("#farmAddress").val();
	var farmMandal = $("#farmMandal").val();
	var farmDistrict = 	$("#farmDistrict").val();
	var aboutFarm = $("#aboutFarm").val();
	var farmState = $("#farmState").val();
	var farmPincode = $("#farmPincode").val();
	var amount = $("#amount").val();
	var file = $("#file")[0].files[0];
	//alert("in to member photo format should be only ");
	var formData = new FormData();
	formData.append("title", title);
	formData.append("firstName", firstName);
	formData.append("middleName", middleName);
	formData.append("lastName", lastName);
	formData.append("mobile", mobile);
	formData.append("email", email);
	formData.append("address", address);
	formData.append("place", place);
	formData.append("mandal", mandal);
	formData.append("district", district);
	formData.append("state", state);
	formData.append("pincode", pincode);
	formData.append("profession", profession);
	formData.append("haveFarm", haveFarm);
	
	
	formData.append("memberType", memberType);
	formData.append("farmName", farmName);
	formData.append("farmPlace", farmPlace);
	formData.append("farmAddress", farmAddress);
	formData.append("farmMandal", farmMandal);
	formData.append("farmDistrict", farmDistrict);
	formData.append("aboutFarm", aboutFarm);
	formData.append("farmState", farmState);
	
	formData.append("farmPincode", farmPincode);
	formData.append("amount", amount);
	formData.append("file", file);
	
	//formData.append('fileFarm',  $("#fileFarm")[0].files[i]);
	for (var i = 0; i < $("#fileFarm")[0].files.length; i++)
		formData.append('fileFarm',  $("#fileFarm")[0].files[i]);

	$.ajax({
		type: 'POST',
		url : "emp/memberService/addMember",
    	data: formData,
    	cache: false,
    	contentType: false,
    	processData: false,
		success : function(data) {
			if (data.Msg == 'success') {
				window.location.href = "memberList.jsp";
			}else{
				$("#memberRegFailMsg").text(data.Msg);
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
	function selectAmount(fName){
		var fieldName = document.getElementById(fName);
		if(fieldName.value == 'Life'){
			document.getElementById("amount").value = '15,000.00';
		}else{
			document.getElementById("amount").value = '500.00';
		}
	}
	function fileCheck(obj) {
		//alert("in to programReg fileCheck");
		//alert("in to file check"+$("#"+obj).val());
		 var fileInput = document.getElementById('fileFarm');
		    var filePath = fileInput.value;
		    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif|\.mp4|\.mov|\.wmv|\.flv|\.avi)$/i;
		    if(!allowedExtensions.exec(filePath)){
		        //alert('Please upload file having extensions .jpeg/.jpg/.png/.gif only.');
		        fileInput.value = '';
		        return false;
		    }else{

		    }

	}
	function fileCheck1(obj) {
		//alert("in to memberReg fileCheck");
		//alert("in to file check"+$("#"+obj).val());
		 var fileInput = document.getElementById('file');
		    var filePath = fileInput.value;
		    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
		    if(!allowedExtensions.exec(filePath)){
		        //alert('Please upload file having extensions .jpeg/.jpg/.png/.gif only.');
		        fileInput.value = '';
		        return false;
		    }else{

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
	<%-- <jsp:include page="banner.jsp" /> --%>
	<!----------------------banner end---------------------------------->
<head>


</head>
<!----------------------body_content start-------------------------->

<div class="clearfix"></div>
<div id="aboutus">
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>Member New</h2>
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
							id="title" name="title">
							<!-- <option selected="selected" >--select--</option> -->
							<option value="Mr">Mr</option>
							<option value="Ms">Ms</option>
							<option value="Dr">Dr</option>
							<option value="Prof">Prof</option>
							<option value="Mrs">Mrs</option>
							<option value="Madam">Madam</option>
							<option value="Captain">Captain</option>
							<option value="Rev">Rev</option>
							<option value="Hon">Hon</option>						
					</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="first_name">First Name *</label> <span class="errMsg" id="errFirstName"></span>
						<input type="text" class="form-control" id="firstName" name="firstName" maxlength="30"
						onkeyup="validateTitle(id,'First Name','errFirstName',3,30);">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="middle_name">Middle Name</label> <span class="errMsg" id="errMiddleName"></span>
						<input type="text" class="form-control" id="middleName" name="middleName"  maxlength="30" >
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="surname_last_name">Surname/Last Name</label> <span class="errMsg" id="errLastName"></span>
						<input type="text" class="form-control" id="lastName" name="lastName" maxlength="30" >
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="mobile_contact_no">Mobile/Contact No *</label> <span class="errMsg" id="errMobile"></span>
						<input type="text" class="form-control" id="mobile" name="mobile" maxlength="10" onkeyup="mobileCheck(id,'Mobile/Contact No','errMobile');">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="email">Email</label> <span class="errMsg" id="errEmail"></span>
						<input type="text"
							class="form-control" id="email" name="email" maxlength="30" onkeyup="eMail(id,'','errEmail');">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="address">Address</label> <span class="errMsg" id="errAddress"></span>
						<textarea class="form-control" rows="5" id="address"
						name="address" maxlength="250"></textarea>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="place_city">Place/City *</label> <span class="errMsg" id="errPlace"></span>
						<input type="text" class="form-control" id="place" name="place" maxlength="30" onkeyup="validateTitle(id,'Place/City','errPlace',3,30);">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="mandal">Mandal *</label> <span class="errMsg" id="errMandal"></span>
						<input type="text" class="form-control" id="mandal" name="mandal" maxlength="30" onkeyup="validateTitle(id,'Mandal','errMandal',3,30);">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="district">District *</label> <span class="errMsg" id="errDistrict"></span>
						<input type="text" class="form-control" id="district" name="district" maxlength="30" onkeyup="validateTitle(id,'District','errDistrict',3,30);">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="state">State</label> <select class="form-control"
							id="state" name="state">
							<!-- <option selected="selected" >--select--</option> -->
							<option value="Andra Pradesh">Andra Pradesh</option>
							<option value="Arunachal Pradesh">Arunachal Pradesh</option>
							<option value="Assam">Assam</option>
							<option value="Bihar">Bihar</option>
							<option value="Chattisgarh">Chattisgarh</option>
							<option value="Goa">Goa</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Haryana">Haryana</option>
							<option value="Himachal Pradesh">Himachal Pradesh</option>
							<option value="Jammu Kashmir">Jammu Kashmir</option>
							<option value="Jharkhand">Jharkhand</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Kerala">Kerala</option>
							<option value="Madya Pradesh">Madya Pradesh</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Manipur">Manipur</option>
							<option value="Meghalaya">Meghalaya</option>
							<option value="Migoram">Migoram</option>
							<option value="Nagaland">Nagaland</option>
							<option value="Odish">Odish</option>
							<option value="Punjab">Punjab</option>
							<option value="Rajasthan">Rajasthan</option>
							<option value="Sikkim">Sikkim</option>
							<option value="Tamilnadu">Tamilnadu</option>
							<option value="Telangana">Telangana</option>
							<option value="Tripura">Tripura</option>
							<option value="Uttarpradesh">Uttarpradesh</option>
							<option value="Uttarakhand">Uttarakhand</option>
							<option value="Westbengal">Westbengal</option>
						</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="pin_code">Pin Code</label> <span class="errMsg" id="errMemRegPinCode"></span>
						<input type="text" class="form-control" id="pincode" name="pincode" maxlength="6" onkeyup="pincodeCheck(id,'Pin Code','errMemRegPinCode');">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="profession">Profession</label> <select
							class="form-control" id="profession" name="profession">
							<option value="Agriculture">Agriculture</option>
							<option value="Doctor">Doctor</option>
							<option value="Professor">Professor</option>
							<option value="Poultry">Poultry</option>
							<option value="Veterinary">Veterinary</option>
							<option value="Physician">Physician</option>
							<option value="Teacher">Teacher</option>
							<option value="Technician">Technician</option>
							<option value="Lawyer">Lawyer</option>
							<option value="Engineer">Engineer</option>
							<option value="Accountant">Accountant</option>
							<option value="Pharmacist">Pharmacist</option>
							<option value="Electrician">Electrician</option>
							<option value="Mechanic">Mechanic</option>
							<option value="Consultant">Consultant</option>
							<option value="Chef">Chef</option>
							<option value="Secretary">Secretary</option>
							<option value="Surveyor">Surveyor</option>
							<option value="Plumber">Plumber</option>
							<option value="Writer">Writer</option>
							<option value="Police">Police</option>
							<option value="Scientist">Scientist</option>
							<option value="Architect">Architect</option>
							<option value="Tailor">Tailor</option>
							<option value="Artist">Artist</option>
							<option value="Welder">Welder</option>
							<option value="Actor">Actor</option>
							<option value="Other">Other</option>
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
										id="file" name="file" class="file form-control" type="file" onchange="fileCheck1(this.id);"
										accept="image/jpg,image/png,image/jpeg,image/gif">
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
					<input type="radio" name="yesno" value="Yes"> Yes </label> 
					<label class="radio-inline"> 
					<input type="radio" name="yesno" checked value="No"> No
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
						<select class="form-control" id="memberType" name="memberType" onchange="selectAmount(id);">
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
						<input type="text" class="form-control" id="amount" name="amount" value="500.00" disabled>
					</div>
				</div>
			</div>
		</div>

		<!-------------------------Member Registration end--------------------------------------->

		<!-------------------------submit button--------------------------------------->
		<div class="col-md-12">
			<div class="submit_button text-right">
				<a href='#'><button class="btn btn-success btn-sm text-right "
						onclick="memberFarmValidation();">Submit</button></a>
			</div>
			<div class="message" id="memberfrm_message">
				<h3>
					<aside class="formFailMsg" id="memberRegFailMsg"></aside>
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
					<label for="farm_name">Farm Name *</label> <span class="errMsg" id="errMemFarmName"></span>
					<input type="text"
						class="form-control" id="farmName" name="farmName" maxlength="30"
						onkeyup="validateTitle(id,'Farm Name','errMemFarmName',3,30);">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="farm_place_city">Farm Place/City *</label> <span class="errMsg" id="errMemFarmPlace"></span>
					<input type="text" class="form-control" id="farmPlace" name="farmPlace" maxlength="30"
					onkeyup="validateTitle(id,'Farm Place/City','errMemFarmPlace',3,30);">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="farm_address">Farm Address</label> <span class="errMsg" id="errMemFarmAddress"></span>
					<textarea class="form-control" rows="5" id="farmAddress"
						name="farmAddress" maxlength="250"></textarea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="mandal">Mandal *</label> <span class="errMsg" id="errMemFarmMandal"></span>
					<input type="text"
						class="form-control" id="farmMandal" name="farmMandal" maxlength="30" onkeyup="validateTitle(id,'Mandal','errMemFarmMandal',3,30);">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="district">District *</label> <span class="errMsg" id="errMemFarmDistrict"></span>
					<input type="text"
						class="form-control" id="farmDistrict" name="farmDistrict" maxlength="30" onkeyup="validateTitle(id,'District','errMemFarmDistrict',3,30)">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="about_you_farm">About You/Farm</label>
					<textarea class="form-control" rows="5" id="aboutFarm"
						name="aboutFarm" maxlength="250"></textarea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="farm_state">Farm State</label> <select
						class="form-control" id="farmState" name="farmState">
						<!-- <option selected="selected" >--select--</option> -->
						<option value="Andra Pradesh">Andra Pradesh</option>
							<option value="Arunachal Pradesh">Arunachal Pradesh</option>
							<option value="Assam">Assam</option>
							<option value="Bihar">Bihar</option>
							<option value="Chattisgarh">Chattisgarh</option>
							<option value="Goa">Goa</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Haryana">Haryana</option>
							<option value="Himachal Pradesh">Himachal Pradesh</option>
							<option value="Jammu Kashmir">Jammu Kashmir</option>
							<option value="Jharkhand">Jharkhand</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Kerala">Kerala</option>
							<option value="Madya Pradesh">Madya Pradesh</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Manipur">Manipur</option>
							<option value="Meghalaya">Meghalaya</option>
							<option value="Migoram">Migoram</option>
							<option value="Nagaland">Nagaland</option>
							<option value="Odish">Odish</option>
							<option value="Punjab">Punjab</option>
							<option value="Rajasthan">Rajasthan</option>
							<option value="Sikkim">Sikkim</option>
							<option value="Tamilnadu">Tamilnadu</option>
							<option value="Telangana">Telangana</option>
							<option value="Tripura">Tripura</option>
							<option value="Uttarpradesh">Uttarpradesh</option>
							<option value="Uttarakhand">Uttarakhand</option>
							<option value="Westbengal">Westbengal</option>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="farm_pin_code">Farm Pin Code</label> <span class="errMsg" id="errFarmPincode"></span>
					<input type="text"
						class="form-control" id="farmPincode" name="farmPincode" maxlength="6"  onkeyup="pincodeCheck(id,'Farm Pin Code','errFarmPincode');">
				</div>
			</div>

			<!-------------------------Upload Photo--------------------------------------->
			<div id="gallery_section">
				<div class="container">
					<div class="row">

						<!----------------------farm photo_gallery------------------------------>
               <div class="row">
					<div class="col-md-12">
						<div class="col-md-2">
							<div class="image">
								<img src="images/img.png"
									class="img-responsive img-thumbnail g-image" href="#"
									data-image-id="2" data-toggle="modal" data-title=""
									data-caption="" data-image="images/placeholder.jpg"
									data-target="#image-gallery">
							</div>
						</div>
						<div class="upload_img">
							<form method="post" action="emp/commonUtils/upload"
								enctype="multipart/form-data">
								<div class="form-group col-md-6">
									<label for="Upload Photo">Select Photo(s)</label> 
									<input id="fileFarm" name="fileFarm" class="file form-control" type="file" multiple="multiple" onchange="fileCheck(this.id);"
									accept="image/jpg,image/png,image/jpeg,image/gif,video/mp4,video/mov,video/wmv,video/flv,video/avi">
								</div>
							</form>
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
				

						<!----------------------farm photo_gallery end------------------------------>

						<!----------------------video_gallery------------------------------>

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
$(document).ready(function() {
    $('#profession').click(function(e) {
    	sortDropDownListByText("#profession");
    });
    
    $('#title').click(function(e) {
    	sortDropDownListByText("#title");
    });
    
    $('#state').click(function(e) {
    	sortDropDownListByText("#state");
    });
    
    $('#farmState').click(function(e) {
    	sortDropDownListByText("#farmState");
    });

    $('#memberType').click(function(e) {
    	sortDropDownListByText("#memberType");
    });
});

 function sortDropDownListByText(selItem) {
	$(selItem).each(function() {
		var selectedValue = $(this).val();
		$(this).html($("option", $(this)).sort(function(a, b) {
			return a.text.toUpperCase() == b.text.toUpperCase() ? 0 : a.text.toUpperCase() < b.text.toUpperCase() ? -1 : 1
		}));
		$(this).val(selectedValue);
	});
} 


$(function(){
	if($('[name="yesno"]:checked').val() == 'No'){
		$('#moreFields').html('');
	}
	$(document).on('change','[name="yesno"]',function(){
					var html = '';
		if($(this).val() == 'Yes' ){
			html = $('#farmFields').html();			
		}
		$('#moreFields').html(html);
	})
	
})
var sortSelect = function (select, attr, order) {
    if(attr === 'text'){
        if(order === 'asc'){
            $(select).html($(select).children('option').sort(function (x, y) {
                return $(x).text().toUpperCase() < $(y).text().toUpperCase() ? -1 : 1;
            }));
            $(select).get(0).selectedIndex = 0;
        }// end asc
        if(order === 'desc'){
            $(select).html($(select).children('option').sort(function (y, x) {
                return $(x).text().toUpperCase() < $(y).text().toUpperCase() ? -1 : 1;
            }));
            $(select).get(0).selectedIndex = 0;
        }// end desc
    }

};

</script>
</body>
</html>
<jsp:include page="login.jsp" />
