<!doctype html>
<html>
<body>
	<script type="text/javascript">
 function programFarmValidation() {
	 
	 var programName = document.getElementById("programName");
	 var duration    = document.getElementById("duration");
	 var dateAndTimeFrom = document.getElementById("dateAndTimeFrom"); 
	 if (dateAndTimeFrom.value.length > 0) {
			$("#dateAndTimeFrom").text("");
		}
	 var dateAndTimeTo = document.getElementById("dateAndTimeTo");
	 var msg = "";
	 var title = "";
	 $("#programRegFailMsg").text("");
	 if (programName.value.length == 0) {
			alert("----programName zero-------");
			msg = "errProgramName";
			title = "Program Name ";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			programName.focus();
			return false;
		} else if (dateAndTimeFrom.value.length == 0) {
			alert("----dateAndTimeFrom zero-------");
			msg = "errDateAndTimeFrom";
			title = "Date & TimeFrom ";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			dateAndTimeFrom.focus();
			return false;
		}else if (dateAndTimeTo.value.length == 0) {
			alert("----dateAndTimeTo zero-------");
			msg = "errDateAndTimeTo";
			title = "Date & Time To ";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			dateAndTimeTo.focus();
			return false;
		}else if (channel.value.length == 0 && youtube.value.length == 0) {
			alert("----channel /youtube  zero-------");
			msg = "errChannel";
			title = "Channel or Youtube";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			//date.focus();
			return false;
		}else if (moreInfo.value.length == 0) {
			//alert("----moreInfo zero-------");
			msg = "errMoreInfo";
			title = "MoreInfo";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			moreInfo.focus();
			return false;
		} else {
			$("#errProgramName").text("");
			$("#errDateAndTimeFrom").text("");
			$("#errDateAndTimeTo").text("");
			$("#errMoreInfo").text("");
			saveProgram();
			//alert("------OK-------");
		}
	 
	
	 //alert("==Entered==");

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
			/* if (data.Msg = "success") {
				//alert("b4...........");
				window.location.href = "programList.jsp";
				//alert("a4...........");
			} */
			if (data.Msg == 'success') {
				alert(".....success......");
				window.location.href = "programList.jsp";
				//alert("a4...........");
			}else{
				alert(".....error......");
				$("#programRegFailMsg").text("Program Registration Failed");
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
						maxlength="30"  onkeyup="validateTitle(id,'Program Name','errProgramName',5,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="duration">Duration </label>  <span class="errMsg" id="errDuration"></span>
						<input type="text" class="form-control" id="duration" name="duration" maxlength="30"
						onkeyup="validateTitle(id,'Duration ','errDuration',5,30);">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="date & TimeFrom">Date & TimeFrom *</label> <span class="errMsg" id="errDateAndTimeFrom"></span>
						<div class='input-group date' id="programTimeFrom">
							<input type='text' class="form-control" id="dateAndTimeFrom"
								name="dateAndTimeFrom" maxlength=30 onkeyup="validateTitle(id,'Date & TimeFrom ','errDateAndTimeFrom',5,30);"/> 
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
								name="dateAndTimeTo" maxlength=30 onkeyup="validateTitle(id,'Date & Time To ','errDateAndTimeTo',5,30);" /> 
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
						 onkeyup="emptyCheckTwoFields(id,'youtube', 'Channel or Youtube','errChannel');">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group"> 
						<label for="youtube">Youtube</label> 
						<input type="text"
						class="form-control" id="youtube" name="youtube" maxlength="30" 
						onkeyup="emptyCheckTwoFields(id,'youtube', 'Channel or Youtube','errChannel');">
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="form-group">
					<label for="guest">Guest</label> <span class="errMsg" id="errGuest"></span>
					<input type="text"
				class="form-control" id="guest" name="guest"  maxlength="30" onkeyup="validateTitle(id,'Guest ','errGuest',5,30);">
				</div>
			</div>

			<div class="col-md-5">
				<div class="form-group">
					<label for="more_info">More Info</label> <span class="errMsg" id="errMoreInfo"></span> 
					<textarea class="form-control" rows="5" id="moreInfo"
						name="moreInfo" maxlength = 250  onkeyup="validateTitle(id,'More Info ','errMoreInfo',5,250);">
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
									id="file" name="file" class="file form-control" type="file">
								<a href="#"><button
										class="btn btn-success btn-sm text-right">Upload</button></a>
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
					<a href='#'><button class="btn btn-success btn-sm text-right "
							onclick="programFarmValidation();">Submit</button></a>

				</div>
				<div class="message" id="programfrm_message">
					<h3>
				<aside class="formFailMsg" id="programRegFailMsg"></aside>
			</h3>
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
