<!doctype html>
<html>
<head>
<script type="text/javascript" src="js/news.js"></script>
<script type="text/javascript">
	function newsFarmValidation() {
		//alert("----in newsFarmValidation-------");

		var newsTitle = document.getElementById("newsTitle");
		var date = document.getElementById("date");
		//alert("date.value.length ==="+date.value.length );
		if (date.value.length > 0) {
			$("#errDate").text("");
		}
		var moreInfo = document.getElementById("moreInfo");
		//alert("moreInfo.value.length ==="+moreInfo.value );
		var paper = document.getElementById("paper");
		var link = document.getElementById("link");
		var msg = "";
		var title = "";
		$("#newsRegFailMsg").text("");
        
		if (newsTitle.value.length == 0) {
			//alert("----newsTitle zero-------");
			msg = "errNewsTitle";
			title = "Name Title ";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			newsTitle.focus();
			return false;
		} else if (date.value.length == 0) {
			//alert("----date zero-------");
			msg = "errDate";
			title = "Date";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			date.focus();
			return false;
		} else if (paper.value.length == 0 && link.value.length == 0) {
			//alert("----paper /link  zero-------");
			msg = "errPaper";
			title = "Paper or Link/Url";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			//date.focus();
			return false;
		} else if (moreInfo.value.length == 0) {
			//alert("----moreInfo zero-------");
			msg = "errMoreInfo";
			title = "MoreInfo";

			$("#" + msg).text(title + " should not be empty");
			$("#" + msg).show();
			moreInfo.focus();
			return false;
		} else {
			$("#errNewsTitle").text("");
			$("#errDate").text("");
			$("#errPaper").text("");
			$("#errMoreInfo").text("");
			newsSave();
			//alert("------OK-------");
		}

	}

	function newsSave() {
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

		$.ajax({
			data : newsObject,
			url : "emp/newsService/addNews",
			success : function(data) {

				/* if (data.Msg = "success") {
					window.location.href = "newsList.jsp";
				} */
				if (data.Msg == 'success') {
					//alert(".....success......");
					window.location.href = "newsList.jsp";
					//alert("a4...........");
				}else{
					//alert(".....error......");
					$("#newsRegFailMsg").text("News Registration Failed");
				}  
			}
		});

	}
</script>
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
<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}

function test2 (){alert ("**************");
	
}
</style>

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
				<div class="form-group">
					<label for="event_name">
						<h4>* These fields are required</h4>
					</label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="news_name">Name Title *</label> <span class="errMsg"
							id="errNewsTitle"></span> <input type="text" class="form-control"
							id="newsTitle" name="newsTitle" tabindex="1" maxlength="30"
							onkeyup="validateTitle(id,'Name Title','errNewsTitle',5,30);">
						<div class="help-block with-errors"></div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="time_from">Date *</label> 
						<span class="errMsg" id="errDate"></span>
						<div class='input-group date' id="newsDate">
						   <input type='text' class="form-control" id="date" name="date"  maxlength="30" tabindex="2" /> 
						   <span class="input-group-addon"> 
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Paper *</label> 
						<span class="errMsg" id="errPaper"></span> 
						<input type="text" class="form-control" id="paper" name="paper" tabindex="3" maxlength="30"
							onkeyup="emptyCheckTwoFields(id,'link', 'Paper or Link/Url','errPaper');">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Link/Url *</label> 
						<input type="text" class="form-control" id="link" name="link" maxlength="30" tabindex="4"
							onkeyup="emptyCheckTwoFields('link', id,'Paper or Link/Url','errPaper');">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="more_info">More Info *</label> <span class="errMsg"
							id="errMoreInfo"></span>
						<textarea class="form-control" rows="5" id="moreInfo"
							name="moreInfo" tabindex="5" maxlength="250"
							onkeyup="emptyCheck(id,'More Info','errMoreInfo');">
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
						<!-- <a href='#'> -->
						<button class="btn btn-success btn-sm text-right "
							onclick="newsFarmValidation();">Submit</button>
						<!-- </a> -->

					</div>
					<div class="message" id="newsfrm_message">

						<h3>
				<aside class="formFailMsg" id="newsRegFailMsg"></aside>
			</h3>
					</div>
					<!-- <div class="col-md-12"> <br>
                    <small class="text-muted " style="text-align:right; float:right;"><strong>*</strong> These fields are required.</small> </div> -->
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
	$(function() {

		$('#newsDate').datetimepicker({
			useCurrent : false,
			format : 'DD/MM/YYYY'
		});
	});
	
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var moreInfo = document.getElementById("moreInfo");
		if (moreInfo.value.length > 0) {
			$("#moreInfo").text("");
		}
	});
</script>
</body>
</html>
<jsp:include page="login.jsp" />
