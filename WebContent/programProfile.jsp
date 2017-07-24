<!doctype html>
<%
boolean bAdmin = false;
String sRole=(String)session.getAttribute("LOGINROLE"); 
if(sRole != null && sRole.equals("Admin")){
	 bAdmin = true;
} 

%>
<html>
<head>
<script type="text/javascript" src="js/program.js"></script>
</head>
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
	<%-- <jsp:include page="banner.jsp"/>  --%>
	<!----------------------banner end---------------------------------->
<head>

<script type="text/javascript">
$(document)
.ready(
		function() {
			var html = '';
			$
					.ajax({
						url : "emp/programService/getProgramProfile",
						success : function(data) {
							$.each(
											data.ProgramProfile,
											function(key, val) {
												 $('#programProfName')
														.text(
																data.ProgramProfile[key].programName);
												  $('#programProfDuration')
														.text(
																data.ProgramProfile[key].duration); 
												  $('#programProfDate ')
														.text(
																data.ProgramProfile[key].dateAndTimeFrom);
												  $('#programProfDateTo')
													.text(
															data.ProgramProfile[key].dateAndTimeTo);
												$('#programProfChannel')
														.text(
																data.ProgramProfile[key].channel);
												$('#programProfYoutube')
												.text(
														data.ProgramProfile[key].youtube);
												$(
														'#programProfGuest')
														.text(
																data.ProgramProfile[key].guest);
												$(
												'#programProfMoreInfo')
												.text(
														data.ProgramProfile[key].moreInfo);
												$('#programProfProgramId')
														.val(
																data.ProgramProfile[key].programId); 
											})
											showProgramProfImages(data);
											$.each(
													data.PROGRAMFILES,
													function(key, val) {
														html = html
													})
													
													$(html).appendTo("#programImages");
							
						}
					});
		});
function editProfProgram() {
	var programId = $("#programProfProgramId").val();
	var progarmObject = new Object();
	programObject.programId = programId;
	$.ajax({
		data : programObject,
		url : "emp/progarmService/getProgramId",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});

}
function showProgramProfImages(data){
	var dispImages = '';
	var dispClas = '';
	var dispChkd = '';
	var dispItem = '';
	var dispImgCtrls = true;
	if(data.PROGRAMFILES != null){
	
	$.each(
			data.PROGRAMFILES,
			function(key, val) {
				dispImgCtrls = false;
				var filename = data.PROGRAMFILES[key].filePath;
				var fExt = filename.split('.').pop();
				if(fExt != null && ((fExt == 'mp4') || (fExt == 'wmv') || (fExt == 'avi') || (fExt == 'flv') || (fExt == 'mov'))){
					dispItem = '<iframe src="'+data.PROGRAMFILES[key].filePath+'" autoplay="false" autostart="false" style="text-align: center;width: 100%" type="audio/mp4" height="100" width="100" align="middle"></iframe>';
				}else{
					dispItem = '<img src="'+data.PROGRAMFILES[key].filePath+'" class="img-responsive" alt="" height="100" width="100" align="middle">';
				}
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
							  +dispItem
							+'</a>'
						+'</div>'
						+'</div>'
					+'</li>'
				+'</ul>'
			+'</div>'
			})
			document.getElementById("programProfImages").innerHTML = dispImages;
			$.getScript('http://dovasofttech.com/usgfa/js/popup.js');
	}
	if(dispImgCtrls){
		document.getElementById("programProfImgCtrl").style.display = 'none';
	}
}
</script>
</head>

<!----------------------body_content start-------------------------->

<div class="clearfix"></div>
<div id="aboutus">
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>Program Profile</h2>
				<div class="line3"></div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>

<div class="container" style="margin-top: 20px;">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-10 toppad">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">Prorgam Form Profile</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-10 col-lg-8 col-md-offset-2">
							<table
								class="table table-user-information  table-bordered table-responsive">
								<tbody>
									<tr>
										<td class="text-nowrap"><b>Program Name:</b></td>
										<td><div id="programProfName">
												<input type="hidden" class="form-control"
													id="programProfProgramId" name="programProfProgramId">
											</div> <!-- <input type="hidden"class="form-control" id="programProfProgramId" name="programProfProgramId"> -->
										</td>
									</tr>
									<tr>
										<td><b>Duration:</b></td>
										<td><div id="programProfDuration"></div></td>
									</tr>
									<tr>
										<td><b>Date & TIme From:</b></td>
										<td><div id="programProfDate"></div></td>
									</tr>
									<tr>
										<td><b>Date & Time To:</b></td>
										<td><div id="programProfDateTo"></div></td>
									</tr>
									<tr>
										<td><b>Channel:</b></td>
										<td><div id="programProfChannel"></td>
									</tr>
									<tr>
										<td><b>Youtube:</b></td>
										<td><div id="programProfYoutube"></td>
									</tr>
									<tr>
										<td><b>Guest:</b></td>
										<td><div id="programProfGuest"></td>
									</tr>
									<tr>
										<td><b>More Info:</b></td>
										<td><div id="programProfMoreInfo"></td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
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
									<div class="modal-body" id="modelBodyNewsProf">
									    <img id="image-gallery-image" align="middle" class="img-responsive" src="">
									</div>
									<div class="modal-footer">
										<div class="col-md-2">
											<button type="button" class="btn btn-primary"
												id="show-previous-image" style="display: none;">Previous</button>
										</div>
										<div class="col-md-8 text-justify" id="image-gallery-caption"></div>
										<div class="col-md-2">
											<button type="button" id="show-next-image"
												class="btn btn-primary">Next</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row" id="programProfImgCtrl">
						<div class="col-md-6" style="margin-left: 250px;">
							<nav>
								<ul class="control-box pager text-left">
									<li><a data-slide="prev" href="#myCarousel" class=""><i
											class="glyphicon glyphicon-chevron-left"></i></a></li>
									<li><a data-slide="next" href="#myCarousel" class="">
											<i class="glyphicon glyphicon-chevron-right"></i>
									</a></li>
								</ul>
							</nav>
							<div class="carousel slide" id="myCarousel">
								<div class="carousel-inner" id="programProfImages">
								</div>

								<!-- /.control-box -->

							</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-md-12">


							<div class="card-footer p-0  hidden">
								<nav aria-label="...">
									<ul class="pagination justify-content-end mt-3 mr-3">
										<li class="page-item disabled"><span class="page-link">Previous</span>
										</li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item active"><span class="page-link">2<span
												class="sr-only">(current)</span>
										</span></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">Next</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<%if(bAdmin){ %>
				<div class="panel-footer">
					<span> <a href="programEdit.jsp"
						onclick="editProfProgram()" data-original-title="Edit this user"
						data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<%} else{%>
				<div class="panel-footer">
					<span> <a  data-original-title="Edit this user"
						data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<%}%>
			</div>
		</div>
	</div>
</div>

<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
