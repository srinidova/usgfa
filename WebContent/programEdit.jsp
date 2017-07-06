<!doctype html>
<html>
<body>

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
	<%--   <jsp:include page="banner.jsp"/>  --%>
	<!----------------------banner end---------------------------------->
<head>
<script type="text/javascript">

function programEditFarmValidation() {
	$("#programMessage").text("");
	var programName = document.getElementById("programEditName");
	var duration = document.getElementById("programEditDuration");
	var dateAndTimeFrom = document.getElementById("programEditDateAndTimeFrom");
	var dateAndTimeTo = document.getElementById("programEditDateAndTimeTo");
	var channel = document.getElementById("programEditChannel");
	var guest = document.getElementById("programEditGuest");
	var youtube = document.getElementById("programEditYoutube");
	var moreInfo = document.getElementById("programEditMoreInfo");
	$("#programEditFailMsg").text("");
	if (programName.value.length == 0) {
		msg = "errEventName";
		title = "Event Name ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		programName.focus();
		return false;
	}else if (dateAndTimeFrom.value.length == 0) {
		msg = "errEditProDateAndTimeFrom";
		title = "Date & TimeFrom";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		dateAndTimeFrom.focus();
		return false;
	}else if (dateAndTimeTo.value.length == 0) {
		msg = "errEditProDateAndTimeTo";
		title = "Date & Time To";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		errEditProDateAndTimeTo.focus();
		return false;
	}else if (channel.value.length == 0 && youtube.value.length == 0) {
		msg = "errEditProChannel";
		title = "Channel or Youtube";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		return false;
	}else{
		$("#errEditProgramName").text("");
		$("#errEditProDateAndTimeFrom").text("");
		$("#errEditProDateAndTimeTo").text("");
		$("#errMoreInfo").text("");
		programUpdate();
	}

}
$(document).ready(function() {
	$.ajax({
		url : "emp/programService/editProgram",
		success : function(data) {
				$.each(
						data.EditProgram,
						function(key, val) {
							$('#programId').val(data.EditProgram[key].programId);	
							$('#programEditName').val(data.EditProgram[key].programName);
						 	$('#programEditDuration').val(data.EditProgram[key].duration);
							$('#programEditDateAndTimeFrom').val(data.EditProgram[key].dateAndTimeFrom);
							$('#programEditDateAndTimeTo').val(data.EditProgram[key].dateAndTimeTo);
							$('#programEditChannel').val(data.EditProgram[key].channel);
							$('#programEditGuest').val(data.EditProgram[key].guest);
							$('#programEditYoutube').val(data.EditProgram[key].youtube);
							$('#programEditMoreInfo').val(data.EditProgram[key].moreInfo);
						}
						
				)
				showProgramImages(data);
		}
	});
});
function programUpdate(){
	var programId = $("#programId").val();
	var programName = $("#programEditName").val();
	var duration  = $("#programEditDuration").val();
	var dateAndTimeFrom  = $("#programEditDateAndTimeFrom").val();
	var dateAndTimeTo  = $("#programEditDateAndTimeTo").val();
	var channel  = $("#programEditChannel").val();
	var guest  = $("#programEditGuest").val();
	var youtube  = $("#programEditYoutube").val();
	var moreInfo  = $("#programEditMoreInfo").val();
	var file = $("#file")[0].files[0];
	
	var formData = new FormData();
	formData.append("programId", programId);
	formData.append("programName", programName);
	formData.append("duration", duration);
	formData.append("dateAndTimeFrom", dateAndTimeFrom);
	formData.append("dateAndTimeTo", dateAndTimeTo);
	formData.append("channel", channel);
	formData.append("guest", guest);
	formData.append("youtube", youtube);
	formData.append("moreInfo", moreInfo);
	formData.append("file", file);
	

	$.ajax({
		type: 'POST',
		url : "emp/programService/programUpdate",
    	data: formData,
    	cache: false,
    	contentType: false,
    	processData: false,
		success : function(data) {
			if (data.Msg == 'success') {
				window.location.href = "programList.jsp";
			}else{
				$("#programEditFailMsg").text("Program Edit Failed");
			}  
		}
	});
	
	
}
function showProgramImages(data){
	var dispImages = '';
	var dispClas = '';
	var dispChkd = '';
	var imgCtrl = true;
	//if(!data.PROGRAMFILES == "undefined"){
	$.each(
			data.PROGRAMFILES,
			function(key, val) {
				imgCtrl = false;
				if(data.PROGRAMFILES[key].showPublic == 1){
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
								+'<a class="g-image" href="#" data-image-id="" data-toggle="modal" data-title="" data-caption="" data-image="'+data.PROGRAMFILES[key].filePath+'" data-target="#image-gallery">'
								  +'<img src="'+data.PROGRAMFILES[key].filePath+'" class="img-responsive" alt="" height="100" width="100" align="middle">'
								+'</a>'
							+'</div>'
							+'<div class="caption">'
								+'<div class="checkbox">'
									+'<label>'
									    +'<input id="'+data.PROGRAMFILES[key].fileId+'" onclick="updateShowAsPublicProgram(this.id);" type="checkbox" value="'+data.PROGRAMFILES[key].fileId+'" name="remember"  '+ dispChkd +'> Show as Public'
									+'</label>'
									+'<div class="suceee_msg"></div>'
								+'</div>'
								+'<div class="delete_box">'
									+'<a href="#" name="'+data.PROGRAMFILES[key].fileId+'" onclick="deleteFileProgram(this.name);"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
									+'<div class="suceee_msg"></div>'
								+'</div>'
							+'</div>'
						+'</div>'
					+'</li>'
				+'</ul>'
			+'</div>'
			})
//}
			document.getElementById("programEditImages").innerHTML = dispImages;
			$.getScript('http://dovasofttech.com/usgfa/js/popup.js');
			if(imgCtrl){
				document.getElementById("programEditImgCtrl").style.display = 'none';
			}
}
function updateShowAsPublicProgram(fileId){
	//alert("fileId---"+fileId);
	var setVal = '';
	if(document.getElementById(fileId).checked){
		setVal = '1';
	}else{
		setVal = '0';
	}
	//alert("setVal-----"+setVal);
	var uploadFileObject = new Object();
	uploadFileObject.fileId = fileId; 
	uploadFileObject.showAsPublic = setVal;
	uploadFileObject.type = "PROGRAM";
	//alert("setVal---"+setVal);
		$.ajax({
		data : uploadFileObject,
		url : "emp/uploadService/updateShowAsPublic",
		success : function(data) {
			if (data.Msg = "success") {
				showProgramImages(data);
			}
		}
	}); 
}

function deleteFileProgram(fileId){
	var programObject = new Object();
	programObject.fileId = fileId;
	programObject.type = "PROGRAM";
	$.ajax({
		data : programObject,
		url : "emp/uploadService/deleteImage",
		success : function(data){
			if(data.Msg = 'success'){
				showProgramImages(data);
			}
		}
	})
}
</script>
</head>
<!----------------------body_content start-------------------------->

<div class="clearfix"></div>
<div id="aboutus">
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>Program Edit</h2>
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
					<label for="event_name"><h4>* These fields are
							required</h4></label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="program_name">Program Name *</label> <span class="errMsg" id="errEditProgramName"></span>
						<input
							type="text" class="form-control" id="programEditName"
							name="programEditName" maxlength="30" onkeyup="validateTitle(id,'Program Name','errEditProgramName',3,30);"> <input type="hidden"
							class="form-control" id="programId" name="programId">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="duration"> Duration *</label> <input type="text"
							class="form-control" id="programEditDuration"
							name="programEditDuration" maxlength="30">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="date & TimeFrom">Date & TimeFrom *</label> <span class="errMsg" id="errEditProDateAndTimeFrom"></span>
						<div class='input-group date' id="programEditTimeFrom">
							<input type='text' class="form-control"
								id="programEditDateAndTimeFrom"
								name="programEditDateAndTimeFrom" maxlength="30"
								onkeyup="validateTitle(id,'Date & TimeFrom','errEditProDateAndTimeFrom',5,30);"/> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="date&Time To">Date & Time To *</label> <span class="errMsg" id="errEditProDateAndTimeTo"></span>
						<div class='input-group date' id="programEditTimeTo">
							<input type='text' class="form-control"
								id="programEditDateAndTimeTo" name="programEditDateAndTimeTo" maxlength="30"
								onkeyup="validateTitle(id,'Date & Time To','errEditProDateAndTimeTo',5,30);" />
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="channel">Channel</label> <span class="errMsg" id="errEditProChannel"></span>
						<input type="text"
							class="form-control" id="programEditChannel" name="programEditChannel" maxlength="30"
							onkeyup="emptyCheckTwoFields(id,'channel','Channel or Youtube','errEditProChannel');">
					</div>
				</div>
				
			
			<div class="col-md-5">
				<div class="form-group">
					<label for="youtube">Youtube</label> 
					<input type="text" class="form-control" id="programEditYoutube" name="programEditYoutube" maxlength="30" 
						onkeyup="emptyCheckTwoFields(id,'youtube','Channel or Youtube','errEditProChannel');">
				</div>
			</div>
            </div>
            <div class="col-md-5">
					<div class="form-group">
						<label for="guest"> Guest</label> <input type="text"
							class="form-control" id="programEditGuest"
							name="programEditGuest" maxlength="30">
					</div>
				</div>
			<div class="col-md-5">
				<div class="form-group">
					<label for="more_info">More Info</label>
					<textarea class="form-control" rows="5" id="programEditMoreInfo"
						name="programEditMoreInfo" maxlength="250"></textarea>
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
								<label for="Upload Photo">Select Photo(s)</label> 
								<input id="file" name="file" class="file form-control" type="file">
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

			<!----------------------photo_gallery------------------------------>

			
			<div class="col-md-5" style="margin-left: 250px;" id="programEditImgCtrl">
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
				<div id="carousel-example" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner" id="programEditImages">
						</div>
				</div>
				
			</div>
			<!----------------------photo_gallery end------------------------------>

			

			<!-------------------------submit button--------------------------------------->
			<div class="col-md-10">
				<div class="submit_button text-right">
					<a href='#'><button class="btn btn-success btn-sm text-right "
							onclick="programEditFarmValidation();">Submit</button></a>

				</div>
				<div class="message" id="programfrm_message">
					<h3>
				         <aside class="formFailMsg" id="programEditFailMsg"></aside>
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
	
        $('#programEditTimeFrom,#programEditTimeTo').datetimepicker({
			 useCurrent: false,
			 format: 'DD/MM/YYYY LT'
			});

		$('.cross_icon').click(function(){
			//alert('asdfasdf')
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
