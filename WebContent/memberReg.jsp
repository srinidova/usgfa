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
function memberFarmValidation() {
	//alert("==Entered==");
	$("#memberMessage").text("");
	//alert("==1==");
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
	var farmName = document.getElementById("farmName");
	var farmPlace = document.getElementById("farmPlace");
	var farmAddress = document.getElementById("farmAddress");
	var farmMandal = document.getElementById("farmMandal");
	var farmDistrict = document.getElementById("farmDistrict");
	var aboutFarm = document.getElementById("aboutFarm");
	var farmPincode = document.getElementById("farmPincode");
	//alert("==2==");
	if (emptyCheck(firstName, "First Name", "memberMessage")
			&& minLenCheck(firstName, 5, "First Name", "memberMessage")
			&& maxLenCheck(firstName, 10, "First Name", "memberMessage")
			&& allLetter(firstName, "First Name", "memberMessage")
			&& emptyCheck(middleName, "Middle Name", "memberMessage")
			&& emptyCheck(lastName, "Surname/Last Name", "memberMessage")
			&& emptyCheck(mobile, "Mobile/Contact No ", "memberMessage")
			&& allNumber(mobile, "Mobile/Contact No ", "memberMessage")
			&& minLenCheck(mobile, 10, "Mobile/Contact No", "memberMessage")
			&& maxLenCheck(mobile, 10, "Mobile/Contact No", "memberMessage")
			/* && allNumber(email, "Email", "memberMessage") */
			&& emptyCheck(email, "Email ", "memberMessage")
			&& emptyCheck(address, "Address", "memberMessage")
			&& emptyCheck(place, "Place/City", "memberMessage")
			&& emptyCheck(mandal, "Mandal", "memberMessage")
			&& emptyCheck(district, "District", "memberMessage")
			&& emptyCheck(pincode, "Pin Code", "memberMessage")
			&& allNumber(pincode, "Pin Code", "memberMessage")
			&& minLenCheck(pincode, 6, "Pin Code", "memberMessage")
			&& maxLenCheck(pincode, 6, "Pin Code", "memberMessage")
			&& emptyCheck(farmName, "Farm Name", "memberMessage")
			&& emptyCheck(farmPlace, "Farm Place/City", "memberMessage")
			&& emptyCheck(farmAddress, "Farm Address", "memberMessage")
			&& emptyCheck(farmMandal, "Mandal", "memberMessage")
			&& emptyCheck(farmDistrict, "District", "memberMessage")
			&& emptyCheck(aboutFarm, "About You/Farm", "memberMessage")
			&& emptyCheck(farmPincode, "Farm Pin Code", "memberMessage")
			&& allNumber(farmPincode, "Farm Pin Code", "memberMessage")
			&& minLenCheck(farmPincode, 6, "Farm Pin Code", "memberMessage")
			&& maxLenCheck(farmPincode, 6, "Farm Pin Code", "memberMessage")
			) {

		saveMember();
	}

}


	function saveMember(){
	alert(" in to js page----------------");
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
	
	////alert("---------in to farm page---------haveFarm=="+haveFarm);
	var memberType = $("#memberType").val();
	////alert("memberType----------------"+memberType);
	var farmName = $("#farmName").val();
	var farmPlace = $("#farmPlace").val();
	var farmAddress = $("#farmAddress").val();
	var farmMandal = $("#farmMandal").val();
	var farmDistrict = 	$("#farmDistrict").val();
	var aboutFarm = $("#aboutFarm").val();
	var farmState = $("#farmState").val();
	var farmPincode = $("#farmPincode").val();
	
	////alert("title----------------"+title);
	////alert("firstName----------------"+firstName);
	////alert("profession----------------"+profession);
	alert("farmName----------------"+farmName);
	
	
	
	var memberObject = new Object();
	////alert("------------a-----------");
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
	//alert("------------f-----------");
	
	/* UploadFile uploadFile = new UploadFile();
	uploadFile.fileId = fileId; */
	
	$
	.ajax({
		data : memberObject,
		url : "emp/memberService/addMember",
		success : function(data) {
			if (data.Msg = "success") {
				alert("b4...........");
				window.location.href = "memberList.jsp";
				//alert("a4...........");
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

</script>
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
							<label for="first_name">First Name *</label> <input type="text"
								class="form-control" id="firstName" name="firstName">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="middle_name">Middle Name</label> <input type="text"
								class="form-control" id="middleName" name="middleName">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="surname_last_name">Surname/Last Name</label> <input
								type="text" class="form-control" id="lastName" name="lastName">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="mobile_contact_no">Mobile/Contact No *</label> <input
								type="text" class="form-control" id="mobile" name="mobile">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="email">Email</label> <input type="text"
								class="form-control" id="email" name="email">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="address">Address</label>
							<textarea class="form-control" rows="4" id="address"
								name="address"></textarea>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="place_city">Place/City *</label> <input type="text"
								class="form-control" id="place" name="place">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="mandal">Mandal *</label> <input type="text"
								class="form-control" id="mandal" name="mandal">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="district">District *</label> <input type="text"
								class="form-control" id="district" name="district">
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
							<label for="pin_code">Pin Code *</label> <input type="text"
								class="form-control" id="pincode" name="pincode">
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
							onclick="memberFarmValidation();">Submit</button></a>
				</div>
				<div class="message">
					<h3><aside class=" " id="memberMessage" style="display: none">Save Sucessfully</aside></h3>
				</div>
				<h4>* These fields are required</h4>
			</div>

			<!-------------------------submit button end--------------------------------------->


			<div class="clearfix"></div>
		</div>
	</div>
	<div id="">
		<div class="col-md-12">
			<div class="member_registration">
				<h2>Farm Info</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="farm_name">Farm Name *</label> <input type="text"
							class="form-control" id="farmName" name="farmName">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="farm_place_city">Farm Place/City *</label> <input
							type="text" class="form-control" id="farmPlace" name="farmPlace">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="farm_address">Farm Address *</label>
						<textarea class="form-control" rows="5" id="farmAddress"
							name="farmAddress"></textarea>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="mandal">Mandal *</label> <input type="text"
							class="form-control" id="farmMandal" name="farmMandal">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="district">District *</label> <input type="text"
							class="form-control" id="farmDistrict" name="farmDistrict">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="about_you_farm">About You/Farm</label>
						<textarea class="form-control" rows="5" id="aboutFarm"
							name="aboutFarm"></textarea>
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
						<label for="farm_pin_code">Farm Pin Code *</label> <input
							type="text" class="form-control" id="farmPincode"
							name="farmPincode">
					</div>
				</div>

				<!-------------------------Upload Photo--------------------------------------->
				<div class="row">
					<div class="col-md-12">
						<!--<div class="col-md-3">
          <div class="image"> <img src="images/img.png" class="img-responsive"> </div>
        </div>-->
						<div class="upload_img">
						<form method="post" action="emp/commonUtils/upload" enctype="multipart/form-data">
							<div class="form-group col-md-7">
								<label for="Upload Photo">Upload Farm Photo(s)</label> 
								<input id="file"  name ="file" class="file form-control" type="file">
								<a href="#"><button class="btn btn-success btn-sm text-right">Upload</button></a>
							</div>
							</form>
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
</body>
</html>
<jsp:include page="login.jsp" />
