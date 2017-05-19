<!doctype html>
<html>
<head>
<script type="text/javascript">
	function newsFarmValidation() {
		//alert("==Entered==");
		$("#newsMessage").text("");
		//alert("==1==");
		var newsTitle = document.getElementById("newsTitle");
		var date = document.getElementById("date");
		var paper = document.getElementById("paper");
		var link = document.getElementById("link");
		var moreInfo = document.getElementById("moreInfo");
		//alert("==2==");
		if (emptyCheck(newsTitle, "Name Title", "newsMessage")
				&& minLenCheck(newsTitle, 5, "newsTitle", "newsMessage")
				&& maxLenCheck(newsTitle, 30, "Name Title", "newsMessage")
				&& allLetter(newsTitle, "Name Title", "newsMessage")
				&& emptyCheck(date, "Date", "newsMessage")
				&& minLenCheck(date, 5, "newsTitle", "newsMessage")
				&& maxLenCheck(date, 30, "Name Title", "newsMessage")
				&& twoFieldsCheck(paper, link, "Paper or Link/Url","newsMessage")
			   /*  && minLenCheck(paper, 5, "Paper", "newsMessage")
				&& maxLenCheck(paper, 30, "Paper", "newsMessage")
				&& minLenCheck(link, 5, "Link/Url", "newsMessage")
				&& maxLenCheck(link, 30, "Link/Url", "newsMessage") */
				&& (emptyCheck(moreInfo, "More Info", "newsMessage")
				&& minLenCheck(moreInfo, 5, "More Info", "newsMessage")
				&& maxLenCheck(moreInfo, 30, "More Info", "newsMessage"))) {

			newsSave();
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

		//alert("-----b4 ajax-------");

		$.ajax({
			data : newsObject,
			url : "emp/newsService/addNews",
			success : function(data) {

				if (data.Msg = "success") {
					//window.location.href = "newsList.jsp";
					window.location.href = "newsList.jsp";
					//alert("in to newsSave");
				}
			}
		});
		 /* $.ajax({
			data : newsObject,
			url : "emp/newsService/getNewsImages",
			success : function(data) {
				if (data.Msg = "success") {
					alert("in to newsSave");
				}
			}
		});  */

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
					<label for="event_name"><h4>* These fields are required</h4></label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="event_name">Name Title *</label> <input type="text"
							class="form-control" id="newsTitle" name="newsTitle" tabindex="1"  required data-error="">
                      <div class="help-block with-errors"></div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="time_from">Date *</label>
						<div class='input-group date' id="newsDate">
							<input type='text' class="form-control" id="date" name="date"
								tabindex="2" /> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Paper</label> <input type="text"
							class="form-control" id="paper" name="paper" tabindex="3">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Link/Url</label> <input type="text"
							class="form-control" id="link" name="link" tabindex="4">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="more_info">More Info *</label>
						<textarea class="form-control" rows="5" id="moreInfo"
							name="moreInfo" tabindex="5"></textarea>
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
					<div class="message" id="">

						<h3>
							<aside class=" " id="newsMessage" style="display: none">
							</aside>
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
    $(function () {
	
        $('#newsDate').datetimepicker({
			 useCurrent: false,
        	 format: 'DD/MM/YYYY'
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
</body>
</html>
<jsp:include page="login.jsp" />
