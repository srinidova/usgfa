<!doctype html>
<html>
<head>
<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript">
function memberFarmValidation() {
	//alert("---- 0-------");

	$("#eventRegFailMsg").text("");
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
	//alert("haveFarm=="+haveFarm);
	
	var farmName = document.getElementById("farmName");
	var farmPlace = document.getElementById("farmPlace");
	var farmAddress = document.getElementById("farmAddress");
	var farmMandal = document.getElementById("farmMandal");
	var farmDistrict = document.getElementById("farmDistrict");
	var aboutFarm = document.getElementById("aboutFarm");
	var farmPincode = document.getElementById("farmPincode");
	//alert("---- 1-------");
	if (firstName.value.length == 0) {
		//alert("----firstName zero-------");
		msg = "errFirstName";
		title = "First Name ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		firstName.focus();
		return false;
	} else if (mobile.value.length == 0) {
		//alert("----date zero-------");
		msg = "errMobile";
		title = "Mobile/Contact No";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		mobile.focus();
		return false;
	}else if (email.value.length == 0) {
		//alert("----date zero-------");
		msg = "errEmail";
		title = "Email";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		email.focus();
		return false;
	}else if (place.value.length == 0) {
		//alert("----date zero-------");
		msg = "errPlace";
		title = "Place/City";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		place.focus();
		return false;
	}else if (mandal.value.length == 0) {
		//alert("----date zero-------");
		msg = "errMandal";
		title = "Mobile/Contact No";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		mandal.focus();
		return false;
	}else if (district.value.length == 0) {
		//alert("----date zero-------");
		msg = "errDistrict";
		title = "District";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		district.focus();
		return false;
	}else if (pincode.value.length > 0 && pincode.value.length != 6) {
		//alert("----date zero-------");
		msg = "errMemRegPinCode";
		title = "Pin Code";

		$("#" + msg).text(title + " must have six numbers");
		$("#" + msg).show();
		pincode.focus();
		return false;
	}else if (haveFarm == 'yes' && farmName.value.length == 0) {
		//alert("----date zero-------");
		msg = "errMemFarmName";
		title = "Farm Name";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmName.focus();
		return false;
	}else if (haveFarm == 'yes' && farmPlace.value.length == 0) {
		//alert("----date zero-------");
		msg = "errMemFarmPlace";
		title = "Farm Place/City";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmPlace.focus();
		return false;
	}/* else if (haveFarm == 'yes' && farmAddress.value.length == 0) {
		//alert("----date zero-------");
		msg = "errMemFarmAddress";
		title = "Farm Address";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmAddress.focus();
		return false;
	} */else if (haveFarm == 'yes' && farmMandal.value.length == 0) {
		//alert("----date zero-------");
		msg = "errMemFarmMandal";
		title = "Mandal";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmMandal.focus();
		return false;
	}else if (haveFarm == 'yes' && farmDistrict.value.length == 0) {
		//alert("----date zero-------");
		msg = "errMemFarmDistrict";
		title = "District";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmDistrict.focus();
		return false;
	}else if (haveFarm == 'yes' && farmPincode.value.length > 0 && farmPincode.value.length != 6) {
		//alert("----date zero-------");
		msg = "errFarmPincode";
		title = "Farm Pin Code";

		$("#" + msg).text(title + " must have six numbers");
		$("#" + msg).show();
		farmPincode.focus();
		return false;
	}else{
		//alert("------ form true ----------");
		$("#eMail").text("");
		$("#farmName").text("");
		$("#farmPlace").text("");
		$("#farmMandal").text("");
		$("#farmDistrict").text("");
		$("#farmPincode").text("");
		saveMember();
	}

}

	function saveMember(){
	//alert(" in to js page----------------");
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
	
	//alert("---------in to farm page---------haveFarm=="+haveFarm);
	var memberType = $("#memberType").val();
	//alert("memberType----------------"+memberType);
	var farmName = $("#farmName").val();
	var farmPlace = $("#farmPlace").val();
	var farmAddress = $("#farmAddress").val();
	var farmMandal = $("#farmMandal").val();
	var farmDistrict = 	$("#farmDistrict").val();
	var aboutFarm = $("#aboutFarm").val();
	var farmState = $("#farmState").val();
	var farmPincode = $("#farmPincode").val();
	var amount = $("#amount").val();
	
	////alert("title----------------"+title);
	////alert("firstName----------------"+firstName);
	////alert("profession----------------"+profession);
	//alert("farmName----------------"+farmName);
	
	
	
	var memberObject = new Object();
	//alert("------------a-----------");
	memberObject.title =title;
	//alert("------------b-----------")
	memberObject.firstName=firstName;
	memberObject.middleName = middleName;
	memberObject.lastName = lastName
	memberObject.mobile = mobile;
	memberObject.email = email;
	memberObject.address = address;
	memberObject.place = place;
	memberObject.mandal = mandal;
	memberObject.district = district;
	memberObject.state = state;
	memberObject.pincode = pincode;
	memberObject.profession = profession;
	memberObject.farmName = farmName;
	memberObject.farmPlace = farmPlace;
	memberObject.farmAddress = farmAddress;
	memberObject.farmMandal = farmMandal;
	memberObject.farmDistrict = farmDistrict;
	memberObject.aboutFarm = aboutFarm;
	memberObject.farmState = farmState;
	//alert("------------c-----------");
	memberObject.farmPincode = farmPincode;
	//alert("------------d-----------");
	memberObject.memberType = memberType;
	//alert("------------e-----------");
	memberObject.haveFarm = haveFarm;
	memberObject.amount = amount;
	//alert("------------f-----------");
	
	//alert("----------");
	
	$
	.ajax({
		data : memberObject,
		url : "emp/memberService/addMember",
		success : function(data) {
			if (data.Msg == 'success') {
				//alert(".....success......");
				window.location.href = "memberList.jsp";
				//alert("a4...........");
			}else{
				//alert(".....error......");
				$("#eventRegFailMsg").text("Member Registration Failed");
			} 
		}
	});
	$
	.ajax({
		data : uploadFile,
		url : "emp/memberService/getMemberImages",
		success : function(data) {
			if (data.Msg = "success") {
				//alert("b4...........");
				//window.location.href = "newsList.jsp";
				//alert("a4...........");
			}
		}
	});
}

	function pincodeCheck(fName, title, msg) {
		 //alert("allLetter==fName=="+fName+"----title=="+title+"----msg=="+msg);
		//alert("== allNumber ==");
		var fieldName = document.getElementById(fName);
		//alert("== fieldName =="+fieldName);
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
		 //alert("allLetter==fName=="+fName+"----title=="+title+"----msg=="+msg);
		//alert("== allNumber ==");
		var fieldName = document.getElementById(fName);
		//alert("== fieldName =="+fieldName);
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
	/* function ValidateEmail(fName, title, msg)   
	{  
		var fieldName = document.getElementById(fName);
        var emailval = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(myForm.emailAddr.value);
	 if (fieldName.value.match(emailval))  
	  {  
	    return (true)  
	  }  else{
		  alert("You have entered an invalid email address!")  
		    return (false) 
	  }
	    
	} */ 
	function selectAmount(fName){
		var fieldName = document.getElementById(fName);
		//alert("----fieldName-------"+fieldName.value);
		if(fieldName.value == 'Life'){
			//alert("----fieldName222222222-------");
			document.getElementById("amount").value = '15,000.00';
		}else{
			document.getElementById("amount").value = '500.00';
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
						</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="first_name">First Name *</label> <span class="errMsg" id="errFirstName"></span>
						<input type="text" class="form-control" id="firstName" name="firstName" maxlength="30"
						onkeyup="validateTitle(id,'First Name','errFirstName',5,30);">
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
							class="form-control" id="email" name="email" maxlength="30" onkeyup="eMail(id,'Email','errEmail');">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="address">Address</label> <span class="errMsg" id="errAddress"></span>
						<textarea class="form-control" rows="4" id="address"
							name="address"  maxlength="250" onkeyup="validateTitle(id,'Address','errAddress',5,250);">
						</textarea>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="place_city">Place/City *</label> <span class="errMsg" id="errPlace"></span>
						<input type="text" class="form-control" id="place" name="place" maxlength="30" onkeyup="validateTitle(id,'Place/City','errPlace',5,30);">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="mandal">Mandal *</label> <span class="errMsg" id="errMandal"></span>
						<input type="text" class="form-control" id="mandal" name="mandal" maxlength="30" onkeyup="validateTitle(id,'Mandal','errMandal',5,30);">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="district">District *</label> <span class="errMsg" id="errDistrict"></span>
						<input type="text" class="form-control" id="district" name="district" maxlength="30" onkeyup="validateTitle(id,'District','errDistrict',5,30);">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="state">State</label> <select class="form-control"
							id="state" name="state">
							<!-- <option selected="selected" >--select--</option> -->
							<option value="Telangana">Telangana</option>
							<option value="AndhraPradesh">AndhraPradesh</option>
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
					<input type="radio" name="yesno" value="yes"> Yes </label> 
					<label class="radio-inline"> 
					<input type="radio" name="yesno" checked value="no"> No
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
				<aside class="formFailMsg" id="eventRegFailMsg"></aside>
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
						onkeyup="validateTitle(id,'Farm Name','errMemFarmName',5,30);">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="farm_place_city">Farm Place/City *</label> <span class="errMsg" id="errMemFarmPlace"></span>
					<input type="text" class="form-control" id="farmPlace" name="farmPlace" maxlength="30"
					onkeyup="validateTitle(id,'Farm Place/City','errMemFarmPlace',5,30);">
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
						class="form-control" id="farmMandal" name="farmMandal" maxlength="30" onkeyup="validateTitle(id,'Mandal','errMemFarmMandal',5,30);">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="district">District *</label> <span class="errMsg" id="errMemFarmDistrict"></span>
					<input type="text"
						class="form-control" id="farmDistrict" name="farmDistrict" maxlength="30" onkeyup="validateTitle(id,'District','errMemFarmDistrict',5,30)">
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
						<option>Telangana</option>
						<option>AndhraPradesh</option>
						<!-- <option>3</option>
							<option>4</option> -->
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
			<div class="row">
				<div class="col-md-12">
					<!--<div class="col-md-3">
          <div class="image"> <img src="images/img.png" class="img-responsive"> </div>
        </div>-->
					<div class="upload_img">
						<form method="post" action="emp/commonUtils/upload"
							enctype="multipart/form-data">
							<div class="form-group col-md-7">
								<label for="Upload Photo">Upload Farm Photo(s)</label> <input
									id="file" name="file" class="file form-control" type="file">
								<a href="#"><button
										class="btn btn-success btn-sm text-right">Upload</button></a>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div id="gallery_section">
				<div class="container">
					<div class="row">

						<!----------------------photo_gallery------------------------------>


						<!----------------------photo_gallery end------------------------------>

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
$(function(){
	if($('[name="yesno"]:checked').val() == 'no'){
		$('#moreFields').html('');
	}
	$(document).on('change','[name="yesno"]',function(){
					var html = '';
		if($(this).val() == 'yes' ){
			html = $('#farmFields').html();			
		}
		$('#moreFields').html(html);
	})
	
})


</script>
</body>
</html>
<jsp:include page="login.jsp" />
