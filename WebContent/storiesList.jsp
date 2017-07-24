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
	
	var delConfirm = confirm("Are you sure to delete");
	if(delConfirm == false){
		return false;
	}else{
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
	
	
}
function searchStories(){
	
	document.getElementById("storiesListData").innerHTML = "";
	var name= $("#searchName").val();
	var farmName = $("#searchFarmName").val();
	var place = $("#searchPlace").val();
	
	
	var storiesObject = new Object();
	storiesObject.name = name;
	storiesObject.farmName = farmName;
	storiesObject.place = place;
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
	
	var html = '';
	$.each(
			data.StoriesDetails,
			function(key, val) {
					html = html
					     + '<tr>'
						     + '<td>'+data.StoriesDetails[key].name+'</td>'
						     +  '<td>'+data.StoriesDetails[key].farmName+'</td>'
							 +  '<td>'+data.StoriesDetails[key].farmState+'</td>'
							 +  '<td>'+data.StoriesDetails[key].district+'</td>'
							 +  '<td>'+data.StoriesDetails[key].mandal+'</td>'
							 +  '<td	>'+data.StoriesDetails[key].place+'</td>'
							 +  '<td style="width: 150px;">'
							 	+ '<ul class="actions">'
							 		+ '<li>'
							 			+ '<a href="storiesProfile.jsp"> '
							 				+ '<button id='+data.StoriesDetails[key].storiesId+' class="btn btn-success btn-sm" onclick="getStoriesProfile(this.id)">'
							 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
							 				+ '</button>'
							 			+ '</a>'
							 		+ '</li>'
							 		<%if(bAdmin){ %>
							 		+ '<li style="margin:0 5px 0 5px;">'
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
			<div class="member_list">
					<div class="col-md-10">
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
													class="form-control " style="width: 200px;" maxlength = "30" onkeyup="searchStories();" />
											</div>
										</div></td>
									<td><div class="row">
											<div class="col-md-12">
												<input type="text"  placeholder='Farm Name' id="searchFarmName" name="searchFarmName"
													class="form-control " style="width: 50px;" maxlength = "30" onkeyup="searchStories();" />
											</div>
										</div></td>
									<td><div class="row">
											<div class="col-md-12">
												<input type="text" name='name0' placeholder='State'
													class="form-control " style="width: 80px;" disabled/>
											</div>
										</div></td>
									<td><div class="row">
											<div class="col-md-12">
												<input type="text" name='name0' placeholder='district'
													class="form-control " style="width: 80px;" disabled/>
											</div>
										</div></td>
									<td><div class="row">
											<div class="col-md-12">
												<input type="text" name='name0' placeholder='mandal'
													class="form-control " style="width: 80px;" disabled/>
											</div>
										</div></td>
									<td><div class="row">
											<div class="col-md-12">
												<input type="text" class="form-control" style="" id="searchPlace" name="searchPlace"
													placeholder="place" cols="0" rows="1" maxlength = "30" onkeyup="searchStories();">
											</div>
										</div></td>
									<td align="center"><input type="button" value="CLEAR" class="btn btn-success btn-sm" onClick="clearStoriesList();"/></td>
								</tr>
								<tbody id="storiesListData">
								</tbody>
							</table>

					</div>
			</div>
			<div class="clearfix"></div>


			<!------------------------------guests form--------------------------------------->


			<!------------------------------guests form end--------------------------------------->

	</div>

</div>
<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
