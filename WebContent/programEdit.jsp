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
      <%--   <jsp:include page="banner.jsp"/>  --%>
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
	//alert("-------in editProgram--Jsp---");
	$.ajax({
		url : "emp/programService/editProgram",
		success : function(data) {
				$.each(
						data.EditProgram,
						function(key, val) {
							//alert("-------in editProgram--Jsp---programName=="+data.EditProgram[key].programName);
							$('#programId').val(data.EditProgram[key].programId);	
							$('#programEditName').val(data.EditProgram[key].programName);
						 	$('#programEditDuration').val(data.EditProgram[key].duration);
						 	//alert("-------in editProgram--Jsp---programEditDuration=="+data.EditProgram[key].duration);
							$('#programEditDateAndTimeFrom').val(data.EditProgram[key].dateAndTimeFrom);
							$('#programEditDateAndTimeTo').val(data.EditProgram[key].dateAndTimeTo);
							$('#programEditChannel').val(data.EditProgram[key].channel);
							$('#programEditGuest').val(data.EditProgram[key].guest);
							$('#programEditYoutube').val(data.EditProgram[key].youtube);
							$('#programEditMoreInfo').val(data.EditProgram[key].moreInfo);
						}
				)
		}
	});
});
function programUpdate(){
	//alert("-------in progrmProgram--Jsp---");
	var programId = $("#programId").val();
	var programName = $("#programEditName").val();
	var duration  = $("#programEditDuration").val();
	var dateAndTimeFrom  = $("#programEditDateAndTimeFrom").val();
	var dateAndTimeTo  = $("#programEditDateAndTimeTo").val();
	var channel  = $("#programEditChannel").val();
	var guest  = $("#programEditGuest").val();
	var youtube  = $("#programEditYoutube").val();
	var moreInfo  = $("#programEditMoreInfo").val();
	
	var programObject = new Object();
	programObject.programId = programId;
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
		url : "emp/programService/programUpdate",
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
        <h2>Program Form</h2>
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
          <label for="program_name">Program Name</label>
          <input type="text" class="form-control" id="programEditName" name="programEditName">
          <input type="hidden" class="form-control" id="programId"
							name="programId">
        </div>
      </div>
      <div class="col-md-5">
          <div class="form-group">
            <label for="duration"> Duration</label>
            <input type="text" class="form-control" id="programEditDuration"  name="programEditDuration">
          </div>
        </div>
      <div class="col-md-5">
          <div class="form-group">
            <label for="date & TimeFrom">Date & TimeFrom </label>
            <div class='input-group date' id='datetimepicker8'>
              <input type='text' class="form-control"  id="programEditDateAndTimeFrom" name="programEditDateAndTimeFrom"/>
              <span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span> </span> </div>
          </div>
        </div>
      <div class="col-md-5">
          <div class="form-group">
            <label for="date&Time To">Date & Time To </label>
            <div class='input-group date' id='datetimepicker8'>
              <input type='text' class="form-control"  id="programEditDateAndTimeTo" name ="programEditDateAndTimeTo"/>
              <span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span> </span> </div>
          </div>
        </div>
      <div class="col-md-5">
          <div class="form-group">
            <label for="channel"> Channel</label>
            <input type="text" class="form-control" id="programEditChannel"  name="programEditChannel">
          </div>
        </div>
		        <div class="col-md-5">
          <div class="form-group">
            <label for="guest"> Guest</label>
            <input type="text" class="form-control" id="programEditGuest"  name="programEditGuest">
          </div>
        </div>
        </div>
        <div class="col-md-5">
          <div class="form-group">
            <label for="youtube">Youtube</label>
            <input type="text" class="form-control" id="programEditYoutube" name="programEditYoutube">
          </div>
        </div>
        
        <div class="col-md-5">
          <div class="form-group">
            <label for="more_info">More Info</label>
            <textarea class="form-control" rows="5" id="programEditMoreInfo" name="programEditMoreInfo"></textarea>
          </div>
        </div>
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
      <div class="clearfix"></div>
     
      <div class="clearfix"></div>
      
      <!------------------------------guests form--------------------------------------->
     
      
      <!------------------------------guests form end---------------------------------------> 
      
      <!-------------------------submit button--------------------------------------->
      <div class="col-md-10">
        <div class="submit_button text-right">
          <a href='programList.jsp'><button class="btn btn-success btn-sm text-right " onclick="programUpdate();">Submit</button></a>
          
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
<!-- </div> -->
	
	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	 <jsp:include page="footer.jsp"/>
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
