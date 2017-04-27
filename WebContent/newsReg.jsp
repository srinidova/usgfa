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
<script type="text/javascript">
function newsSave(){
	var newsTitle = $("#newsTitle").val();
	var date = $("#date").val();
	var paper = $("#paper").val();
	var link = $("#link").val();
	var moreInfo = $("#moreInfo").val();

	
	var newsObject = new Object();
	newsObject.newsTitle = newsTitle;
	newsObject.paper = paper;
	newsObject.date = date;
	newsObject.link = link;
	newsObject.moreInfo = moreInfo;
$
	.ajax({
		data : newsObject,
		url : "emp/newsService/addNews",
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
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>News New</h2>
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
						<label for="event_name">Name Title</label> <input type="text"
							class="form-control" id="newsTitle" name="newsTitle">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="time_from">Date</label>
						<div class='input-group date' id='datetimepicker8'>
							<input type='text' class="form-control" id="date" name="date" />
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark"> Paper</label> <input type="text"
							class="form-control" id="paper" name="paper">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Link/Url</label> <input type="text"
							class="form-control" id="link" name="link">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="more_info">More Info</label>
						<textarea class="form-control" rows="5" id="moreInfo"
							name="moreInfo"></textarea>
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
						<a href='newsList.jsp'><button
								class="btn btn-success btn-sm text-right " onclick="newsSave();">Submit</button></a>

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
</div>
<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
