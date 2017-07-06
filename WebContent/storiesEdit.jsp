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
		var number = /^[0-9]+$/;
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
	} else if (farmPinCode.value.length > 0 && !farmPinCode.value.match(number) ) {
		msg = "errStoriesEditFarmPinCode";
		title = "Farm Pin Code";

		$("#" + msg).text(title + " must have numbers only");
		$("#" + msg).show();
		farmPinCode.focus();
		return false;
	}else if (farmPinCode.value.length > 0 && farmPinCode.value.length != 6) {
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
						showStoriesImages(data);
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
		var file = $("#file")[0].files[0];

		var formData = new FormData();
		formData.append("storiesId", storiesId);
		formData.append("title", title);
		formData.append("name", name);
		formData.append("profession", profession);
		formData.append("farmName", farmName);
		formData.append("farmAddress", farmAddress);
		formData.append("place", place);
		formData.append("mandal", mandal);
		formData.append("district", district);
		formData.append("farmState", farmState);
		formData.append("farmPinCode", farmPinCode);
		formData.append("aboutFarm", aboutFarm);
		formData.append("file", file);
		

		$.ajax({
			type: 'POST',
			url : "emp/storiesService/storiesUpdate",
        	data: formData,
        	cache: false,
        	contentType: false,
        	processData: false,
			success : function(data) {
				if (data.Msg == 'success') {
					window.location.href = "storiesList.jsp";
				}else{
					$("#storiesEditFailMsg").text("Stories Edit Failed");
				}  
			}
		});
		
		/* var storiesObject = new Object();
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
		}); */
	}
	function showStoriesImages(data){
		var dispImages = '';
		var dispClas = '';
		var dispChkd = '';
		var imgCtrl = true;
		if(data.STORIESFILES != null ){
		$.each(
				data.STORIESFILES,
				function(key, val) {
					imgCtrl = false;
					//alert(data.STORIESFILES[key].showPublic);
					if(data.STORIESFILES[key].showPublic == 1){
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
									+'<a class="g-image" href="#" data-image-id="" data-toggle="modal" data-title="" data-caption="" data-image="'+data.STORIESFILES[key].filePath+'" data-target="#image-gallery">'
									  +'<img src="'+data.STORIESFILES[key].filePath+'" class="img-responsive" alt="" height="100" width="100" align="middle">'
									+'</a>'
								+'</div>'
								+'<div class="caption">'
									+'<div class="checkbox">'
										+'<label>'
										    +'<input id="'+data.STORIESFILES[key].fileId+'" onclick="updateShowAsPublicStories(this.id);" type="checkbox" value="'+data.STORIESFILES[key].fileId+'" name="remember"  '+ dispChkd +'> Show as Public'
										+'</label>'
										+'<div class="suceee_msg"></div>'
									+'</div>'
									+'<div class="delete_box">'
										+'<a href="#" name="'+data.STORIESFILES[key].fileId+'" onclick="deleteFileStories(this.name);"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
										+'<div class="suceee_msg"></div>'
									+'</div>'
								+'</div>'
							+'</div>'
						+'</li>'
					+'</ul>'
				+'</div>'
				})
				document.getElementById("storiesEditImages").innerHTML = dispImages;
				$.getScript('http://dovasofttech.com/usgfa/js/popup.js');
		}
				if(imgCtrl){
					document.getElementById("storiesEditImgCont").style.display = 'none';
				}
	}
	function deleteFileStories(fileId){
		//alert("fileId----"+fileId);
		var storiesObject = new Object();
		storiesObject.fileId = fileId;
		storiesObject.type = "STORIES";
		//alert("fileId----"+fileId);
		$.ajax({
			data : storiesObject,
			url : "emp/uploadService/deleteImage",
			success : function(data){
				if(data.Msg = 'success'){
					showProgramImages(data);
				}
			}
		})
	}
	function updateShowAsPublicStories(fileId){
		//alert("fileId----"+fileId);
		var setVal = '';
		if(document.getElementById(fileId).checked){
			setVal = '1';
		}else{
			setVal = '0';
		}
		var uploadFileObject = new Object();
		uploadFileObject.fileId = fileId; 
		uploadFileObject.showAsPublic = setVal;
		uploadFileObject.type = "STORIES";
			$.ajax({
			data : uploadFileObject,
			url : "emp/uploadService/updateShowAsPublic",
			success : function(data) {
				if (data.Msg = "success") {
					showStoriesImages(data);
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
								<!-- <a href="#"><button
										class="btn btn-success btn-sm text-right">Upload</button></a> -->
							</div>
						</form>
					</div>
				</div>
			</div>


			<!-------------------------Upload Photo end--------------------------------------->

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
			<div class="col-md-5" style="margin-left: 250px;">
				<div class="row">

					<div class="col-md-12" style="margin-bottom: 10px;" id="storiesEditImgCont">
						<!-- Controls -->
						<div class="controls pull-right">
							 <a class="left fa fa-angle-left btn btn-default button-arrow"
								href="#carousel-example" data-slide="prev"></a> <a
								class="right fa fa-angle-right btn btn-default button-arrow"
								href="#carousel-example" data-slide="next"></a> 
						</div>
					</div>
				</div>
				<div id="carousel-example" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner" id="storiesEditImages">
						</div>
				</div>
			</div>
			<!----------------------photo_gallery end------------------------------>

			
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
