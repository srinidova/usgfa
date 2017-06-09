<!doctype html>
<html>
<body>
<head>
</head>
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
	function storiesEditFarmValidation() {
		var name = document.getElementById("storiesEditName");
		var profession = document.getElementById("storiesEditProfession");
		var farmName = document.getElementById("storiesEditFarmName");
		var farmAddress = document.getElementById("storiesEditFarmAddress");
		var place = document.getElementById("storiesEditPlace");
		var mandal = document.getElementById("storiesEditMandal");
		var district = document.getElementById("storiesEditDistrict");
		var farmPinCode = document.getElementById("storiesEditFarmPinCode");
		var aboutFarm = document.getElementById("storiesEditAboutFarm");
		if (name.value.length == 0) {
		msg = "errEditStoName";
		title = "Name ";
		$("storiesEditFailMsg").text();

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		name.focus();
		return false;
	} else if (farmName.value.length == 0) {
		msg = "errEditStoFarmName";
		title = "Farm Name";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmName.focus();
		return false;
	} else if (farmAddress.value.length == 0) {
		msg = "errEditStoFarmAddress";
		title = "Farm Address";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmAddress.focus();
		return false;
	} else if (place.value.length == 0) {
		msg = "errEditFarmPlace";
		title = "Farm Address";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		place.focus();
		return false;
	} else if (mandal.value.length == 0) {
		msg = "errEditStomandal";
		title = "Farm Address";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		mandal.focus();
		return false;
	} else if (district.value.length == 0) {
		msg = "errEditStoDistrict";
		title = "Farm Address";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		district.focus();
		return false;
	} else if (farmPinCode.value.length > 0 && farmPinCode.value.length != 6) {
		msg = "errStoriesEditFarmPinCode";
		title = "Farm Pin Code";

		$("#" + msg).text(title + " must have six numbers");
		$("#" + msg).show();
		farmPinCode.focus();
		return false;
	}else if (aboutFarm.value.length == 0) {
	msg = "errEditStoAboutFarm";
	title = "About You/Farm";

	$("#" + msg).text(title + " should not be empty");
	$("#" + msg).show();
	aboutFarm.focus();
	return false;
    } else{
    	$("#errEditStoName").text("");
    	$("#errEditStoProfession").text("");
    	$("#errEditStoFarmName").text("");
    	$("#errEditStoFarmAddress").text("");
    	$("#errEditFarmPlace").text("");
    	$("#errEditStomandal").text("");
    	$("#errEditStoDistrict").text("");
    	$("#errEditStoAboutFarm").text("");
		storiesUpdate();
	}

	}
	$(document).ready(
			function() {
				$.ajax({
					url : "emp/storiesService/editStories",
					success : function(data) {
						$.each(data.EditStories, function(key, val) {
							$('#storiesId')
									.val(data.EditStories[key].storiesId);
							$('#storiesEditTitle').val(
									data.EditStories[key].title);
							$('#storiesEditName').val(
									data.EditStories[key].name);
							$('#storiesEditProfession').val(
									data.EditStories[key].profession);
							$('#storiesEditFarmName').val(
									data.EditStories[key].farmName);
							$('#storiesEditFarmAddress').val(
									data.EditStories[key].farmAddress);
							$('#storiesEditPlace').val(
									data.EditStories[key].place);
							$('#storiesEditMandal').val(
									data.EditStories[key].mandal);
							$('#storiesEditDistrict').val(
									data.EditStories[key].district);
							$('#storiesEditFarmState').val(
									data.EditStories[key].farmState);
							$('#storiesEditFarmPinCode').val(
									data.EditStories[key].farmPinCode);
							$('#storiesEditAboutFarm').val(
									data.EditStories[key].aboutFarm);
						})
					}
				});
			});
	function storiesUpdate() {
		var storiesId = $("#storiesId").val();
		var title = $("#storiesEditTitle").val();
		var name = $("#storiesEditName").val();
		var profession = $("#storiesEditProfession").val();
		var farmName = $("#storiesEditFarmName").val();
		var farmAddress = $("#storiesEditFarmAddress").val();
		var place = $("#storiesEditPlace").val();
		var mandal = $("#storiesEditMandal").val();
		var district = $("#storiesEditDistrict").val();
		var farmState = $("#storiesEditFarmState").val();
		var farmPinCode = $("#storiesEditFarmPinCode").val();
		var aboutFarm = $("#storiesEditAboutFarm").val();

		var storiesObject = new Object();
		storiesObject.storiesId = storiesId;
		storiesObject.title = title;
		storiesObject.name = name;
		storiesObject.profession = profession;
		storiesObject.farmName = farmName;
		storiesObject.farmAddress = farmAddress;
		storiesObject.place = place;
		storiesObject.mandal = mandal;
		storiesObject.district = district;
		storiesObject.farmState = farmState;
		storiesObject.farmPinCode = farmPinCode;
		storiesObject.aboutFarm = aboutFarm;
		$.ajax({
			data : storiesObject,
			url : "emp/storiesService/storiesUpdate",
			success : function(data) {
				if (data.Msg == 'success') {
					window.location.href = "storiesList.jsp";
				}else{
					$("#storiesEditFailMsg").text("Stories Edit Failed");
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
				<h2>Stories Edit</h2>
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
				<div class="form-group">
					<label for="event_name"><h4>* These fields are
							required</h4></label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="title">Title</label> <select class="form-control"
							id="storiesEditTitle" name="storiesEditTitle">
							<!--  <option selected="selected" id="frmSuccStory_Title" name="frmSuccStory_Title">--select--</option> -->
							<option value="Mr">Mr</option>
							<option value="Ms">Ms</option>
							<option value="Dr">Dr</option>
							<option value="Prof">Prof</option>
						</select> <input type="hidden" class="form-control" id="storiesId"
							name="storiesId">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="first_name">Name *</label> <span class="errMsg" id="errEditStoName"></span>
						<input type="text"
							class="form-control" id="storiesEditName" name="storiesEditName" maxlength="30" onkeyup="validateTitle(id,'Name','errEditStoName',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="profession">Profession</label> <span class="errMsg" id="errEditStoProfession"></span>
						<input type="text"
							class="form-control" id="storiesEditProfession"
							name="storiesEditProfession" maxlength="30">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_name">Farm Name *</label> <span class="errMsg" id="errEditStoFarmName"></span>
						<input type="text"
							class="form-control" id="storiesEditFarmName"
							name="storiesEditFarmName" maxlength="30" onkeyup="validateTitle(id,'Farm Name','errEditStoFarmName',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_address">Farm Address *</label> <span class="errmsg" id="errEditStoFarmAddress"></span>
						<textarea class="form-control" rows="5"
							id="storiesEditFarmAddress" name="storiesEditFarmAddress" maxlength="250"
							onkeyup="emptyCheck(id,'Farm Address','errEditStoFarmAddress');"></textarea>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_place_city">Farm Place/City *</label> <span class="errMsg" id="errEditFarmPlace"></span>
						<input
							type="text" class="form-control" id="storiesEditPlace"
							name="storiesEditPlace" maxlength="30" onkeyup="validateTitle(id,'Farm Place/City','errEditFarmPlace',3,30);">
					</div>
				</div>


				<div class="col-md-5">
					<div class="form-group">
						<label for="mandal">Mandal *</label> <span class="errMsg" id="errEditStomandal"></span>
						<input type="text"
							class="form-control" id="storiesEditMandal"
							name="storiesEditMandal"  maxlength="30" onkeyup="validateTitle(id,'Mandal','errEditStomandal',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="district">District *</label> <span class="errMsg" id="errEditStoDistrict"></span>
						 <input type="text"
							class="form-control" id="storiesEditDistrict"
							name="storiesEditDistrict" maxlength="30" onkeyup="validateTitle(id,'District','errEditStoDistrict',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_state">FarmState</label> <select
							class="form-control" id="storiesEditFarmState"
							name="storiesEditFarmState">
							<!-- <option selected="selected" id="frmSuccStory_FarmState" name="frmSuccStory_FarmState">--select--</option> -->
							<option value="Telangana">Telangana</option>
							<option value="AndhraPradesh">AndhraPradesh</option>
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_pin_code">Farm Pin Code</label> <span class="errMsg" id="errStoriesEditFarmPinCode"></span>
						 <input type="text" class="form-control" id="storiesEditFarmPinCode"
							name="storiesEditFarmPinCode" maxlength ="6" onkeyup="pincodeCheck(id,'Farm Pin Code','errStoriesEditFarmPinCode')">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="about_your_farm">About You/Farm *</label> <span class="errMsg" id="errEditStoAboutFarm"></span>
						<textarea class="form-control" rows="5" id="storiesEditAboutFarm"
							name="storiesEditAboutFarm" maxlength="250" onkeyup="emptyCheck(id,'About You/Farm','errEditStoAboutFarm')"></textarea>
					</div>
				</div>
				<div class="clearfix"></div>


			</div>
			<div class="clearfix"></div>
			<!-------------------------Upload Photo--------------------------------------->
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-2">
						<div class="image">
							<img src="images/img.png" class="img-responsive img-thumbnail">
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


			<!-------------------------Upload Photo end--------------------------------------->

			<!------------------------------guests form--------------------------------------->


			<!------------------------------guests form end--------------------------------------->
			<!----------------------photo_gallery------------------------------>

			<div class="row">
				<div class="modal fade" id="image-gallery" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
					style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">�</span><span class="sr-only">Close</span>
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
			<div class="col-md-5">
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
												<label> <input id="login-remember" type="checkbox"
													name="remember" value="1"> Show as Public
												</label>
												<div class="suceee_msg">
													<!-- <h4>Updated successfully</h4> -->
												</div>
											</div>
											<div class="delete_box">
												<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>
													Delete</a>
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
												<label> <input id="login-remember" type="checkbox"
													name="remember" value="1"> Show as Public
												</label>
												<div class="suceee_msg">
													<!-- <h4>Updated successfully</h4> -->
												</div>
											</div>
											<div class="delete_box">
												<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>
													Delete</a>
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
			<div class="col-md-5">
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
												width="100%" height="275" frameborder="0"
												webkitallowfullscreen="" mozallowfullscreen=""
												allowfullscreen=""></iframe>
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
												<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>
													Delete</a>
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
												width="100%" height="275" frameborder="0"
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
											<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>
												Delete</a>
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
			<!-------------------------submit button--------------------------------------->
			<div class="col-md-10">
				<div class="submit_button text-right">
					<a href='#'><button class="btn btn-success btn-sm text-right "
							onclick="storiesEditFarmValidation();">Submit</button></a>

				</div>
				<div class="message" id="storiesfrm_msg">
					
					<h3>
				         <aside class="formFailMsg" id="storiesEditFailMsg"></aside>
			       </h3>
				</div>
			</div>

			<!-------------------------submit button end--------------------------------------->


			<div class="clearfix"></div>
		</div>
	</div>

</div>
<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
