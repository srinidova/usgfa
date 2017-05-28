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
	//alert("==Entered==");
	$("#programMessage").text("");
	//alert("==1==");
	var programName = document.getElementById("programEditName");
	var duration = document.getElementById("programEditDuration");
	var dateAndTimeFrom = document.getElementById("programEditDateAndTimeFrom");
	var dateAndTimeTo = document.getElementById("programEditDateAndTimeTo");
	var channel = document.getElementById("programEditChannel");
	var guest = document.getElementById("programEditGuest");
	var youtube = document.getElementById("programEditYoutube");
	var moreInfo = document.getElementById("programEditMoreInfo");
	//alert("==2==");
	if (programName.value.length == 0) {
		//alert("----newsTitle zero-------");
		msg = "errEventName";
		title = "Event Name ";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		programName.focus();
		return false;
	}else if (dateAndTimeFrom.value.length == 0) {
		//alert("----date zero-------");
		msg = "errEditProDateAndTimeFrom";
		title = "Date & TimeFrom";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		dateAndTimeFrom.focus();
		return false;
	}else if (dateAndTimeTo.value.length == 0) {
		//alert("----date zero-------");
		msg = "errEditProDateAndTimeTo";
		title = "Date & Time To";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		errEditProDateAndTimeTo.focus();
		return false;
	}else if (channel.value.length == 0 && youtube.value.length == 0) {
		alert("----channel /youtube  zero-------");
		msg = "errEditProChannel";
		title = "Channel or Youtube";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		//date.focus();
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
							//alert("-------in editProgram--Jsp---programEditYoutube=="+data.EditProgram[key].youtube);
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
				window.location.href = "programList.jsp";
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
							name="programEditName" maxlength=30 onkeyup="validateTitle(id,'Program Name','errEditProgramName',5,30);"> <input type="hidden"
							class="form-control" id="programId" name="programId">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="duration"> Duration *</label> <input type="text"
							class="form-control" id="programEditDuration"
							name="programEditDuration" maxlength=30>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="date & TimeFrom">Date & TimeFrom *</label> <span class="errMsg" id="errEditProDateAndTimeFrom"></span>
						<div class='input-group date' id="programEditTimeFrom">
							<input type='text' class="form-control"
								id="programEditDateAndTimeFrom"
								name="programEditDateAndTimeFrom" maxlength=30
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
								id="programEditDateAndTimeTo" name="programEditDateAndTimeTo" maxlength=30
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
							class="form-control" id="programEditChannel" name="programEditChannel" maxlength=30 
							onkeyup="emptyCheckTwoFields(id,'youtube','Channel or Youtube','errEditProChannel');">
					</div>
				</div>
				
			
			<div class="col-md-5">
				<div class="form-group">
					<label for="youtube">Youtube</label> 
					<input type="text" class="form-control" id="programEditYoutube" name="programEditYoutube" maxlength=30 
						onkeyup="emptyCheckTwoFields(id,'youtube','Channel or Youtube','errEditProChannel');">
				</div>
			</div>
            </div>
            <div class="col-md-5">
					<div class="form-group">
						<label for="guest"> Guest</label> <input type="text"
							class="form-control" id="programEditGuest"
							name="programEditGuest" maxlength=30>
					</div>
				</div>
			<div class="col-md-5">
				<div class="form-group">
					<label for="more_info">More Info</label>
					<textarea class="form-control" rows="5" id="programEditMoreInfo"
						name="programEditMoreInfo" maxlength=250></textarea>
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
							<div class="modal-body">
								<img id="image-gallery-image" class="img-responsive"
									src="images/g2.jpg">
							</div>
							<div class="modal-footer">
								<div class="col-md-2">
									<button type="button" class="btn btn-primary"
										id="show-previous-image" style="display: none;">Previous</button>
								</div>
								<div class="col-md-8 text-justify" id="image-gallery-caption"></div>
								<div class="col-md-2">
									<button type="button" id="show-next-image"
										class="btn btn-default">Next</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
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
				<div id="carousel-example" class="carousel slide"
					data-ride="carousel">
					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active left">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-item">
										<div class="photo">
											<a class="g-image" href="#" data-image-id="1"
												data-toggle="modal" data-title="" data-caption=""
												data-image="images/g2.jpg" data-target="#image-gallery">
												<img class="img-responsive" src="images/g2.jpg"
												alt="Short alt text">
											</a>
										</div>

										<div class="img_tiltle" style="margin-top: 7px;">
											<h2>Image 1</h2>
										</div>

										<div class="caption" style="margin-top: 0px;">
											<div class="checkbox">
												<label> <input id="login-remember" type="checkbox"
													name="remember" value="1"> Show as Public
												</label>
												<div class="suceee_msg">
													<!-- <h4>Updated successfully</h4> -->
												</div>
											</div>
											<div class="delete_box">
												<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>
													Delete</a>
												<div class="suceee_msg">
													<!-- <h4>Delete Message</h4> -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item next left">
							<div class="row">
								<div class="col-md-12">
									<div class="col-item">
										<div class="photo">
											<a class="g-image" href="#" data-image-id="2"
												data-toggle="modal" data-title="" data-caption=""
												data-image="images/g1.jpeg" data-target="#image-gallery">
												<img class="img-responsive" src="images/g1.jpeg"
												alt="Short alt text">
											</a>
										</div>


										<div class="img_tiltle" style="margin-top: 7px;">
											<h2>Image 2</h2>
										</div>

										<div class="caption" style="margin-top: 0px;">
											<div class="checkbox">
												<label> <input id="login-remember" type="checkbox"
													name="remember" value="1"> Show as Public
												</label>
												<div class="suceee_msg">
													<!-- <h4>Updated successfully</h4> -->
												</div>
											</div>
											<div class="delete_box">
												<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>
													Delete</a>
												<div class="suceee_msg">
													<!-- <h4>Delete Message</h4> -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!----------------------photo_gallery end------------------------------>

			<!----------------------video_gallery------------------------------>
			<div class="col-md-6">
				<div class="row">

					<div class="col-md-12 " style="margin-bottom: 10px;">
						<!-- Controls -->
						<div class="controls pull-right">
							<a class="left fa fa-angle-left btn btn-default button-arrow"
								href="#carousel-example1" data-slide="prev"></a> <a
								class="right fa fa-angle-right btn btn-default button-arrow"
								href="#carousel-example1" data-slide="next"></a>
						</div>
					</div>
				</div>
				<div id="carousel-example1" class="carousel slide "
					data-ride="carousel">
					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-item">
										<div class="photo">
											<iframe src="https://player.vimeo.com/video/73051736"
												width="100%" height="347" frameborder="0"
												webkitallowfullscreen="" mozallowfullscreen=""
												allowfullscreen=""></iframe>
										</div>

										<div class="img_tiltle" style="margin-top: 7px;">
											<h2>Video 1</h2>
										</div>

										<div class="caption" style="margin-top: 0px;">
											<div class="checkbox">
												<label> <input id="login-remember" type="checkbox"
													name="remember" value="1"> Show as Public
												</label>
												<div class="suceee_msg">
													<!-- <h4>Updated successfully</h4> -->
												</div>
											</div>
											<div class="delete_box">
												<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>
													Delete</a>
												<div class="suceee_msg">
													<!-- <h4>Delete Message</h4> -->
												</div>
											</div>
										</div>


									</div>
								</div>
							</div>
						</div>
						<div class="item active">
							<div class="row">
								<div class="col-md-12">
									<div class="col-item">
										<div class="photo">
											<iframe src="https://player.vimeo.com/video/73051736"
												width="100%" height="347" frameborder="0"
												webkitallowfullscreen="" mozallowfullscreen=""
												allowfullscreen=""></iframe>
										</div>
									</div>

									<div class="img_tiltle" style="margin-top: 7px;">
										<h2>Video 1</h2>
									</div>

									<div class="caption" style="margin-top: 0px;">
										<div class="checkbox">
											<label> <input id="login-remember" type="checkbox"
												name="remember" value="1"> Show as Public
											</label>
											<div class="suceee_msg">
												<!-- <h4>Updated successfully</h4> -->
											</div>
										</div>
										<div class="delete_box">
											<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>
												Delete</a>
											<div class="suceee_msg">
												<!-- <h4>Delete Message</h4> -->
											</div>
										</div>
									</div>




								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!----------------------video_gallery end------------------------------>

			<!------------------------------guests form--------------------------------------->


			<!------------------------------guests form end--------------------------------------->

			<!-------------------------submit button--------------------------------------->
			<div class="col-md-10">
				<div class="submit_button text-right">
					<a href='#'><button class="btn btn-success btn-sm text-right "
							onclick="programEditFarmValidation();">Submit</button></a>

				</div>
				<div class="message">
					<h3>
						<aside class=" " id="programMessage" style="display: none">Save
							Sucessfully</aside>
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
