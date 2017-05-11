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
<!-- <script type="text/javascript" src="js/news.js"></script> -->
<script type="text/javascript" src="js/scriptUtils.js"></script>
<script type="text/javascript">
function newsEditFarmValidation() {
	//alert("==Entered==");
	$("#newsMessage").text("");
	//alert("==1==");
	var newsTitle = document.getElementById("newsEditTitle");
	var date = document.getElementById("newsEditDate");
	var paper = document.getElementById("newsEditPaper");
	var link = document.getElementById("newsEditLink");
	var moreInfo = document.getElementById("newsEditMoreInfo");
	//alert("==2==");
	if (emptyCheck(newsEditTitle, "Name Title", "newsMessage")
			&& minLenCheck(newsEditTitle, 5, "Name Title", "newsMessage")
			&& maxLenCheck(newsEditTitle, 10, "Name Title", "newsMessage")
			&& allLetter(newsEditTitle, "Name Title", "newsMessage")
			&& emptyCheck(newsEditDate, "Date", "newsMessage")
			&& twoFieldsCheck(newsEditPaper, newsEditLink, "Paper or Link/Url",
					"newsMessage")
			&& (emptyCheck(newsEditMoreInfo, "More Info", "newsMessage"))) {

		newsUpdate();
	}

}
$(document).ready(function() {
	alert("-------in editNews--Jsp---");
	$.ajax({
		url : "emp/newsService/editNews",
		success : function(data) {
				$.each(
						data.EditNews,
						function(key, val) {
							alert("-------in editNews--Jsp---newsTitle=="+data.EditNews[key].newsTitle);
						$('#newsId').val(data.EditNews[key].newsId);	
						$('#newsEditTitle').val(data.EditNews[key].newsTitle);
					 	$('#newsEditDate').val(data.EditNews[key].date);
						$('#newsEditPaper').val(data.EditNews[key].paper);
						$('#newsEditLink').val(data.EditNews[key].link);
						$('#newsEditMoreInfo').val(data.EditNews[key].moreInfo);
						}
				)
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

	alert("in to newsEditPage");
	
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
			if (data.Msg = "success") {
				alert("in to newsEdit");
				window.location.href = "newsList.jsp";
				alert("a4...........newsEdit");
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
				<div class="col-md-5">
					<div class="form-group">
						<label for="event_name">Name Title</label> 
						<input type="text" class="form-control" id="newsEditTitle" name="newsEditTitle">
						<input type="hidden" class="form-control" id="newsId" name="newsId">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="time_from">Date</label>
						<div class='input-group date' id='datetimepicker8'>
							<input type='text' class="form-control" id="newsEditDate" name="newsEditDate" /> 
							<span class="input-group-addon">
							 <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark"> Paper</label> 
						<input type="text" class="form-control" id="newsEditPaper" name="newsEditPaper">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Link/Url</label> 
						<input type="text" class="form-control" id="newsEditLink" name="newsEditLink">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="more_info">More Info</label>
						<textarea class="form-control" rows="5" id="newsEditMoreInfo" name="newsEditMoreInfo"></textarea>
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
						<a href='#'><button class="btn btn-success btn-sm text-right " onclick="newsEditFarmValidation();">Submit</button></a>
					</div>
					<div class="message">
						<h3><aside class=" " id="newsMessage" style="display: none">Save Sucessfully</aside></h3>
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
</body>
</html>
<jsp:include page="login.jsp" />
