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
	$("#storiesRegFailMsg").text("");
	alert("name.value.length ==="+name.value.length );
	if (name.value.length == 0) {
		//alert("----name zero-------");
		msg = "errName";
		title = "Name ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		name.focus();
		return false;
	} else if (farmName.value.length == 0) {
		//alert("----farmName zero-------");
		msg = "errFarmName";
		title = "Farm Name";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmName.focus();
		return false;
	} else if (farmAddress.value.length == 0) {
		alert("----farmAddress zero-------");
		msg = "errStoFarmAddress";
		title = "Farm Address";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		farmAddress.focus();
		return false;
	} else if (place.value.length == 0) {
		alert("----place zero-------");
		msg = "errStoFarmPlace";
		title = "Farm Place/City";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		place.focus();
		return false;
	}else if (mandal.value.length == 0) {
		alert("----mandal zero-------");
		msg = "errStoMandal";
		title = "Mandal";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		mandal.focus();
		return false;
	}else if (district.value.length == 0) {
		//alert("----place zero-------");
		msg = "errStoDistrict";
		title = "District";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		district.focus();
		return false;
	}else if (aboutFarm.value.length == 0) {
		//alert("----place zero-------");
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
		saveStories();
	}
	
	//alert("==Entered==");
	
}
     
   function saveStories(){
	   //alert(" in to js stories page----------------");
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
	   
	   //alert("title----------------"+title);
	   //alert("name----------------"+name);
	  
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
				/* if (data.Msg = "success") {
					//alert("b4...........");
					window.location.href = "storiesList.jsp";
					//alert("a4...........");
				} */
				if (data.Msg == 'success') {
					alert(".....success......");
					window.location.href = "storiesList.jsp";
					//alert("a4...........");
				}else{
					alert(".....error......");
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
					//alert("b4...........");
					window.location.href = "newsList.jsp";
					//alert("a4...........");
				}			}
		});
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
							<!--  <option selected="selected" id="frmSuccStory_Title" name="frmSuccStory_Title">--select--</option> -->
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
							class="form-control" id="name" name="name" maxlength =30
							onkeyup="validateTitle(id,'Name ','errName',5,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="profession">Profession</label> 
						<input type="text" class="form-control" id="profession" name="profession" maxlength=30>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_name">Farm Name *</label> <span class="errMsg" id="errFarmName"></span>
						<input type="text" class="form-control" id="farmName" name="farmName"  maxlength=30 
						onkeyup="validateTitle(id,'FarmName ','errFarmName',5,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_address">Farm Address *</label> 
						<span class="errMsg" id="errStoFarmAddress"></span>
						<textarea class="form-control" rows="5" id="farmAddress"
							name="farmAddress" maxlength=250 onkeyup="emptyCheck(id,'Farm Address','errStoFarmAddress');"></textarea>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="farm_place_city">Farm Place/City *</label> <span class="errMsg" id="errStoFarmPlace"></span>
						<input type="text" class="form-control" id="place" name="place" maxlength=30
						onkeyup="validateTitle(id,'Farm Place/City','errStoFarmPlace',5,30);">
					</div>
				</div>


				<div class="col-md-5">
					<div class="form-group">
						<label for="mandal">Mandal *</label> <span class="errMsg" id="errStoMandal"></span>
						<input type="text" class="form-control" id="mandal" name="mandal" maxlength = 30 
							onkeyup="validateTitle(id,'Mandal','errStoMandal',5,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="district">District *</label> <span class="errMsg" id="errStoDistrict"></span>
						<input type="text" class="form-control" id="district" name="district" 
						maxlength = 30 onkeyup="validateTitle(id,'District ','errStoDistrict',5,30);">
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
						<label for="farm_pin_code">Farm Pin Code</label> <span class="errMsg" id="errFarmPinCode "></span>
						<input type="text" class="form-control" id="farmPinCode"
							name="farmPinCode"  maxlength = 6>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="about_your_farm">About You/Farm *</label> <span class="errMsg" id="errStoAboutYou"></span>
						<textarea class="form-control" rows="5" id="aboutFarm"
							name="aboutFarm" maxlength = 250 onkeyup="emptyCheck(id,'About You/Farm','errStoAboutYou');"></textarea>
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
