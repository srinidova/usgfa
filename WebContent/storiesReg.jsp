<!doctype html>
<html>
<body>
<head>
<script type="text/javascript">
function storiesFarmValidation() {
	var name = document.getElementById("name");
	var profession = document.getElementById("profession");
	var farmName = document.getElementById("farmName");
	var farmAddress = document.getElementById("farmAddress");
	var place = document.getElementById("place");
	var mandal = document.getElementById("mandal");
	var district = document.getElementById("district");
	var farmPinCode = document.getElementById("farmPinCode");
	var aboutFarm = document.getElementById("aboutFarm");
	var msg = "";
	var title = "";
	var number = /^[0-9]+$/;
	$("#storiesRegFailMsg").text("");
	if (name.value.length == 0) {
		msg = "errName";
		title = "Name ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		name.focus();
		return false;
	} else if (farmName.value.length == 0) {
		msg = "errFarmName";
		title = "Farm Name";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmName.focus();
		return false;
	} else if (farmAddress.value.length == 0) {
		msg = "errStoFarmAddress";
		title = "Farm Address";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmAddress.focus();
		return false;
	} else if (place.value.length == 0) {
		msg = "errStoFarmPlace";
		title = "Farm Place/City";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		place.focus();
		return false;
	}else if (mandal.value.length == 0) {
		msg = "errStoMandal";
		title = "Mandal";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		mandal.focus();
		return false;
	}else if (district.value.length == 0) {
		msg = "errStoDistrict";
		title = "District";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		district.focus();
		return false;
	}else if (farmPinCode.value.length > 0 && !farmPinCode.value.match(number) ) {
		msg = "errFarmPinCode";
		title = "Farm Pin Code";

		$("#" + msg).text(title + " must have numbers only");
		$("#" + msg).show();
		farmPinCode.focus();
		return false;
	}else if (farmPinCode.value.length > 0 && farmPinCode.value.length != 6) {
		msg = "errFarmPinCode";
		title = "Farm Pin Code";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmPinCode.focus();
		return false;
	}else if (aboutFarm.value.length == 0) {
		msg = "errStoAboutYou";
		title = "About You/Farm";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		aboutFarm.focus();
		return false;
	}else{
		$("#errName").text("");
		$("#errFarmName").text("");
		$("#errStoFarmAddress").text("");
		$("#errStoFarmPlace").text("");
		$("#errStoMandal").text("");
		$("#errStoDistrict").text("");
		$("#errStoAboutYou").text("");
		saveStoriesNew();
		//saveStories();
	}
	
	
}

function saveStoriesNew(){
	   var title = $("#title").val();
	   var name = $("#name").val();
	   var profession = $("#profession").val();
	   var farmName = $("#farmName").val();
	   var farmAddress = $("#farmAddress").val();
	   var place = $("#place").val();
	   var mandal = $("#mandal").val();
	   var district = $("#district").val();
	   var farmState = $("#farmState").val();
	   var farmPinCode = $("#farmPinCode").val();
	   var aboutFarm = $("#aboutFarm").val();
	   var file = $("#file")[0].files[0];
	   
		var formData = new FormData();
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
			url : "emp/storiesService/addStoriesNew",
        	data: formData,
        	cache: false,
        	contentType: false,
        	processData: false,
			success : function(data) {
				if (data.Msg == 'success') {
					window.location.href = "storiesList.jsp";
				}else{
					$("#storiesRegFailMsg").text("Stories Registration Failed");
				}  
			}
		});
	  
/* 	   var storiesObject = new Object();
	   
	   
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
	   
	   $
		.ajax({
			data : storiesObject,
			url : "emp/storiesService/addStories",
			success : function(data) {
				if (data.Msg == 'success') {
					window.location.href = "storiesList.jsp";
				}else{
					$("#storiesRegFailMsg").text("Stories Registration Failed");
				} 

			}
		});
	   $
		.ajax({
			data : uploadFile,
			url : "emp/storiesService/getStoriesImages",
			success : function(data) {
				if (data.Msg = "success") {
					window.location.href = "newsList.jsp";
				}			}
		}); */
} 
     
   function saveStories(){
	   var title = $("#title").val();
	   var name = $("#name").val();
	   var profession = $("#profession").val();
	   var farmName = $("#farmName").val();
	   var farmAddress = $("#farmAddress").val();
	   var place = $("#place").val();
	   var mandal = $("#mandal").val();
	   var district = $("#district").val();
	   var farmState = $("#farmState").val();
	   var farmPinCode = $("#farmPinCode").val();
	   var aboutFarm = $("#aboutFarm").val();
	   
	  
	   var storiesObject = new Object();
	   
	   
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
	   
	   $
		.ajax({
			data : storiesObject,
			url : "emp/storiesService/addStories",
			success : function(data) {
				if (data.Msg == 'success') {
					window.location.href = "storiesList.jsp";
				}else{
					$("#storiesRegFailMsg").text("Stories Registration Failed");
				} 

			}
		});
	   $
		.ajax({
			data : uploadFile,
			url : "emp/storiesService/getStoriesImages",
			success : function(data) {
				if (data.Msg = "success") {
					window.location.href = "newsList.jsp";
				}			}
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

<div class="clearfix"></div>
<div id="aboutus">
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>Stories New</h2>
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
							id="title" name="title">
							<option value="Mr">Mr</option>
							<option value="Ms">Ms</option>
							<option value="Dr">Dr</option>
							<option value="Prof">Prof</option>
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="first_name">Name *</label> <span class="errMsg" id="errName"></span>
						<input type="text"
							class="form-control" id="name" name="name" maxlength ="30"
							onkeyup="validateTitle(id,'Name ','errName',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="profession">Profession</label> 
						<input type="text" class="form-control" id="profession" name="profession" maxlength="30">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_name">Farm Name *</label> <span class="errMsg" id="errFarmName"></span>
						<input type="text" class="form-control" id="farmName" name="farmName"  maxlength="30" 
						onkeyup="validateTitle(id,'FarmName ','errFarmName',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_address">Farm Address *</label> 
						<span class="errMsg" id="errStoFarmAddress"></span>
						<textarea class="form-control" rows="5" id="farmAddress"
							name="farmAddress" maxlength="250" onkeyup="emptyCheck(id,'Farm Address','errStoFarmAddress');"></textarea>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_place_city">Farm Place/City *</label> <span class="errMsg" id="errStoFarmPlace"></span>
						<input type="text" class="form-control" id="place" name="place" maxlength="30"
						onkeyup="validateTitle(id,'Farm Place/City','errStoFarmPlace',3,30);">
					</div>
				</div>


				<div class="col-md-5">
					<div class="form-group">
						<label for="mandal">Mandal *</label> <span class="errMsg" id="errStoMandal"></span>
						<input type="text" class="form-control" id="mandal" name="mandal" maxlength ="30" 
							onkeyup="validateTitle(id,'Mandal','errStoMandal',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="district">District *</label> <span class="errMsg" id="errStoDistrict"></span>
						<input type="text" class="form-control" id="district" name="district" 
						maxlength ="30" onkeyup="validateTitle(id,'District ','errStoDistrict',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_state">FarmState</label> <select
							class="form-control" id="farmState" name="farmState">
							<!-- <option selected="selected" id="frmSuccStory_FarmState" name="frmSuccStory_FarmState">--select--</option> -->
							<option value="Telangana">Telangana</option>
							<option value="AndhraPradesh">AndhraPradesh</option>
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_pin_code">Farm Pin Code</label> <span class="errMsg" id="errFarmPinCode"></span>
						<input type="text" class="form-control" id="farmPinCode"
							name="farmPinCode"  maxlength ="6" onkeyup="pincodeCheck(id,'Farm Pin Code','errFarmPinCode')">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="about_your_farm">About You/Farm *</label> <span class="errMsg" id="errStoAboutYou"></span>
						<textarea class="form-control" rows="5" id="aboutFarm"
							name="aboutFarm" maxlength ="250" onkeyup="emptyCheck(id,'About You/Farm','errStoAboutYou');"></textarea>
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

			<!------------------------------guests form--------------------------------------->


			<!------------------------------guests form end--------------------------------------->

			<!-------------------------submit button--------------------------------------->
			<div class="col-md-10">
				<div class="submit_button text-right">
					<a href='#'><button class="btn btn-success btn-sm text-right "
							onclick="storiesFarmValidation();">Submit</button></a>

				</div>
				<div class="message" id="storiesfrm_message">
					<h3>
				<aside class="formFailMsg" id="storiesRegFailMsg"></aside>
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
<script type="text/javascript">
	$(document).ready(function() {
		var aboutFarm = document.getElementById("aboutFarm");
		if (aboutFarm.value.length > 0) {
			$("#aboutFarm").text("");
		}
	});
</script>
</body>
</html>
<jsp:include page="login.jsp" />
