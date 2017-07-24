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

<script type="text/javascript">
	function memberEditFarmValidation() {
		var number = /^[0-9]+$/;
		var emailChk = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/;

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
		var editfileFarm = $("#editfileFarm")[0].files[0];
		var file = $('#file').val().split('.').pop().toLowerCase();
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
	}else if (email.value.length > 0 && !email.value.match(emailChk) ) {
    	msg = "errEditMemEmail";
		title = "Email";

		$("#" + msg).text(title + " please enter valid email");
		$("#" + msg).show();
		email.focus();
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
	}else if (pincode.value.length > 0 && !pincode.value.match(number) ) {
		msg = "errEditMemPincode";
		title = "Pin Code";

		$("#" + msg).text(title + " must have numbers only");
		$("#" + msg).show();
		pincode.focus();
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
	}else if (haveFarm == 'yes' && farmPincode.value.length > 0 && !farmPincode.value.match(number)) {
		msg = "errMemberFarmEditFarmPincode";
		title = "Farm Pin Code";

		$("#" + msg).text(title + " must have numbers only ");
		$("#" + msg).show();
		farmPincode.focus();
		return false;
	}else{
		$("#memberFarmEditFarmName").text("");
		$("#memberFarmEditFarmPlace").text("");
		$("#memberFarmEditFarmMandal").text("");
		$("#memberFarmEditFarmDistrict").text("");
		$("#errMemberFarmEditFarmPincode").text("");
		$("#errEditMemEmail").text("");
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
						
						$.each(data.EditMember,
								function(key, val) {
							//alert(data.EditMember[key].haveFarm);
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
							document.getElementById("memberImg").src = data.EditMember[key].filePath;
						})
						showFarmData();
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
		var file = $("#file")[0].files[0];
		var editfileFarm = $("#editfileFarm")[0].files[0];
		
	var formData = new FormData();
	formData.append("memberId", memberId);
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
	formData.append("farmId", farmId);
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
	//formData.append("editfileFarm", editfileFarm);
	//formData.append("editfileFarm", $("#editfileFarm")[0].files[0]);
	//formData.append('editfileFarm',  $("#editfileFarm")[0].files[i]);
	for (var i = 0; i < $("#editfileFarm")[0].files.length; i++)
		formData.append('editfileFarm',  $("#editfileFarm")[0].files[i]);
	

	$.ajax({
		type: 'POST',
		url : "emp/memberService/memberUpdate",
    	data: formData,
    	cache: false,
    	contentType: false,
    	processData: false,
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
				showFarmImages(data);
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

	function showFarmImages(data){
		var dispImages = '';
		var dispClas = '';
		var dispChkd = '';
		var dispItem = '';
		var imgCtrl = true;
		//alert("in to "+data.FARMFILES);
		
		if(data.FARMFILES != null ){
		$.each(
				data.FARMFILES,
				function(key, val) {
					imgCtrl = false;
					var filename = data.FARMFILES[key].filePath;
					var fExt = filename.split('.').pop();
					if(fExt != null && ((fExt == 'mp4') || (fExt == 'wmv') || (fExt == 'avi') || (fExt == 'flv') || (fExt == 'mov'))){
						dispItem = '<iframe src="'+data.FARMFILES[key].filePath+'" autoplay="false" autostart="false" style="text-align: center;width: 100%" type="audio/mp4" height="100" width="100" align="middle"></iframe>';
					}else{
						dispItem = '<img src="'+data.FARMFILES[key].filePath+'" class="img-responsive" alt="" height="100" width="100" align="middle">';
					}
					//alert("in to FARMFILES "+data.FARMFILES.length);
					//alert(data.FARMFILES[key].fileId);
					
					
					if(data.FARMFILES[key].showPublic == 1){
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
									+'<a class="g-image" href="#" data-image-id="" data-toggle="modal" data-title="" data-caption="" data-image="'+data.FARMFILES[key].filePath+'" data-target="#image-gallery">'
									  +dispItem
									+'</a>'
								+'</div>'
								+'<div class="caption">'
									+'<div class="checkbox">'
										+'<label>'
										    +'<input id="'+data.FARMFILES[key].fileId+'" onclick="updateShowAsPublicFarm(this.id);" type="checkbox" value="'+data.FARMFILES[key].fileId+'" name="remember"  '+ dispChkd +'> Show as Public'
										+'</label>'
										+'<div class="suceee_msg"></div>'
									+'</div>'
									+'<div class="delete_box">'
										+'<a href="#" name="'+data.FARMFILES[key].fileId+'" onclick="deleteFileFarm(this.name);"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
										+'<div class="suceee_msg"></div>'
									+'</div>'
								+'</div>'
							+'</div>'
						+'</li>'
					+'</ul>'
				+'</div>'
				})
				//alert("------dispImages--------"+dispImages);
				document.getElementById("farmEditImages").innerHTML = dispImages;
				$.getScript('js/popup.js');
		}
		 if(imgCtrl){
			document.getElementById("farmEditImgCont").style.display = 'none';
		}  
	}
	function deleteFileFarm(fileId){
		var delConfirm = confirm("Are you sure to delete");
		if(delConfirm == false){
			return false;
		}else{
			var farmObject = new Object();
			farmObject.fileId = fileId;
			farmObject.type = "FARM";
			$.ajax({
				data : farmObject,
				url : "emp/uploadService/deleteImage",
				success : function(data){
					if(data.Msg = 'success'){
						showFarmImages(data);
					}
				}
			});
		}
	}
	function updateShowAsPublicFarm(fileId){
		var setVal = '';
		if(document.getElementById(fileId).checked){
			setVal = '1';
		}else{
			setVal = '0';
		}
		var uploadFileObject = new Object();
		uploadFileObject.fileId = fileId; 
		uploadFileObject.showAsPublic = setVal;
		uploadFileObject.type = "FARM";
			$.ajax({
			data : uploadFileObject,
			url : "emp/uploadService/updateShowAsPublic",
			success : function(data) {
				if (data.Msg = "success") {
					showFarmImages(data);
				}
			}
		}); 
	}
	function fileCheck1(obj) {
		//alert("in to memberEdit fileCheck1");
		//alert("in to file check"+$("#"+obj).val());
		 var fileInput = document.getElementById('file');
		    var filePath = fileInput.value;
		    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
		    if(!allowedExtensions.exec(filePath)){
		       // alert('Please upload file having extensions .jpeg/.jpg/.png/.gif only.');
		        fileInput.value = '';
		        return false;
		    }else{

		    }

	}
	function fileCheck(obj) {
		//alert("in to memberEdit fileCheck");
		//alert("in to file check"+$("#"+obj).val());
		 var fileInput = document.getElementById('editfileFarm');
		    var filePath = fileInput.value;
		    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif|\.mp4|\.mov|\.wmv|\.flv|\.avi)$/i;
		    if(!allowedExtensions.exec(filePath)){
		        //alert('Please upload file having extensions .jpeg/.jpg/.png/.gif only.');
		        fileInput.value = '';
		        return false;
		    }else{

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
							<option value="Mrs">Mrs</option>
							<option value="Madam">Madam</option>
							<option value="Captain">Captain</option>
							<option value="Rev">Rev</option>
							<option value="Hon">Hon</option>
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
							class="form-control" id="memberEditEmail" name="memberEditEmail" maxlength="30" onkeyup="eMail(id,'','errEditMemEmail');">
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
						<label for="pin_code">Pin Code</label> <span class="errMsg" id="errEditMemPincode"></span>
						<input type="text"
							class="form-control" id="memberEditPincode"
							name="memberEditPincode" maxlength="6" onkeyup="pincodeCheck(id,'Pin Code','errEditMemPincode');">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="profession">Profession</label> 
						<select class="form-control" id="memberEditProfession" name="memberEditProfession">
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
								<img src="images/img.png" id="memberImg"
									class="img-responsive img-thumbnail g-image" href="#"
									data-image-id="1" data-toggle="modal" data-title=""
									data-caption="">
							</div>
						</div>
						<div class="upload_img">
							<form method="post" action="emp/commonUtils/upload"
								enctype="multipart/form-data">
								<div class="form-group col-md-6">
									<label for="Upload Photo">Select Photo</label> <input
										id="file" name="file" class="file form-control" type="file" onchange="fileCheck1(this.id);"
										accept="image/jpg,image/png,image/jpeg,image/gif,video/mp4,video/mov,video/wmv,video/flv,video/avi">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>




			<!-------------------------Upload Photo end--------------------------------------->

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
							<div class="modal-body" id="modelBodyNewsProf">
							    <img id="image-gallery-image" align="middle" class="img-responsive" src="">
							</div>
							<div class="modal-footer">
								<div class="col-md-2">
									<button type="button" class="btn btn-primary"
										id="show-previous-image" style="display: none;">Previous</button>
								</div>
								<div class="col-md-8 text-justify" id="image-gallery-caption"></div>
								<div class="col-md-2">
									<button type="button" id="show-next-image"
										class="btn btn-primary">Next</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!----------------------photo_gallery end------------------------------>



		<!-------------------------Farm Info--------------------------------------->
		<div class="farm_info">
			<div class="col-md-12">
				<div id="haveFarm" class="form-group">
					<h2>Do you have Farm</h2>
					<label class="radio-inline"> 
						<input type="radio" name="yesno" id="yesno" value="Yes" onclick="test()"> Yes
					</label> 
					<label class="radio-inline"> 
						<input type="radio" name="yesno" id="yesno"  checked value="No" onclick="deleteFarm()"> No
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
        </div>--><div class="col-md-2">
							<div class="image">
								<img src="images/img.png"
									class="img-responsive img-thumbnail g-image" href="#"
									data-image-id="1" data-toggle="modal" data-title=""
									data-caption="">
							</div>
						</div>
					<div class="upload_img">
					<form method="post" action="emp/commonUtils/upload"
								enctype="multipart/form-data">
						<div class="form-group col-md-7">
							<label for="Upload Photo">Upload Farm Photo(s)</label> <input
								id="editfileFarm"  name="editfileFarm" class="file form-control" type="file"  multiple="multiple" onchange="fileCheck(this.id);"
								accept="image/jpg,image/png,image/jpeg,image/gif,video/mp4,video/mov,video/wmv,video/flv,video/avi">
						</div>
						</form>
					</div>
				</div>
			</div>
			<div id="gallery_section">
				<div class="container">
					<div class="row">

						<!----------------------photo_gallery------------------------------>
			<div class="col-md-5" style="margin-left: 250px;">
				<div class="row">

					<div class="col-md-12" style="margin-bottom: 10px;" id="farmEditImgCont">
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
						<div class="carousel-inner" id="farmEditImages">
						</div>
				</div>
				
			</div>
						<!----------------------photo_gallery end------------------------------>

						

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
    $('#memberEditProfession').click(function(e) {
    	sortDropDownListByText("#memberEditProfession");
    });
    
    $('#memberEditTitle').click(function(e) {
    	sortDropDownListByText("#memberEditTitle");
    });
    
    $('#memberEditState').click(function(e) {
    	sortDropDownListByText("#memberEditState");
    });
    
    $('#memberFarmEditFarmState').click(function(e) {
    	sortDropDownListByText("#farmState");
    });
    
    $('#editMemberType').click(function(e) {
    	sortDropDownListByText("#editMemberType");
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
	$(function() {
		if ($('[name="yesno"]:checked').val() == 'No') {
			$('#moreFields').html('');
		}
		$(document).on('change', '[name="yesno"]', function() {
			var html = '';
			if ($(this).val() == 'Yes') {
				html = $('#farmFields').html();
			}
			$('#moreFields').html(html);
		})

	})

	function setRadioCheckedValue(radio_name, val) {
		var oRadio = document.getElementById("yesno");
		for (var i = 0; i < oRadio.length; i++) {
			if (oRadio[i].value == val) {
				oRadio[i].checked;
			}
		}
	}

	function showFarmData() {
		if ($("#memberFarmEditHaveFarm").val() == 'Yes') {
			document.getElementById("yesno").checked = 'true';
			test();
			var html = '';
			html = $('#farmFields').html();
			$('#moreFields').html(html);
	}
	}
	function deleteFarm(){
		//var farmId = $("#memberFarmEditFarmId").val();
		//alert("in to delete farm======"+farmId);
		var delConfirm = confirm("Are you sure to delete existing farm data");
		if(delConfirm == false){
			showFarmData();
		}else{
/* 			var farmObject = new Object();
			farmObject.farmId = farmId;
 			$.ajax({
				data : farmObject,
				url : "emp/farmService/deleteFarm",
				success : function(data) {
					if (data.Msg = "success") {
					}
				}
			});  */
		}
			
	}
</script>
</body>
</html>
<jsp:include page="login.jsp" />
