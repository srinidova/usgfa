<!doctype html>
<html>
<body>

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
       <%--  <jsp:include page="banner.jsp"/>  --%>
        <!----------------------banner end----------------------------------> 
        
        
         <head>
         <style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
	
	
}

</style>
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
<script type="text/javascript" src="js/scriptUtils.js"></script> 
<script type="text/javascript">
function programFarmValidation() {
	//alert("==Entered==");
	$("#programMessage").text("");
	//alert("==1==");
	var programName = document.getElementById("programName");
	var duration = document.getElementById("duration");
	var dateAndTimeFrom = document.getElementById("dateAndTimeFrom");
	var dateAndTimeTo = document.getElementById("dateAndTimeTo");
	var channel = document.getElementById("channel");
	var guest = document.getElementById("guest");
	var youtube = document.getElementById("youtube");
	var moreInfo = document.getElementById("moreInfo");
	//alert("==2==");
	if (emptyCheck(programName, "Program Name", "programMessage")
			&& minLenCheck(programName, 5, "Program Name", "programMessage")
			&& maxLenCheck(programName, 10, "Program Name", "programMessage")
			&& allLetter(programName, "Program Name", "programMessage")
			&& emptyCheck(duration, "Duration", "programMessage")
			&& emptyCheck(dateAndTimeFrom, "Date & TimeFrom", "programMessage")
			&& emptyCheck(dateAndTimeTo, "Date & Time To", "programMessage")
			&& emptyCheck(channel, "Channel", "programMessage")
			&& emptyCheck(guest, "Guest", "programMessage")
			&& emptyCheck(youtube, "Youtube", "programMessage")
			&& emptyCheck(moreInfo, "More Info", "programMessage")
			) {

		saveProgram();
	}

}

function saveProgram(){
	//alert(" in to js page----------------");
	var programName = $("#programName").val();
	var duration =$("#duration").val();
	var dateAndTimeFrom = $("#dateAndTimeFrom").val();
	var dateAndTimeTo = $("#dateAndTimeTo").val();
	var channel = $("#channel").val();
	var guest = $("#guest").val();
	var youtube = $("#youtube").val();
	var moreInfo = $("#moreInfo").val();
	//alert("programName----------------"+programName);
	//alert("programName----------------"+moreInfo);
	
	
	var programObject = new Object();
	programObject.programName = programName;
	programObject.duration = duration;
	programObject.dateAndTimeFrom = dateAndTimeFrom;
	programObject.dateAndTimeTo = dateAndTimeTo;
	programObject.channel = channel;
	programObject.guest = guest;
	programObject.youtube = youtube;
	programObject.moreInfo = moreInfo;
	
	$
	.ajax({
		data : programObject,
		url : "emp/programService/addProgram",
		success : function(data) {
			if (data.Msg = "success") {
				//alert("b4...........");
				window.location.href = "programList.jsp";
				//alert("a4...........");
			}
		}
	});
	$
	.ajax({
		data : uploadFile,
		url : "emp/programService/getProgramImages",
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
  <div class="container" >
    <div class="row">
      <div class="aboutus">
        <h2>Program New</h2>
        <div class="line3"></div>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>

<!-- <div class="container" style="margin-top: 30px;"> -->
<div class="container" style="margin-top: 30px;">
<div class="row">
<div class="col-md-12">

<div class="from">
      <div class="col-md-5">
        <div class="form-group">
          <label for="program_name">Program Name *</label>
          <input type="text" class="form-control" id="programName" name="programName">
        </div>
      </div>
      <div class="col-md-5">
          <div class="form-group">
            <label for="duration">Duration *</label>
            <input type="text" class="form-control" id="duration"  name="duration">
          </div>
        </div>
      <div class="col-md-5">
          <div class="form-group">
            <label for="date & TimeFrom">Date & TimeFrom *</label>
            <div class='input-group date' id='datetimepicker8'>
              <input type='text' class="form-control"  id="dateAndTimeFrom" name="dateAndTimeFrom"/>
              <span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span> </span> </div>
          </div>
        </div>
      <div class="col-md-5">
          <div class="form-group">
            <label for="date&Time To">Date & Time To *</label>
            <div class='input-group date' id='datetimepicker8'>
              <input type='text' class="form-control"  id="dateAndTimeTo" name ="dateAndTimeTo"/>
              <span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span> </span> </div>
          </div>
        </div>
      <div class="col-md-5">
          <div class="form-group">
            <label for="channel">Channel</label>
            <input type="text" class="form-control" id="channel"  name="channel">
          </div>
        </div>
		        <div class="col-md-5">
          <div class="form-group">
            <label for="guest">Guest</label>
            <input type="text" class="form-control" id="guest"  name="guest">
          </div>
        </div>
        </div>
        <div class="col-md-5">
          <div class="form-group">
            <label for="youtube">Youtube</label>
            <input type="text" class="form-control" id="youtube" name="youtube">
          </div>
        </div>
        
        <div class="col-md-5">
          <div class="form-group">
            <label for="more_info">More Info</label>
            <textarea class="form-control" rows="5" id="moreInfo" name="moreInfo"></textarea>
          </div>
        </div>
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
      <div class="clearfix"></div>
     
      <div class="clearfix"></div>
      
      <!------------------------------guests form--------------------------------------->
     
      
      <!------------------------------guests form end---------------------------------------> 
      
      <!-------------------------submit button--------------------------------------->
      <div class="col-md-10">
        <div class="submit_button text-right">
          <a href='#'><button class="btn btn-success btn-sm text-right " onclick="programFarmValidation();">Submit</button></a>
          
        </div>
        <div class="message">
            <h3><aside class=" " id="programMessage" style="display: none">Save Sucessfully</aside></h3>
          </div>
          <h4>* These fields are required</h4>
      </div>
      
      <!-------------------------submit button end--------------------------------------->
      
      
      <div class="clearfix"></div>
    </div>
  </div>

</div>
<!-- </div> -->
	
	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	 <jsp:include page="footer.jsp"/>
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
