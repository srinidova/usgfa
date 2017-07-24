<!doctype html>
<%
boolean bAdmin = false;
String sRole=(String)session.getAttribute("LOGINROLE"); 
if(sRole != null && sRole.equals("Admin") || sRole != null && sRole.equals("Life")){
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
				}
					
	});
}

function deleteNews(newsId){

    var delConfirm = confirm("Are you sure to delete");
    if (delConfirm == false) {
    	return false;
    }else{
	    $("#newsRegFailMsg").text("");
		var newsObject = new Object();
		newsObject.newsId = newsId;
	    	$.ajax({
	    		data : newsObject,
	    		url : "emp/newsService/deleteNews",
	    		success : function(data) {
	    			if (data.Msg = "success") {
	    				$("#newsRegFailMsg").text("News Deleted Successfully");
	    			}
	    		}
	    	}); 
	}
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
	document.getElementById("newsListData").innerHTML = "";
	var nameTitle = $("#searchNameTitle").val();
	var paper = $("#searchPaper").val();
	var link = $("#searchLink").val();
	
	var newsObject = new Object();
	newsObject.nameTitle = nameTitle;
	newsObject.paper = paper;
	newsObject.link = link;
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
	var html = '';
	$.each(
			data.NewsDetails,
			function(key, val) {
				
					html = html
					     + '<tr>'
						     + '<td><div class="col-md-10">'+data.NewsDetails[key].newsTitle+'</div></td>'
						     +  '<td><div class="col-md-10">'+data.NewsDetails[key].date+'</div></td>'
							 +  '<td><div class="col-md-10">'+data.NewsDetails[key].paper+'</div></td>'
							 +  '<td><div class="col-md-10">'+data.NewsDetails[key].link+'</div></td>'
							 +  '<td style="width: 150px;">'
							 	+ '<ul class="actions">'
							 		+ '<li>'
							 			+ '<a href="newsProfile.jsp"> '
							 				+ '<button id='+data.NewsDetails[key].newsId+' class="btn btn-success btn-sm" onclick="getNewsProfile(this.id)">'
							 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
							 				+ '</button>'
							 			+ '</a>'
							 		+ '</li>'
							 		<%if(bAdmin){ %>
							 		+ '<li style="margin:0 5px 0 5px;">'
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
	document.getElementById("newsListData").innerHTML = html;
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
			<div class="member_list" id="committeeListDiv">
				<div class="col-md-10">
					<table class="table  table-bordered">
						<tr>
							<th><div class="col-md-10">Name Title</div></th>
							<th><div class="col-md-10">Date</div></th>
							<th><div class="col-md-10">Paper</div></th>
							<th><div class="col-md-10">Link/Url</div></th>
							<th><div class="col-md-10"></div></th>
						</tr>
						<tr>
							<td>
								<div class="row">
									<div class="col-md-10">
										<input type="text" placeholder='Name Title'
											id="searchNameTitle" name="searchNameTitle"
											class="form-control " style="width: 200px;" maxlength = "30"
											onkeyup="searchNews();" />
									</div>
								</div>
							</td>
							<td><div class="row">
									<div class="col-md-12">
										<input type="text" name='name0' placeholder='Date'
											class="form-control " style="width: 80px;" disabled/>
									</div>
								</div>
							</td>
							<td>
								<div class="row">
									<div class="col-md-12">
										<input type="text" class="form-control" style=""
											id="searchLink" name="searchLink" placeholder="Link/Url"
											cols="0" rows="1" maxlength = "30" onkeyup="searchNews();" />
									</div>
								</div>
							</td>
							<td>
								<div class="row">
									<div class="col-md-12">
										<input type="text" class="form-control" style=""
											id="searchLink" name="searchLink" placeholder="Link/Url" maxlength = "30"
											cols="0" rows="1" onkeyup="searchNews();" />
									</div>
								</div>
							</td>
							<td align="center">
								<div style="width: 150px;">
									<input class="btn btn-success btn-sm" type="button" value="CLEAR" onClick="clearNewsSearch();" />
								</div>
							</td>
						</tr>
						<tbody id="newsListData">
						</tbody>
					</table>
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
