<!doctype html>
<html>
<head>
<script type="text/javascript" src="js/member.js"></script>
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
	//alert("==Entered==");
	$("#memberMessage").text("");
	//alert("==1==");
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
	var farmName = document.getElementById("memberFarmEditFarmName");
	var farmPlace = document.getElementById("memberFarmEditFarmPlace");
	var farmAddress = document.getElementById("memberFarmEditFarmAddress");
	var farmMandal = document.getElementById("memberFarmEditFarmMandal");
	var farmDistrict = document.getElementById("memberFarmEditFarmDistrict");
	var aboutFarm = document.getElementById("memberFarmEditAboutFarm");
	var farmPincode = document.getElementById("memberFarmEditFarmPincode");
	//alert("==2==");
	if (emptyCheck(firstName, "First Name", "memberMessage")
			&& minLenCheck(firstName, 5, "First Name", "memberMessage")
			&& maxLenCheck(firstName, 30, "First Name", "memberMessage")
			&& allLetter(firstName, "First Name", "memberMessage")
			&& emptyCheck(middleName, "Middle Name", "memberMessage")
			&& allLetter(middleName, "Middle Name", "memberMessage")
			&& emptyCheck(lastName, "Surname/Last Name", "memberMessage")
			&& allLetter(lastName, "Surname/Last Name", "memberMessage")
			&& emptyCheck(mobile, "Mobile/Contact No ", "memberMessage")
			&& allNumber(mobile, "Mobile/Contact No ", "memberMessage")
			&& minLenCheck(mobile, 10, "Mobile/Contact No", "memberMessage")
			&& maxLenCheck(mobile, 10, "Mobile/Contact No", "memberMessage")
			/* && allNumber(email, "Email", "memberMessage") */
			&& emptyCheck(email, "Email ", "memberMessage")
			&& eMail(email, "Email ", "memberMessage")
			&& emptyCheck(address, "Address", "memberMessage")
			&& minLenCheck(address, 5, "Address", "memberMessage")
			&& maxLenCheck(address, 30, "Address", "memberMessage")
			&& emptyCheck(place, "Place/City", "memberMessage")
			&& allLetter(place, "Place/City", "memberMessage")
			&& minLenCheck(place, 5, "Place/City", "memberMessage")
			&& maxLenCheck(place, 30, "Place/City", "memberMessage")
			&& emptyCheck(mandal, "Mandal", "memberMessage")
			&& allLetter(mandal, "Mandal", "memberMessage")
			&& minLenCheck(mandal, 5, "Mandal", "memberMessage")
			&& maxLenCheck(mandal, 30, "Mandal", "memberMessage")
			&& emptyCheck(district, "District", "memberMessage")
			&& allLetter(district, "District", "memberMessage")
			&& minLenCheck(district, 5, "District", "memberMessage")
			&& maxLenCheck(district, 30, "District", "memberMessage")
			&& emptyCheck(pincode, "Pin Code", "memberMessage")
			&& allNumber(pincode, "Pin Code", "memberMessage")
			&& minLenCheck(pincode, 6, "Pin Code", "memberMessage")
			&& maxLenCheck(pincode, 6, "Pin Code", "memberMessage")
			&& emptyCheck(farmName, "Farm Name", "memberMessage")
			&& allLetter(farmName, "Farm Name", "memberMessage")
			&& minLenCheck(farmName, 5, "Farm Name", "memberMessage")
			&& maxLenCheck(farmName, 30, "Farm Name", "memberMessage")
			&& emptyCheck(farmPlace, "Farm Place/City", "memberMessage")
			&& allLetter(farmPlace, "Farm Place/City", "memberMessage")
			&& minLenCheck(farmPlace, 5, "Farm Place/City", "memberMessage")
			&& maxLenCheck(farmPlace, 30, "Farm Place/City", "memberMessage")
			&& emptyCheck(farmAddress, "Farm Address", "memberMessage")
			&& minLenCheck(farmAddress, 5, "Farm Address", "memberMessage")
			&& maxLenCheck(farmAddress, 30, "Farm Address", "memberMessage")
			&& emptyCheck(farmMandal, "Mandal", "memberMessage")
			&& allLetter(farmMandal, "Mandal", "memberMessage")
			&& minLenCheck(farmMandal, 5, "Mandal", "memberMessage")
			&& maxLenCheck(farmMandal, 30, "Mandal", "memberMessage")
			&& emptyCheck(farmDistrict, "District", "memberMessage")
			&& allLetter(farmDistrict, "District", "memberMessage")
			&& minLenCheck(farmDistrict, 5, "District", "memberMessage")
			&& maxLenCheck(farmDistrict, 30, "District", "memberMessage")
			&& emptyCheck(aboutFarm, "About You/Farm", "memberMessage")
			&& minLenCheck(aboutFarm, 5, "About You/Farm", "memberMessage")
			&& maxLenCheck(aboutFarm, 30, "About You/Farm", "memberMessage")
			&& emptyCheck(farmPincode, "Farm Pin Code", "memberMessage")
			&& allNumber(farmPincode, "Farm Pin Code", "memberMessage")
			&& minLenCheck(farmPincode, 6, "Farm Pin Code", "memberMessage")
			&& maxLenCheck(farmPincode, 6, "Farm Pin Code", "memberMessage")
			) {

		memberUpdate1();
	}

}

$(document).ready(function() {
	//alert("-------in editMember--Jsp---");
	$.ajax({
		url : "emp/memberService/editMember",
		success : function(data) {
				$.each(
						data.EditMember,
						function(key, val) {
							//alert("-------in editMember--Jsp---memberTitle=="+data.EditMember[key].title);
						$('#memberId').val(data.EditMember[key].memberId);	
						$('#memberEditTitle').val(data.EditMember[key].title);
					 	$('#memberEditFirstName').val(data.EditMember[key].firstName);
						$('#memberEditMiddleName').val(data.EditMember[key].middleName);
						$('#memberEditLastName').val(data.EditMember[key].lastName);
						$('#memberEditMobile').val(data.EditMember[key].mobile);
						$('#memberEditEmail').val(data.EditMember[key].email);
						$('#memberEditAddress').val(data.EditMember[key].address);
						$('#memberEditPlace').val(data.EditMember[key].place);
						$('#memberEditMandal').val(data.EditMember[key].mandal);
						$('#memberEditDistrict').val(data.EditMember[key].district);
						$('#memberEditState').val(data.EditMember[key].state);
						$('#memberEditPincode').val(data.EditMember[key].pincode);
						$('#memberEditProfession').val(data.EditMember[key].profession);
						}
				)
				$.each(
											data.MemberFarmEdit,
											function(key, val) {
												//alert("memberFarmEditFarmName --------- farmName=="+data.MemberFarmEdit[key].farmState);
												$('#memberFarmEditFarmName').val(data.MemberFarmEdit[key].farmName);
												$('#memberFarmEditFarmPlace').val(data.MemberFarmEdit[key].farmPlace);
												$('#memberFarmEditFarmAddress').val(data.MemberFarmEdit[key].farmAddress);
												$('#memberFarmEditFarmMandal').val(data.MemberFarmEdit[key].farmMandal);
												$('#memberFarmEditFarmDistrict').val(data.MemberFarmEdit[key].farmDistrict);
												$('#memberFarmEditAboutFarm').val(data.MemberFarmEdit[key].aboutFarm);
												$('#memberFarmEditFarmState').val(data.MemberFarmEdit[key].farmState);
												$('#memberFarmEditFarmPincode').val(data.MemberFarmEdit[key].farmPincode);
												$('#memberFarmEditFarmId').val(data.MemberFarmEdit[key].farmId);
												
										})
		}
	});
});
function memberUpdate1(){
	//alert ("in to memberUpdate ");
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
	
	//alert ("--------------a------------------ ");
	
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
	 //alert ("after memberUpdate ");
	 
	 ////alert("--------firstName----------"+memberObject.firstName);
	 //alert("--------middleName----------"+ memberObject.middleName);
	 
	 //alert("in to farm farmId===="+farmId);
	 memberObject.farmId = farmId;
	 memberObject.farmName = farmName;
	 memberObject.farmPlace = farmPlace ;
	 memberObject.farmAddress = farmAddress;
	 memberObject.farmMandal = farmMandal;
	 memberObject.farmDistrict= farmDistrict;
	 memberObject.aboutFarm= aboutFarm;
	 memberObject.farmState = farmState;
	 memberObject.farmPincode = farmPincode;
	 
	 ////alert("--------farmName----------"+memberObject.farmName);
	 
	
	//alert("in to farm update")
$
	.ajax({
		data : memberObject,
		url : "emp/memberService/memberUpdate",
		success : function(data) {
			if (data.Msg = "success") {
				//alert("...........b4............");
				
				
				window.location.href = "memberList.jsp";
			}
		}
	});
	
	
}
/* function memberUpdate(){
	//alert("in to update page ");
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

	
	var memberObject = new Object();
	memberObject.memberId = memberId;
	memberObject.title = title;
	memberObject.firstName = firstName;
	memberObject.middleName = middleName;
	memberObject.lastName = lastName;
	memberObject.mobile = mobile;
	memberObject email= email;
	memberObject address = address;
	memberObject place = place;
	memberObject mandal = mandal;
	memberObject district = district; 
	memberObject state = state;
	memberObject pincode = pincode;
	memberObject profession = profession;
$
	.ajax({
		data : memberObject,
		url : "emp/memberService/memberUpdate",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
	
}  */
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
							</select>
							 <input type="hidden" class="form-control" id="memberId"
							name="memberId">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="first_name">First Name</label> <input type="text"
								class="form-control" id="memberEditFirstName" name="memberEditFirstName">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="middle_name">Middle Name</label> <input type="text"
								class="form-control" id="memberEditMiddleName" name="memberEditMiddleName">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="surname_last_name">Surname/Last Name</label> <input
								type="text" class="form-control" id="memberEditLastName" name="memberEditLastName">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="mobile_contact_no">Mobile/Contact No</label> <input
								type="text" class="form-control" id="memberEditMobile" name="memberEditMobile">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="email">Email</label> <input type="text"
								class="form-control" id="memberEditEmail" name="memberEditEmail">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="address">Address</label>
							<textarea class="form-control" rows="4" id="memberEditAddress"
								name="memberEditAddress"></textarea>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="place_city">Place/City</label> <input type="text"
								class="form-control" id="memberEditPlace" name="memberEditPlace">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="mandal">Mandal</label> <input type="text"
								class="form-control" id="memberEditMandal" name="memberEditMandal">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="district">District</label> <input type="text"
								class="form-control" id="memberEditDistrict" name="memberEditDistrict">
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
							<label for="pin_code">Pin Code</label> <input type="text"
								class="form-control" id="memberEditPincode" name="memberEditPincode">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="profession">Profession</label> <select
								class="form-control" id="memberEditProfession" name="memberEditProfession">
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
									<img src="images/img.png" class="img-responsive img-thumbnail g-image" href="#" data-image-id="1" data-toggle="modal" data-title=""
										data-caption="" data-image="images/placeholder.jpg"
										data-target="#image-gallery">
								</div>
							</div>
							<div class="upload_img">
							<form method="post" action="emp/commonUtils/upload" enctype="multipart/form-data">
								<div class="form-group col-md-6">
									<label for="Upload Photo">Select Photo(s)</label> 
									<input id="file"  name ="file" class="file form-control" type="file">
                              <a href="#"><button class="btn btn-success btn-sm text-right">Upload</button></a>
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
						<label class="radio-inline"> <input type="radio"
							name="yesno" value="yes"> Yes
						</label> <label class="radio-inline"> <input type="radio"
							name="yesno" checked value="no"> No
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
							<select class="form-control" id="memberType" name="memberType">
								<option selected="selected" value="Ordinary">Ordinary</option>
								<option value="Life">Life</option>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="amount">Amount</label> <input type="text"
								class="form-control" id="amount" name="amount" disabled>
						</div>
					</div>
				</div>
			</div>

			<!-------------------------Member Registration end--------------------------------------->

			<!-------------------------submit button--------------------------------------->
			<div class="col-md-12">
				<div class="submit_button text-right">
					<a href='#'><button
							class="btn btn-success btn-sm text-right "
							onclick="memberEditFarmValidation();">Submit</button></a>
				</div>
				<div class="message">
					<h3><aside class=" " id="memberMessage" style="display: none">Save Sucessfully</aside></h3>
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
						<label for="farm_name">Farm Name</label> <input type="text"
							class="form-control" id="memberFarmEditFarmName" name="memberFarmEditFarmName">
							<input type="hidden" class="form-control" id="memberFarmEditFarmId"
							name="memberFarmEditFarmId">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="farm_place_city">Farm Place/City</label> <input
							type="text" class="form-control" id="memberFarmEditFarmPlace" name="memberFarmEditFarmPlace">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="farm_address">Farm Address</label>
						<textarea class="form-control" rows="5" id="memberFarmEditFarmAddress"
							name="memberFarmEditFarmAddress"></textarea>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="mandal">Mandal</label> <input type="text"
							class="form-control" id="memberFarmEditFarmMandal" name="memberFarmEditFarmMandal">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="district">District </label> <input type="text"
							class="form-control" id="memberFarmEditFarmDistrict" name="memberFarmEditFarmDistrict">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="about_you_farm">About You/Farm</label>
						<textarea class="form-control" rows="5" id="memberFarmEditAboutFarm"
							name="memberFarmEditAboutFarm"></textarea>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="farm_state">Farm State</label> <select
							class="form-control" id="memberFarmEditFarmState" name="memberFarmEditFarmState">
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
						<label for="farm_pin_code">Farm Pin Code </label> <input
							type="text" class="form-control" id="memberFarmEditFarmPincode"
							name="memberFarmEditFarmPincode">
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
