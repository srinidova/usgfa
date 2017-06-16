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
	<%-- <jsp:include page="banner.jsp" /> --%>
	<!----------------------banner end---------------------------------->
<head>

<script type="text/javascript">
function newsEditFarmValidation() {
	$("#newsMessage").text("");
	var newsTitle = document.getElementById("newsEditTitle");
	var date = document.getElementById("newsEditDate");
	var paper = document.getElementById("newsEditPaper");
	var link = document.getElementById("newsEditLink");
	var moreInfo = document.getElementById("newsEditMoreInfo");
	var msg = "";
    var title = "";
    $("#newsEditFailMsg").text();
	if(newsTitle.value.length == 0){
		msg = "errEditNewsNameTitle";
		title = "Name Title";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		newsTitle.focus();
		return false;
	} else if (date.value.length == 0) {
		msg = "errDate";
		title = "Date";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		date.focus();
		return false;
	}else if (paper.value.length == 0 && link.value.length == 0) {
		msg = "errEditNewsPaper";
		title = "Paper or Link/Url";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		return false;
	}else{
		$("#errEditNewsNameTitle").text("");
		$("#errEditNewsDate").text("");
		$("#errEditNewsPaper").text("");
		newsUpdateNew();
		//newsUpdate();
	}

}
$(document).ready(function() {
	$.ajax({
		url : "emp/newsService/editNews",
		success : function(data) {
				$.each(
						data.EditNews,
						function(key, val) {
						$('#newsId').val(data.EditNews[key].newsId);	
						$('#newsEditTitle').val(data.EditNews[key].newsTitle);
					 	$('#newsEditDate').val(data.EditNews[key].date);
						$('#newsEditPaper').val(data.EditNews[key].paper);
						$('#newsEditLink').val(data.EditNews[key].link);
						$('#newsEditMoreInfo').val(data.EditNews[key].moreInfo);
						}
				)
				showNewsImages(data);
		}
	});
});

function newsUpdate(){
	var newsId = $("#newsId").val();
	var newsTitle = $("#newsEditTitle").val();
	var date = $("#newsEditDate").val();
	var paper = $("#newsEditPaper").val();
	var link = $("#newsEditLink").val();
	var moreInfo = $("#newsEditMoreInfo").val();

	
	var newsObject = new Object();
	newsObject.newsId = newsId;
	newsObject.newsTitle = newsTitle;
	newsObject.paper = paper;
	newsObject.date = date;
	newsObject.link = link;
	newsObject.moreInfo = moreInfo;
$
	.ajax({
		data : newsObject,
		url : "emp/newsService/newsUpdate",
		success : function(data) {
			 if (data.Msg == 'success') {
				window.location.href = "newsList.jsp";
			}else{
				$("#newsEditFailMsg").text("News Edit Failed");
			} 
		}
	});
	
}


function newsUpdateNew(){
	var newsId = $("#newsId").val();
	var newsTitle = $("#newsEditTitle").val();
	var date = $("#newsEditDate").val();
	var paper = $("#newsEditPaper").val();
	var link = $("#newsEditLink").val();
	var moreInfo = $("#newsEditMoreInfo").val();
	var file = $("#file")[0].files[0];

	var formData = new FormData();
	formData.append("newsId", newsId);
	formData.append("newsTitle", newsTitle);
	formData.append("paper", paper);
	formData.append("date", date);
	formData.append("link", link);
	formData.append("moreInfo", moreInfo);
	formData.append("file", $("#file")[0].files[0]);

	$.ajax({
		type: 'POST',
		url : "emp/newsService/newsUpdateNew",
    	data: formData,
    	cache: false,
    	contentType: false,
    	processData: false,
		success : function(data) {
			if (data.Msg == 'success') {
				window.location.href = "newsList.jsp";
			}else{
				$("#newsEditFailMsg").text("News Edit Failed");
			}  
		}
	});
}

function showNewsImages(data){
	var dispImages = '';
	var dispClas = '';
	var dispChkd = '';
	var imgCtrl = true;
	$.each(
			data.NEWSFILES,
			function(key, val) {
				//alert(data.NEWSFILES[key].showPublic);
				imgCtrl = false;
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
								+'<a href="#">'
								     +'<img src="'+data.NEWSFILES[key].filePath+'" class="img-responsive" alt="">'
								+'</a>'
							+'</div>'
							+'<div class="caption">'
								+'<div class="checkbox">'
									+'<label>'
									    +'<input id="'+data.NEWSFILES[key].fileId+'" onclick="updateShowAsPublicNews(this.id);" type="checkbox" value="'+data.NEWSFILES[key].fileId+'" name="remember"  '+ dispChkd +'> Show as Public'
									+'</label>'
									+'<div class="suceee_msg"></div>'
								+'</div>'
								+'<div class="delete_box">'
									+'<a href="#" name="'+data.NEWSFILES[key].fileId+'" onclick="deleteFileNews(this.name);"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
									+'<div class="suceee_msg"></div>'
								+'</div>'
							+'</div>'
						+'</div>'
					+'</li>'
				+'</ul>'
			+'</div>'
			})
			document.getElementById("newsEditImages").innerHTML = dispImages;
			if(imgCtrl){
				document.getElementById("newsEditImagesCont").style.display = 'none';
			}
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
alert("fileId--------"+fileId);
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
</script>
</head>
<!----------------------body_content start-------------------------->

<div class="clearfix"></div>
<div id="aboutus">
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>News Edit</h2>
				<div class="line3"></div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>

<div class="container" style="margin-top: 30px;"></div>
<div class="container" style="margin-top: 30px;">
	<div class="row">
		<div class="col-md-12">

			<div class="from">
				<div class="form-group">
					<label for="event_name"><h4>* These fields are required</h4></label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="event_name">Name Title *</label> <span class="errMsg" id="errEditNewsNameTitle"></span>
						<input type="text" class="form-control" id="newsEditTitle" name="newsEditTitle" maxlength="30"
						onkeyup="validateTitle(id,'Name Title','errEditNewsNameTitle',3,30);">
						<input type="hidden" class="form-control" id="newsId" name="newsId">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="time_from">Date *</label> <span class="errMsg" id="errEditNewsDate"></span>
						<div class='input-group date' id="newsEditDate1">
							<input type='text' class="form-control" id="newsEditDate" name="newsEditDate" maxlength="30"
							onkeyup="validateTitle(id,'Date','errEditNewsDate',3,30);"/> 
							<span class="input-group-addon">
							 <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Paper *</label> 
						<span class="errMsg" id="errEditNewsPaper"></span> 
						<input type="text" class="form-control" id="newsEditPaper" name="newsEditPaper" maxlength="30"
						onkeyup="emptyCheckTwoFields(id,'link', 'Paper or Link/Url','errEditNewsPaper');">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Link/Url *</label> 
						<input type="text" class="form-control" id="newsEditLink" name="newsEditLink" maxlength="30"
						onkeyup="emptyCheckTwoFields('link', id,'Paper or Link/Url','errEditNewsPaper');">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="more_info">More Info *</label>
						<textarea class="form-control" rows="5" id="newsEditMoreInfo" name="newsEditMoreInfo" maxlength="250"></textarea>
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
						<form method="post" action="emp/commonUtils/upload" enctype="multipart/form-data">
							<div class="form-group col-md-6">
								<label for="Upload Photo">Select Photo(s)</label> 
								<input id="file"  name ="file" class="file form-control" type="file">
								<!-- <a href="#"><button class="btn btn-success btn-sm text-right">Upload</button></a> -->
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
				<div class="col-md-6" style="margin-left: 250px;">
					<div class="row">

						<div class="col-md-12" style="margin-bottom: 10px;" id="newsEditImagesCont">
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
						<div class="carousel-inner" id="newsEditImages">
						</div>
					</div>
				</div>
				<!----------------------photo_gallery end------------------------------>
				<!-------------------------submit button--------------------------------------->
				<div class="col-md-10">
					<div class="submit_button text-right">
						<a href='#'><button class="btn btn-success btn-sm text-right " onclick="newsEditFarmValidation();">Submit</button></a>
					</div>
					<div class="message" id="newsfrm_message">
						<h3>
				         <aside class="formFailMsg" id="newsEditFailMsg"></aside>
			       </h3>
					</div>
				</div>

				<!-------------------------submit button end--------------------------------------->


				<div class="clearfix"></div>
			</div>
		</div>

	</div>
</div>
<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
<script type="text/javascript">
    $(function () {
	
        $('#newsEditDate1').datetimepicker({
			 useCurrent: false,
			 format: 'DD/MM/YYYY'
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
</body>
</html>
<jsp:include page="login.jsp" />
