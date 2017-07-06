<!doctype html>
<%
boolean bAdmin = false;
String sRole=(String)session.getAttribute("LOGINROLE"); 
if(sRole != null && sRole.equals("Admin")){
	 bAdmin = true;
} 
%>
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
	getStoriesDetails();
});

function getStoriesDetails() {
	var html = '<div class="row"><div class="col-md-12"><table class="table table-bordered">';
	$.ajax({
				url : "emp/storiesService/getStoriesDetails",
				success : function(data) {
					showStoriesList(data);
					<%-- $.each(
							data.StoriesDetails,
							function(key, val) {
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
											 		<%if(bAdmin){ %>
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
											 		<%}%>
											 	+ ' </ul>'
											 +  '</td>'
									     + '</tr>';
							}
					)
					$(html).appendTo("#storiesListData");
					$(html).appendTo("</table></div></div>"); --%>
				}
					
	});
}
function getStoriesProfile(storiesId){
	var storiesObject = new Object();
	storiesObject.storiesId = storiesId;
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
	var storiesObject = new Object();
	storiesObject.storiesId = storiesId;
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
	var storiesObject = new Object();
	storiesObject.storiesId = storiesId;
	$.ajax({
		data : storiesObject,
		url : "emp/storiesService/deleteStories",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
	
}
function searchStories(){
	
	//alert("in to search stories");
	document.getElementById("storiesListData").innerHTML = "";
	//var nameTitle = $("#searchNameTitle").val();
	var name= $("#searchName").val();
	var farmName = $("#searchFarmName").val();
	var place = $("#searchPlace").val();
	//alert("1.in to search stories");
	
	
	var storiesObject = new Object();
	storiesObject.name = name;
	storiesObject.farmName = farmName;
	storiesObject.place = place;
	//alert("2.in to search stories");
	$.ajax({
		data : storiesObject,
		url : "emp/storiesService/searchStories",
		success : function(data) {
			if (data.Msg = "success") {
				showStoriesList(data);
			}
		}
	});
	
}
function showStoriesList(data){
	
	//alert("in to show stories list"+data);
	var html = '<div class="row"><div class="col-md-12"><table class="table table-bordered">';
	$.each(
			data.StoriesDetails,
			function(key, val) {
				//alert("data.StoriesDetails======"+data.StoriesDetails);
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
							 		<%if(bAdmin){ %>
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
							 		<%}%>
							 	+ ' </ul>'
							 +  '</td>'
					     + '</tr>';
			}
	)
	$(html).appendTo("#storiesListData");
	$(html).appendTo("</table></div></div>");
}
function clearStoriesList(){
	$("#searchName").val("");
	$("#searchFarmName").val("");
	$("#searchPlace").val("");
	searchStories();
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
									<th style="width: 125px;"></th>
								</tr>
								<tr>
									<td><div class="row">
											<div class="col-md-10">
												<input type="text"  placeholder='Name' id="searchName" name="searchName"
													class="form-control " style="width: 200px;" onkeyup="searchStories();" />
											</div>
										</div></td>
									<td><div class="row">
											<div class="col-md-12">
												<input type="text"  placeholder='Farm Name' id="searchFarmName" name="searchFarmName"
													class="form-control " style="width: 50px;" onkeyup="searchStories();" />
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
												<input type="text" class="form-control" style="" id="searchPlace" name="searchPlace"
													placeholder="place" cols="0" rows="1" onkeyup="searchStories();">
											</div>
										</div></td>
									<td><input type="button" value="CLEAR" onClick="clearStoriesList();"/></td>
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
