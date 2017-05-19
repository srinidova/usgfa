<!doctype html>
<html>
<body>
<head>
<script type="text/javascript">
function storiesFarmValidation() {
	//alert("==Entered==");
	$("#storiesMessage").text("");
	//alert("==1==");
	var name = document.getElementById("name");
	var profession = document.getElementById("profession");
	var farmName = document.getElementById("farmName");
	var farmAddress = document.getElementById("farmAddress");
	var place = document.getElementById("place");
	var mandal = document.getElementById("mandal");
	var district = document.getElementById("district");
	var farmPinCode = document.getElementById("farmPinCode");
	var aboutFarm = document.getElementById("aboutFarm");
	//alert("==2==");
	if (emptyCheck(name, "Name", "storiesMessage")
			&& minLenCheck(name, 5, "Name", "storiesMessage")
			&& maxLenCheck(name, 30, "Name", "storiesMessage")
			&& allLetter(name, "Name", "storiesMessage")
			&& emptyCheck(profession, "Profession", "storiesMessage")
			&& emptyCheck(farmName, "Farm Name", "storiesMessage")
			&& allLetter(farmName, "Farm Name", "storiesMessage")
			&& minLenCheck(farmName, 5, "Farm Name", "storiesMessage")
			&& maxLenCheck(farmName, 30, "Farm Name", "storiesMessage")
			&& emptyCheck(farmAddress, "Farm Address", "storiesMessage")
			&& minLenCheck(farmAddress, 5, "Farm Address", "storiesMessage")
			&& maxLenCheck(farmAddress, 30, "Farm Address", "storiesMessage")
			&& emptyCheck(place, "Farm Place/City", "storiesMessage")
			&& allLetter(place, "Farm Place/City", "storiesMessage")
			&& minLenCheck(place, 5, "Farm Place/City", "storiesMessage")
			&& maxLenCheck(place, 30, "Farm Place/City", "storiesMessage")
			&& emptyCheck(mandal, "Mandal", "storiesMessage")
			&& allLetter(mandal, "Mandal", "storiesMessage")
			&& minLenCheck(mandal, 5, "Mandal", "storiesMessage")
			&& maxLenCheck(mandal, 30, "Mandal", "storiesMessage")
			&& emptyCheck(district, "District", "storiesMessage")
			&& allLetter(district, "District", "storiesMessage")
			&& minLenCheck(district, 5, "District", "storiesMessage")
			&& maxLenCheck(district, 30, "District", "storiesMessage")
			&& emptyCheck(farmPinCode, "Farm Pin Code", "storiesMessage")
			&& allNumber(farmPinCode, "Farm Pin Code", "storiesMessage")
			&& minLenCheck(farmPinCode, 6, "Farm Pin Code", "storiesMessage")
			&& maxLenCheck(farmPinCode, 6, "Farm Pin Code", "storiesMessage")
			&& emptyCheck(aboutFarm, "About You/Farm", "storiesMessage")
			&& minLenCheck(aboutFarm, 5, "About You/Farm", "storiesMessage")
			&& maxLenCheck(aboutFarm, 250, "About You/Farm", "storiesMessage")
			) {

		saveStories();
	}

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
				if (data.Msg = "success") {
					//alert("b4...........");
					window.location.href = "storiesList.jsp";
					//alert("a4...........");
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
					//window.location.href = "newsList.jsp";
					//alert("a4...........");
				}
			}
		});
   }     
        
</script>
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
       

</head>
        
	<!----------------------body_content start-------------------------->
	
      <div class="clearfix"></div>
<div id="aboutus">
  <div class="container" >
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
			<label for="event_name"><h4>* These fields are required</h4></label>
		</div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="title">Title</label>
          <select class="form-control" id="title" name="title">
           <!--  <option selected="selected" id="frmSuccStory_Title" name="frmSuccStory_Title">--select--</option> -->
            <option value ="Mr">Mr</option>
            <option value ="Ms">Ms</option>
            <option value ="Dr">Dr</option>
            <option value ="Prof">Prof</option>
          </select>
        </div>
      </div>
     <div class="col-md-5">
        <div class="form-group">
          <label for="first_name">Name *</label>
          <input type="text" class="form-control" id="name" name="name" onkeyup="removeError(this.id);">
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="profession">Profession *</label>
          <input type="text" class="form-control" id="profession" name="profession">
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="farm_name">Farm Name *</label>
          <input type="text" class="form-control" id="farmName" name="farmName">
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="farm_address">Farm Address *</label>
          <textarea class="form-control" rows="5" id="farmAddress" name="farmAddress"></textarea>
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="farm_place_city">Farm Place/City *</label>
          <input type="text" class="form-control" id="place" name="place">
        </div>
      </div>
      
      
      <div class="col-md-5">
        <div class="form-group">
          <label for="mandal">Mandal *</label>
          <input type="text" class="form-control" id="mandal" name="mandal">
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="district">District *</label>
          <input type="text" class="form-control" id="district" name="district">
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="farm_state">FarmState</label>
          <select class="form-control"id="farmState" name="farmState">
            <!-- <option selected="selected" id="frmSuccStory_FarmState" name="frmSuccStory_FarmState">--select--</option> -->
            <option value ="Telangana">Telangana</option>
            <option value ="AndhraPradesh">AndhraPradesh</option>
          </select>
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label for="farm_pin_code">Farm Pin Code</label>
          <input type="text" class="form-control" id="farmPinCode" name="farmPinCode">
        </div>
      </div>
            <div class="col-md-5">
        <div class="form-group">
          <label for="about_your_farm">About You/Farm</label>
          <textarea class="form-control" rows="5" id="aboutFarm" name="aboutFarm"></textarea>
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
      
      <!-------------------------Upload Photo end---------------------------------------> 
      
      <!------------------------------guests form--------------------------------------->
      
      
      <!------------------------------guests form end---------------------------------------> 
      
      <!-------------------------submit button--------------------------------------->
      <div class="col-md-10">
        <div class="submit_button text-right">
          <a href='#'><button class="btn btn-success btn-sm text-right " onclick ="storiesFarmValidation();">Submit</button></a>
          
        </div>
        <div class="message">
            <h3><aside class=" " id="storiesMessage" style="display: none">Save Sucessfully</aside></h3>
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
