<!doctype html>
<html>
<body>
<head>
<!-- <script type="text/javascript" src="js/successStories.js"></script> -->
</head>
    <!----------------------top_header start-------------------------------->
    <jsp:include page="includes.jsp"/> 
    <!----------------------top_header end----------------------------------> 
    <body>
        <!----------------------top_header start---------------------------->
        <jsp:include page="topheader.jsp"/> 
        <!----------------------top_header end------------------------------> 

        <!----------------------header  start------------------------------->
        <jsp:include page="header.jsp"/> 
        <!----------------------header end----------------------------------> 

        <!----------------------menus start--------------------------------->
        <jsp:include page="menu.jsp"/> 
        <!----------------------menus end-----------------------------------> 

        <!----------------------banner start-------------------------------->
        <%-- <jsp:include page="banner.jsp"/>  --%>
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
        
$(document).ready(function() {
	//alert("-------in editStories--Jsp---");
	$.ajax({
		url : "emp/storiesService/editStories",
		success : function(data) {
				$.each(
						data.EditStories,
						function(key, val) {
							//alert("-------in editStories--Jsp---storiesTitle=="+data.EditStories[key].storiesId);
						$('#storiesId').val(data.EditStories[key].storiesId);	
						$('#storiesEditTitle').val(data.EditStories[key].title);
					 	$('#storiesEditName').val(data.EditStories[key].name);
						$('#storiesEditProfession').val(data.EditStories[key].profession);
						$('#storiesEditFarmName').val(data.EditStories[key].farmName);
						$('#storiesEditFarmAddress').val(data.EditStories[key].farmAddress);
						$('#storiesEditPlace').val(data.EditStories[key].place);
						$('#storiesEditMandal').val(data.EditStories[key].mandal);
						$('#storiesEditDistrict').val(data.EditStories[key].district);
						$('#storiesEditFarmState').val(data.EditStories[key].farmState);
						$('#storiesEditFarmPinCode').val(data.EditStories[key].farmPinCode);
						$('#storiesEditAboutFarm').val(data.EditStories[key].aboutFarm);
						}
				)
		}
	});
});
function storiesUpdate(){
	//alert("in to update");
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
	storiesObject.farmName = farmName ;
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
		url : "emp/storiesService/storiesUpdate",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
}
        
</script>
</head>
        
	<!----------------------body_content start-------------------------->
	
      <div class="clearfix"></div>
<div id="aboutus">
  <div class="container" >
    <div class="row">
      <div class="aboutus">
        <h2>Success Stories</h2>
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
      <div class="col-md-5">
        <div class="form-group">
          <label for="title">Title</label>
          <select class="form-control" id="storiesEditTitle" name="storiesEditTitle">
           <!--  <option selected="selected" id="frmSuccStory_Title" name="frmSuccStory_Title">--select--</option> -->
            <option value ="Mr">Mr</option>
            <option value ="Ms">Ms</option>
            <option value ="Dr">Dr</option>
            <option value ="Prof">Prof</option>
          </select>
          <input type="hidden" class="form-control" id="storiesId"
							name="storiesId">
        </div>
      </div>
     <div class="col-md-5">
        <div class="form-group">
          <label for="first_name">Name</label>
          <input type="text" class="form-control" id="storiesEditName" name="storiesEditName">
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="profession">Profession</label>
          <input type="text" class="form-control" id="storiesEditProfession" name="storiesEditProfession">
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="farm_name">Farm Name</label>
          <input type="text" class="form-control" id="storiesEditFarmName" name="storiesEditFarmName">
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="farm_address">Farm Address</label>
          <textarea class="form-control" rows="5" id="storiesEditFarmAddress" name="storiesEditFarmAddress"></textarea>
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="farm_place_city">Farm Place/City</label>
          <input type="text" class="form-control" id="storiesEditPlace" name="storiesEditPlace">
        </div>
      </div>
      
      
      <div class="col-md-5">
        <div class="form-group">
          <label for="mandal">Mandal</label>
          <input type="text" class="form-control" id="storiesEditMandal" name="storiesEditMandal">
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="district">District</label>
          <input type="text" class="form-control" id="storiesEditDistrict" name="storiesEditDistrict">
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="farm_state">FarmState</label>
          <select class="form-control"id="storiesEditFarmState" name="storiesEditFarmState">
            <!-- <option selected="selected" id="frmSuccStory_FarmState" name="frmSuccStory_FarmState">--select--</option> -->
            <option value ="Telangana">Telangana</option>
            <option value ="AndhraPradesh">AndhraPradesh</option>
          </select>
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="farm_pin_code">Farm Pin Code</label>
          <input type="text" class="form-control" id="storiesEditFarmPinCode" name="storiesEditFarmPinCode">
        </div>
      </div>
            <div class="col-md-5">
        <div class="form-group">
          <label for="about_your_farm">About You/Farm</label>
          <textarea class="form-control" rows="5" id="storiesEditAboutFarm" name="storiesEditAboutFarm"></textarea>
        </div>
      </div>
      <div class="clearfix"></div>
 
        
      </div>
      <div class="clearfix"></div>
	        <!-------------------------Upload Photo--------------------------------------->
      <div class="row">
        <div class="col-md-12">
          <div class="col-md-2">
            <div class="image"> <img src="images/img.png" class="img-responsive img-thumbnail" > </div>
          </div>
          <div class="upload_img">
            <div class="form-group col-md-6">
              <label for="Upload Photo">Upload Photo(s)</label>
              <input id="file-0b" class="file form-control" type="file" >
            </div>
          </div>
        </div>
      </div>
      
      <!-------------------------Upload Photo end---------------------------------------> 
      
      <!------------------------------guests form--------------------------------------->
      
      
      <!------------------------------guests form end---------------------------------------> 
      
      <!-------------------------submit button--------------------------------------->
      <div class="col-md-10">
        <div class="submit_button text-right">
          <a href='storiesList.jsp'><button class="btn btn-success btn-sm text-right " onclick ="storiesUpdate();">Submit</button></a>
          
        </div>
        <div class="message">
            <h3>saved sucessfully</h3>
          </div>
      </div>
      
      <!-------------------------submit button end--------------------------------------->
      
      
      <div class="clearfix"></div>
    </div>
  </div>

</div>	
	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	 <jsp:include page="footer.jsp"/>
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
