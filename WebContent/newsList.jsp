<!doctype html>
<html>

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
<script type="text/javascript">
$(document).ready(function() {
	//alert("-------1-----");
	getNewsDetails();
});

function getNewsDetails() {
	//alert("-------2-----");
	var html = '';
	$.ajax({
				url : "emp/newsService/getNewsDetails",
				success : function(data) {
					$.each(
							data.NewsDetails,
							function(key, val) {
								//alert(data.NewsDetails[key].newsTitle);
								
									html = html
									     + '<tr>'
										     + '<td style="width: 360px;">'+data.NewsDetails[key].newsTitle+'</td>'
										     +  '<td style="width: 160px;">'+data.NewsDetails[key].date+'</td>'
											 +  '<td style="width: 160px;">'+data.NewsDetails[key].paper+'</td>'
											 +  '<td>'+data.NewsDetails[key].link+'</td>'
											 +  '<td style ="width:50px;">'
											 	+ '<ul class="actions">'
											 		+ '<li>'
											 			+ '<a href="newsProfile.jsp"> '
											 				+ '<button id='+data.NewsDetails[key].newsId+' class="btn btn-success btn-sm" onclick="getNewsProfile(this.id)">'
											 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		+ '<li>'
											 			+ '<a href="newsEdit.jsp"> '
											 				+ '<button id='+data.NewsDetails[key].newsId+' class="btn btn-primary btn-sm" onclick="editNews(this.id)">'
											 					+ '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		+ '<li>'
											 			+ '<a href="newsList.jsp"> '
											 				+ '<button id='+data.NewsDetails[key].newsId+' class="btn btn-danger btn-sm" onclick="deleteNews(this.id)">'
											 					+ '<i class="fa fa-trash-o" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 	+ ' </ul>'
											 +  '</td>'
									     + '</tr>';
							}
					)
					$(html).appendTo("#newsListData");
				}
					
	});
}

function deleteNews(newsId){
	//alert("newsId=="+newsId);
	var newsObject = new Object();
	newsObject.newsId = newsId;
	$.ajax({
		data : newsObject,
		url : "emp/newsService/deleteNews",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
	
}
function getNewsProfile(newsId){
	//alert("getNewsProfile..........newsId=="+newsId);
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

function editNews(newsId){
	//alert("editNews----------newsId=="+newsId);
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

</script>
</head>
<body>
	<!----------------------body_content start-------------------------->

	<div class="clearfix"></div>
	<div id="aboutus">
		<div class="container">
			<div class="row">
				<div class="aboutus">
					<h2>News List</h2>
					<div class="line3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>


	<div class="container" style="margin-top: 30px;">
		<div class="row">
			<div class="col-md-12">


				<div class="member_list">
					<div class="row">

						<div class="col-md-10">
							<div class="table-responsive">
								<table class="table  table-bordered">
									<tr>
										<th>Name Title</th>
										<th>Date</th>
										<th>Paper</th>
										<th>Link/Url</th>
										<th></th>
									</tr>
									<tr>
										<td><div class="row">
												<div class="col-md-10">
													<input type="text" name='name0' placeholder='Name Title'
														class="form-control " style="width: 200px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Date'
														class="form-control " style="width: 80px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Paper'
														class="form-control " style="width: 80px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" class="form-control" style=""
														placeholder="" cols="0" rows="1">
												</div>
											</div></td>
										<td></td>
									</tr>
									<!--tr>
                  <td>Abcdef</td>
                  <td>10 days</td>
                  <td>10-02-2016</td>
                  <td>H.No: 8-2-608/27, Mastan Mansion,<br>
                    Gaffer Khan Colony, Road No. 10,<br>
                    Banjarahills, Hyderabad, TS, India -500034</td>
                  <td style ="width:50px;"><ul class="actions">
                      <li> <a href="event-profile.html">
                       <a href="newsProfile.html"> <button class="btn btn-success btn-sm"><i class="fa fa-eye" aria-hidden="true"></i></button>
                        </a> </li>
                      <li> <a href="#">
                        <a href="newsEdit.html"><button class="btn  btn-primary btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></a>
                        </a> </li>
                      <li> <a href="#">
                        <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                        </a> </li>
                    </ul></td>
                </tr-->
								</table>
								<div class="member_list">
									<div class="row">

										<div class="col-md-10">
											<div class="table-responsive">
												<table class="table  table-bordered">
													<div id="newsListData"></div>
												</table>
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
	</div>
	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	<jsp:include page="footer.jsp" />
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
