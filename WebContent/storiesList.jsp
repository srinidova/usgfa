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
	<%--   <jsp:include page="banner.jsp"/>  --%>
	<!----------------------banner end---------------------------------->

	<style>
#storiesListData {
	width: 100%;
	float: left;
	margin: auto;
	display: inline-table;
}

tr td.e_mn {
	width: 285px;
}

tr td.e_mn_1 {
	width: 120px;
}

tr td.e_mn_2 {
	width: 130px;
}

tr td.e_mn_3 {
	width: 120px;
}

tr td.e_mn_4 {
	width: 130px;
}

tr td.e_mn_5 {
	width: 215px;
}

td ul.actions li {
	/* display: inline-block; */
	display: block;
}
</style>
<head>
<script type="text/javascript">

$(document).ready(function(){
	//alert("-------1-----");
	getStoriesDetails();
});

function getStoriesDetails() {
	//alert("-------2-----");
	var html = '<div class="row"><div class="col-md-12"><table class="table table-bordered">';
	$.ajax({
				url : "emp/storiesService/getStoriesDetails",
				success : function(data) {
					$.each(
							data.StoriesDetails,
							function(key, val) {
								//alert(data.StoriesDetails[key].name);
								//alert(data.ProgramDetails[key].dateAndTimeFrom);
									html = html
									     + '<tr>'
										     + '<td class="e_mn">'+data.StoriesDetails[key].name+'</td>'
										     +  '<td class="e_mn_1">'+data.StoriesDetails[key].farmName+'</td>'
											 +  '<td class="e_mn_2">'+data.StoriesDetails[key].farmState+'</td>'
											 +  '<td class="e_mn_3">'+data.StoriesDetails[key].district+'</td>'
											 +  '<td class="e_mn_4">'+data.StoriesDetails[key].mandal+'</td>'
											 +  '<td class="e_mn_5">'+data.StoriesDetails[key].place+'</td>'
											 +  '<td class="e_mn_6">'
											 	+ '<ul class="actions">'
											 		+ '<li>'
											 			+ '<a href="storiesProfile.jsp"> '
											 				+ '<button id='+data.StoriesDetails[key].storiesId+' class="btn btn-success btn-sm" onclick="getStoriesProfile(this.id)">'
											 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		+ '<li>'
											 			+ '<a href="storiesEdit.jsp"> '
											 				+ '<button id='+data.StoriesDetails[key].storiesId+' class="btn btn-primary btn-sm" onclick="editStories(this.id)">'
											 					+ '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		+ '<li>'
											 			+ '<a href="storiesList.jsp"> '
											 				+ '<button id='+data.StoriesDetails[key].storiesId+' class="btn btn-danger btn-sm" onclick="deleteStories(this.id)">'
											 					+ '<i class="fa fa-trash-o" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 	+ ' </ul>'
											 +  '</td>'
									     + '</tr>';
							}
					)
					$(html).appendTo("#storiesListData");
					$(html).appendTo("</table></div></div>");
				}
					
	});
}
function getStoriesProfile(storiesId){
	//alert("getStoriesProfile..........storiesId=="+storiesId);
	var storiesObject = new Object();
	storiesObject.storiesId = storiesId;
	/* var newsObject = new Object();
	newsObject.newsId = newsId; */
	$.ajax({
		data : storiesObject,
		url : "emp/storiesService/getStoriesId",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
}
function editStories(storiesId){
	//alert("editStories----------storiesId=="+storiesId);
	var storiesObject = new Object();
	storiesObject.storiesId = storiesId;
	//newsObject.newsId = newsId;
	$.ajax({
		data : storiesObject,
		url : "emp/storiesService/getStoriesId",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
	
}
function deleteStories(storiesId){
	//alert("storiesId=="+storiesId);
	var storiesObject = new Object();
	storiesObject.storiesId = storiesId;
	/* var newsObject = new Object();
	newsObject.newsId = newsId; */
	$.ajax({
		data : storiesObject,
		url : "emp/storiesService/deleteStories",
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
				<h2>Stories List</h2>
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
									<th>Name</th>
									<th>Farm Name</th>
									<th>State</th>
									<th>District</th>
									<th>Mandal</th>
									<th>Place</th>
									<th></th>
								</tr>
								<tr>
									<td><div class="row">
											<div class="col-md-10">
												<input type="text" name='name0' placeholder='Name'
													class="form-control " style="width: 200px;" />
											</div>
										</div></td>
									<td><div class="row">
											<div class="col-md-12">
												<input type="text" name='name0' placeholder='Farm Name'
													class="form-control " style="width: 50px;" />
											</div>
										</div></td>
									<td><div class="row">
											<div class="col-md-12">
												<input type="text" name='name0' placeholder='State'
													class="form-control " style="width: 80px;" />
											</div>
										</div></td>
									<td><div class="row">
											<div class="col-md-12">
												<input type="text" name='name0' placeholder='district'
													class="form-control " style="width: 80px;" />
											</div>
										</div></td>
									<td><div class="row">
											<div class="col-md-12">
												<input type="text" name='name0' placeholder='mandal'
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
							</table>
							<div class="row">
								<div class="col-md-12">

									<table class="table  table-bordered">
										<div id="storiesListData"></div>
									</table>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>


			<!------------------------------guests form--------------------------------------->


			<!------------------------------guests form end--------------------------------------->




			<div class="clearfix"></div>
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
