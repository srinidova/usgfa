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
<%--  <jsp:include page="banner.jsp"/>  --%>
<!----------------------banner end---------------------------------->

<style>

</style>


<head>

<script type="text/javascript">
$(document).ready(function() {
	getProgramDetails();
});

function getProgramDetails() {
	var html = '<div class="row"><div class="col-md-12"><table class="table table-bordered">';
	$.ajax({
				url : "emp/programService/getProgramDetails",
				success : function(data) {
					showProgramList(data);
				}
					
	});
}

function getProgramProfile(programId){
	var programObject = new Object();
	programObject.programId = programId;
	$.ajax({
		data : programObject,
		url : "emp/programService/getProgramId",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
}
function editProgram(programId){
	var programObject = new Object();
	programObject.programId = programId;
	$.ajax({
		data : programObject,
		url : "emp/programService/getProgramId",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
	
}
function deleteProgram(programId){
	
	var delConfirm = confirm("Are you sure to delete");
	if(delConfirm == false){
		return false;
	}else{
		var programObject = new Object();
		programObject.programId = programId;
		$.ajax({
			data : programObject,
			url : "emp/programService/deleteProgram",
			success : function(data) {
				if (data.Msg = "success") {
				}
			}
		});
	}
	
	
}
function searchProgram(){
	document.getElementById("programListData").innerHTML = "";
	var programName = $("#searchProgramName").val();
	var channel = $("#searchChannel").val();
	var guest = $("#searchGuest").val();
	var programObject = new Object();
	programObject.programName = programName;
	programObject.channel = channel;
	programObject.guest = guest;
	$.ajax({
		data : programObject,
		url : "emp/programService/searchProgram",
		success : function(data) {
			if (data.Msg = "success") {
				showProgramList(data);
			}
		}
	});
}
function showProgramList(data){
	var html = '';
	$.each(
			data.ProgramDetails,
			function(key, val) {
					html = html
					     + '<tr>'
						     + '<td>'+data.ProgramDetails[key].programName+'</td>'
						     +  '<td>'+data.ProgramDetails[key].duration+'</td>'
							 +  '<td>'+data.ProgramDetails[key].dateAndTimeFrom+'</td>'
							 +  '<td>'+data.ProgramDetails[key].channel+'</td>'
							 +  '<td>'+data.ProgramDetails[key].guest+'</td>'
							 +  '<td style="width: 150px;">'
							 	+ '<ul class="actions">'
							 		+ '<li>'
							 			+ '<a href="programProfile.jsp"> '
							 				+ '<button id='+data.ProgramDetails[key].programId+' class="btn btn-success btn-sm" onclick="getProgramProfile(this.id)">'
							 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
							 				+ '</button>'
							 			+ '</a>'
							 		+ '</li>'
							 		<%if(bAdmin){ %>
							 		+ '<li style="margin:0 5px 0 5px;">'
							 			+ '<a href="programEdit.jsp"> '
							 				+ '<button id='+data.ProgramDetails[key].programId+' class="btn btn-primary btn-sm" onclick="editProgram(this.id)">'
							 					+ '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>' 
							 				+ '</button>'
							 			+ '</a>'
							 		+ '</li>'
							 		
							 		+ '<li>'
							 			+ '<a href="programList.jsp"> '
							 				+ '<button id='+data.ProgramDetails[key].programId+' class="btn btn-danger btn-sm" onclick="deleteProgram(this.id)">'
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
	document.getElementById("programListData").innerHTML = html;
}
function clearProgramSearch(){
	$("#searchProgramName").val("");
	$("#searchChannel").val("");
	$("#searchGuest").val("");
	searchProgram();
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
					<h2>Program List</h2>
					<div class="line3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>

	<div class="container" style="margin-top: 30px;">
		<div class="row">
				<div class="member_list">
					<!-- <div class="row"> -->
						<div class="col-md-10">
								<table class="table  table-bordered">
									<tr>
										<th>Program Name</th>
										<th>Duration</th>
										<th>Date & Time From</th>
										<th>Channel</th>
										<th>Guest</th>

										<th style="width: 125px;"></th>
									</tr>
									<tr>
										<td><div class="row">
												<div class="col-md-10">
													<input type="text" name='name0' placeholder='Program Name' id="searchProgramName" name="searchProgramName"
														class="form-control " style="width: 200px;" maxlength = "30" onkeyup="searchProgram();"/>
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Duration'
														class="form-control " style="width: 50px;" disabled/>
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text"
														placeholder='Date & Time From' class="form-control "
														style="width: 80px;" disabled/>
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text"  placeholder='Channel' id="searchChannel" name="searchChannel"
														class="form-control " style="width: 80px;" maxlength = "30" onkeyup="searchProgram();"/>
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text"  placeholder='Guest' id="searchGuest" name="searchGuest"
														class="form-control " style="width: 80px;" maxlength = "30" onkeyup="searchProgram();"/>
												</div>
											</div></td>

										<td align="center"><input type="button" value="CLEAR" class="btn btn-success btn-sm" onClick="clearProgramSearch();"/></td>
									</tr>
									<tbody id="programListData">
									</tbody>
								</table>
						</div>
				</div>

				<!------------------------------guests form--------------------------------------->


				<!------------------------------guests form end--------------------------------------->

				<div class="clearfix"></div>
		</div>

	</div>
	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	<jsp:include page="footer.jsp" />
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
