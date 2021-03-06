<!doctype html>
<%
boolean bAdmin = false;
String sRole=(String)session.getAttribute("LOGINROLE"); 
if(sRole != null && sRole.equals("Admin")){
	 bAdmin = true;
} 

%>
<html>
<body>
	<script type="text/javascript">
 function programFarmValidation() {
	 
	 var programName = document.getElementById("programName");
	 var duration    = document.getElementById("duration");
	 var dateAndTimeFrom = document.getElementById("dateAndTimeFrom"); 
	 var dateAndTimeTo = document.getElementById("dateAndTimeTo");
	 var channel = document.getElementById("channel");
	 var msg = "";
	 var title = "";
	 $("#programRegFailMsg").text("");
	 if (dateAndTimeFrom.value.length > 0) {
			$("#errDateAndTimeFrom").text("");
	 }
	 if (dateAndTimeTo.value.length > 0) {
			$("#errDateAndTimeTo").text("");
	 }

	 if (programName.value.length == 0) {
			msg = "errProgramName";
			title = "Program Name ";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			programName.focus();
			return false;
		} else if (dateAndTimeFrom.value.length == 0) {
			msg = "errDateAndTimeFrom";
			title = "Date & TimeFrom ";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			dateAndTimeFrom.focus();
			return false;
		}else if (dateAndTimeTo.value.length == 0) {
			msg = "errDateAndTimeTo";
			title = "Date & Time To ";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			dateAndTimeTo.focus();
			return false;
		}else if (channel.value.length == 0 && youtube.value.length == 0) {
			msg = "errChannel";
			title = "Channel or Youtube";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			return false;
		} else if (duration.value.length == 0 ) {
			msg = "errDuration";
			title = "Duration";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			return false;
		}else {
			$("#errProgramName").text("");
			$("#errDateAndTimeFrom").text("");
			$("#errDateAndTimeTo").text("");
			$("#errMoreInfo").text("");
			saveProgram();
		}
	 
	

}

function saveProgram(){
	var programName = $("#programName").val();
	var duration =$("#duration").val();
	var dateAndTimeFrom = $("#dateAndTimeFrom").val();
	var dateAndTimeTo = $("#dateAndTimeTo").val();
	var channel = $("#channel").val();
	var guest = $("#guest").val();
	var youtube = $("#youtube").val();
	var moreInfo = $("#moreInfo").val();
	var file = $("#file")[0].files[0];
	
	var formData = new FormData();
	formData.append("programName", programName);
	formData.append("duration", duration);
	formData.append("dateAndTimeFrom", dateAndTimeFrom);
	formData.append("dateAndTimeTo", dateAndTimeTo);
	formData.append("channel", channel);
	formData.append("guest", guest);
	formData.append("youtube", youtube);
	formData.append("moreInfo", moreInfo);
	//formData.append('file',  $("#file")[0].files[i]);
	for (var i = 0; i < $("#file")[0].files.length; i++)
			formData.append('file',  $("#file")[0].files[i]);
	
	

	$.ajax({
		type: 'POST',
		url : "emp/programService/addProgram",
    	data: formData,
    	cache: false,
    	contentType: false,
    	processData: false,
		success : function(data) {
			if (data.Msg == 'success') {
				window.location.href = "programList.jsp";
			}else{
				$("#programRegFailMsg").text("Program Registration Failed");
			}  
		}
	});
	
	
}
function checkTwoFields(fieldName1, fieldName2, title, msg) {
	var fieldName1_len = document.getElementById(fieldName1).value.length;

	var fieldName2_len = document.getElementById(fieldName2).value.length;

	if (fieldName1_len == 0 && fieldName2_len == 0) {
		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		return false;
	} else {
		$("#" + msg).text("");
		return true;
	}
}
function fileCheck(obj) {
	//alert("in to programReg fileCheck");
	//alert("in to file check"+$("#"+obj).val());
	 var fileInput = document.getElementById('file');
	    var filePath = fileInput.value;
	    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif|\.mp4|\.mov|\.wmv|\.flv|\.avi)$/i;
	    if(!allowedExtensions.exec(filePath)){
	        //alert('Please upload file having extensions .jpeg/.jpg/.png/.gif only.');
	        fileInput.value = '';
	        return false;
	    }else{

	    }

}
</script>

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


</head>
<!----------------------body_content start-------------------------->

<div class="clearfix"></div>
<div id="aboutus">
	<div class="container">
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
				<div class="form-group">
					<label for="news_name">
						<h4>* These fields are required</h4>
					</label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="program_name">Program Name *</label> <span class="errMsg" id="errProgramName"></span>
						<input type="text" class="form-control" id="programName" name="programName" tabindex="1" 
						maxlength="30"  onkeyup="validateTitle(id,'Program Name','errProgramName',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="duration">Duration</label>  <span class="errMsg" id="errDuration"></span>
						<input type="text" class="form-control" id="duration" name="duration" maxlength="30"
						onkeyup="allNumber(id,'Duration ','errDuration',3,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="date & TimeFrom">Date & TimeFrom *</label> <span class="errMsg" id="errDateAndTimeFrom"></span>
						<div class='input-group date' id="programTimeFrom">
							<input type='text' class="form-control" id="dateAndTimeFrom"
								name="dateAndTimeFrom" maxlength="30" onkeyup="validateTitle(id,'Date & TimeFrom ','errDateAndTimeFrom',5,30);"/> 
								<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="date&Time To">Date & Time To *</label> <span class="errMsg" id="errDateAndTimeTo"></span>
						<div class='input-group date' id="programTimeTo">
							<input type='text' class="form-control" id="dateAndTimeTo"
								name="dateAndTimeTo" maxlength="30" onkeyup="validateTitle(id,'Date & Time To ','errDateAndTimeTo',5,30);" /> 
								<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="channel">Channel</label> <span class="errMsg" id="errChannel"></span>
						<input type="text" class="form-control" id="channel" name="channel" maxlength="30"
						 onkeyup="checkTwoFields(id,'youtube', 'Channel or Youtube','errChannel');">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group"> 
						<label for="youtube">Youtube</label> 
						<input type="text"
						class="form-control" id="youtube" name="youtube" maxlength="30" 
						onkeyup="checkTwoFields(id,'youtube', 'Channel or Youtube','errChannel');">
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="form-group">
					<label for="guest">Guest</label> <span class="errMsg" id="errGuest"></span>
					<input type="text"
				class="form-control" id="guest" name="guest"  maxlength="30" onkeyup="validateTitle(id,'Guest ','errGuest',3,30);">
				</div>
			</div>

			<div class="col-md-5">
				<div class="form-group">
					<label for="more_info">More Info</label> <span class="errMsg" id="errMoreInfo"></span> 
					<textarea class="form-control" rows="5" id="moreInfo"
						name="moreInfo" maxlength ="250"  onkeyup="validateTitle(id,'More Info ','errMoreInfo',3,250);">
						</textarea>
				</div>
			</div>
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
									id="file" name="file" class="file form-control" type="file" multiple="multiple" onchange="fileCheck(this.id);"
									accept="image/jpg,image/png,image/jpeg,image/gif,video/mp4,video/mov,video/wmv,video/flv,video/avi">
								<!-- <a href="#"><button
										class="btn btn-success btn-sm text-right">Upload</button></a> -->
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
			<%if(bAdmin){ %>
			<div class="col-md-10">
				<div class="submit_button text-right">
					<a href='#'><button class="btn btn-success btn-sm text-right "
							onclick="programFarmValidation();">Submit</button></a>

				</div>
				<div class="message" id="programfrm_message">
					<h3>
				<aside class="formFailMsg" id="programRegFailMsg"></aside>
			</h3>
				</div>
			</div>
			<%} %>
			<!-------------------------submit button end--------------------------------------->


			<div class="clearfix"></div>
		</div>
	</div>

</div>
<!-- </div> -->

<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
<script type="text/javascript">
    $(function () {
	
        $('#programTimeFrom,#programTimeTo').datetimepicker({
			 useCurrent: false,
			 format: 'DD/MM/YYYY LT'
			});

		$('.cross_icon').click(function(){
			alert('asdfasdf')
			$(this).parent().remove()
			});
    });
	
	function addItem(e){
		var html = $('.addOne').html();
		$('#content_block').append(html);
		//$(e).append(html);
		
		
				
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var moreInfo = document.getElementById("moreInfo");
		if (moreInfo.value.length > 0) {
			$("#moreInfo").text("");
		}
	});
</script>
<script type="text/javascript">
  
  
  $(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
			var html = $('#guests_block').html();
            $(wrapper).append(html); //add input box
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
	
        e.preventDefault(); $(this).closest('div.row').remove(); x--;
    })
});
  
        </script>
</body>
</html>
<jsp:include page="login.jsp" />
