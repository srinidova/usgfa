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
	<%-- <jsp:include page="banner.jsp" /> --%>
	<!----------------------banner end---------------------------------->
<head>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						alert("1.in to committee profile");
						$.ajax({
									url : "emp/CommitteeService/getCommitteeProfile",
									success : function(data) {
										$.each(
														
														data.CommitteeProfile,
														function(key, val) {
															alert("2.in to committee profile");
															$('#committeeProfMember')
																	.text(
																			data.CommitteeProfile.newsTitle);
															$('#committeeProfRole')
																	.text(
																			data.CommitteeProfile.date);
															$('#committeeProfDisplay')
																	.text(
																			data.CommitteeProfile.paper);
															$('#committeeProfComment')
																	.text(
																			data.CommitteeProfile.link);
															$(
																	'#newsProfMoreInfo')
																	.text(
																			data.NewsProfile[key].moreInfo);
															$('#commiteProfCommitteeId')
																	.val(
																			data.CommitteeProfile.newsId);
														})
														showNewsImages(data);
									}
								});
						

					});
	function editProfNews() {
		var newsId = $("#newsProfNewsId").val();
		var newsObject = new Object();
		newsObject.newsId = newsId;
		$.ajax({
			data : newsObject,
			url : "emp/newsService/getNewsId",
			success : function(data) {
				if (data.Msg = "success") {
				}
			}
		});

	}
	
	function updateShowAsPublicNews(fileId){
		var setVal = '';
		if(document.getElementById(fileId).checked){
			setVal = '1';
		}else{
			setVal = '0';
		}
		var uploadFileObject = new Object();
		uploadFileObject.fileId = fileId; 
		uploadFileObject.showAsPublic = setVal;
		uploadFileObject.type = "NEWS";
  		$.ajax({
			data : uploadFileObject,
			url : "emp/uploadService/updateShowAsPublic",
			success : function(data) {
				if (data.Msg = "success") {
					showNewsImages(data);
				}
			}
		}); 
	}
	
	function deleteFileNews(fileId){
		var newsObject = new Object();
		newsObject.fileId = fileId; 
		newsObject.type = "NEWS";
		$.ajax({
			data : newsObject,
			url : "emp/uploadService/deleteImage",
			success : function(data) {
				if (data.Msg = "success") {
					showNewsImages(data);
				}
			}
		});
	}

	
	function showNewsImages(data){
	var dispImages = '';
	var dispClas = '';
	var dispChkd = '';
	var dispImgCtrls = true;
	if(data.NEWSFILES != null){
	
	$.each(
			data.NEWSFILES,
			function(key, val) {
				dispImgCtrls = false;
				if(data.NEWSFILES[key].showPublic == 1){
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
								+'<a class="g-image" href="#" data-image-id="" data-toggle="modal" data-title="" data-caption="" data-image="'+data.NEWSFILES[key].filePath+'" data-target="#image-gallery">'
								  +'<img src="'+data.NEWSFILES[key].filePath+'" class="img-responsive" alt="" height="100" width="100" align="middle">'
								+'</a>'
							+'</div>'
						+'</div>'
					+'</li>'
				+'</ul>'
			+'</div>'
			})
			document.getElementById("newsImages").innerHTML = dispImages;
			$.getScript('http://dovasofttech.com/usgfa/js/popup.js');
	}
			if(dispImgCtrls){
				document.getElementById("newsProfImgCtrl").style.display = 'none';
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
				<h2>Committee Profile</h2>
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
					<h3 class="panel-title">Committee Form Profile</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-10 col-lg-8 col-md-offset-2">
							<table
								class="table table-user-information  table-bordered table-responsive">
								<tbody>
									<tr>
										<td class="text-nowrap"><b> Member:</b></td>
										<td>
											<div id="committeeProfMember"></div> 
											<input type="hidden" class="form-control" id="commiteProfCommitteeId"
											name="commiteProfCommitteeId">
										</td>
									</tr>
									<tr>
										<td><b>Role</b></td>
										<td><div id="committeeProfRole"></div></td>
									</tr>
									<tr>
										<td><b>DisplayOrder</b></td>
										<td><div id="committeeProfDisplay"></div></td>
									</tr>
									<tr>
										<td><b>Comment:</b></td>
										<td><div id="committeeProfComment"></div></td>
									</tr>

									<!-- <tr>
										<td><b>More Info:</b></td>
										<td><div id="newsProfMoreInfo"></div></td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</div>
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
					<div class="col-md-6" style="margin-left: 250px;" id="newsProfImgCtrl">
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
							<div class="carousel-inner" id="newsImages">
								
							</div>
						</div>
					</div>
					<!----------------------photo_gallery end------------------------------>

                    <!----------------------video_gallery------------------------------>
					<!----------------------video_gallery end------------------------------>

				</div>
				<%if(bAdmin){ %>
				<div class="panel-footer">
					<span> <a href="newsEdit.jsp" onclick="editProfNews()"
						data-original-title="Edit this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<%}else {%>
				<div class="panel-footer">
					<span> <a data-original-title="Edit this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<% }%>
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
