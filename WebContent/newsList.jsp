<!doctype html>
<%
boolean bAdmin = false;
String sRole=(String)session.getAttribute("LOGINROLE"); 
if(sRole != null && sRole.equals("Admin")){
	 bAdmin = true;
} 
%>
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
	
	                 <style>
        
        #newsListData{
    width: 100%;
    float: left;
    margin: auto;
    display: inline-table;
}


  
    tr td.e_mn{width:330px;}
    tr td.e_mn_1{width:150px;}
     tr td.e_mn_2{width:150px;}
      tr td.e_mn_3{width:280px;}
    

td ul.actions li {
    /* display: inline-block; */
    display: block;
}

        </style>
<head>

<script type="text/javascript">
$(document).ready(function() {
	getNewsDetails();
});

function getNewsDetails() {
	var html = '<div class="row"><div class="col-md-12"><table class="table table-bordered">';
	$.ajax({
				url : "emp/newsService/getNewsDetails",
				success : function(data) {
					showNewsList(data);
					<%-- $.each(
							data.NewsDetails,
							function(key, val) {
								
									html = html
									     + '<tr>'
										     + '<td class="e_mn">'+data.NewsDetails[key].newsTitle+'</td>'
										     +  '<td class="e_mn_1">'+data.NewsDetails[key].date+'</td>'
											 +  '<td class="e_mn_2">'+data.NewsDetails[key].paper+'</td>'
											 +  '<td class="e_mn_3">'+data.NewsDetails[key].link+'</td>'
											 +  '<td class="e_mn_">'
											 	+ '<ul class="actions">'
											 		+ '<li>'
											 			+ '<a href="newsProfile.jsp"> '
											 				+ '<button id='+data.NewsDetails[key].newsId+' class="btn btn-success btn-sm" onclick="getNewsProfile(this.id)">'
											 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		<%if(bAdmin){ %>
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
											 		<%}%>
											 	+ ' </ul>'
											 +  '</td>'
									     + '</tr>';
							}
					)
					$(html).appendTo("#newsListData");
					$(html).appendTo("</table></div></div>"); --%>
				}
					
	});
}

function deleteNews(newsId){
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

function searchNews(){
	//alert("in to search news");
	document.getElementById("newsListData").innerHTML = "";
	var nameTitle = $("#searchNameTitle").val();
	var paper = $("#searchPaper").val();
	var link = $("#searchLink").val();
	
	var newsObject = new Object();
	newsObject.nameTitle = nameTitle;
	newsObject.paper = paper;
	newsObject.link = link;
	//alert("in to search news nameTitle"+nameTitle);
	$.ajax({
		data : newsObject,
		url : "emp/newsService/searchNews",
		success : function(data) {
			if (data.Msg = "success") {
				showNewsList(data);
			}
		}
	});
}
function showNewsList(data){
	var html = '<div class="row"><div class="col-md-12"><table class="table table-bordered">';
	$.each(
			data.NewsDetails,
			function(key, val) {
				
					html = html
					     + '<tr>'
						     + '<td class="e_mn">'+data.NewsDetails[key].newsTitle+'</td>'
						     +  '<td class="e_mn_1">'+data.NewsDetails[key].date+'</td>'
							 +  '<td class="e_mn_2">'+data.NewsDetails[key].paper+'</td>'
							 +  '<td class="e_mn_3">'+data.NewsDetails[key].link+'</td>'
							 +  '<td class="e_mn_">'
							 	+ '<ul class="actions">'
							 		+ '<li>'
							 			+ '<a href="newsProfile.jsp"> '
							 				+ '<button id='+data.NewsDetails[key].newsId+' class="btn btn-success btn-sm" onclick="getNewsProfile(this.id)">'
							 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
							 				+ '</button>'
							 			+ '</a>'
							 		+ '</li>'
							 		<%if(bAdmin){ %>
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
							 		<%}%>
							 	+ ' </ul>'
							 +  '</td>'
					     + '</tr>';
			}
	)
	$(html).appendTo("#newsListData");
	$(html).appendTo("</table></div></div>");
}
function clearNewsSearch(){
	 $("#searchNameTitle").val("");
	 $("#searchPaper").val("");
	 $("#searchLink").val("");
	 searchNews();
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
							<div class="">
								<table class="table  table-bordered">
									<tr>
										<th>Name Title</th>
										<th>Date</th>
										<th>Paper</th>
										<th>Link/Url</th>
										<th style="width: 125px;"></th>
									</tr>
									<tr>
										<td><div class="row">
												<div class="col-md-10">
													<input type="text"  placeholder='Name Title' id="searchNameTitle" name="searchNameTitle"
														class="form-control " style="width: 200px;" onkeyup="searchNews();"/>
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
													<input type="text"  placeholder='Paper' id="searchPaper" name="searchPaper"
														class="form-control " style="width: 80px;" onkeyup="searchNews();"/>
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" class="form-control" style="" id="searchLink" name="searchLink"
														placeholder="Link/Url" cols="0" rows="1" onkeyup="searchNews();"/>
												</div>
											</div></td>
										<td><input type="button" value="CLEAR" onClick="clearNewsSearch();"/></td>
									</tr>
									
								</table>
								<div class="member_list">
									<div class="row">

										<div class="col-md-12">
											
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
	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	<jsp:include page="footer.jsp" />
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
