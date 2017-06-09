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
#programListData {
	width: 100%;
	float: left;
	margin: auto;
	display: inline-table;
}

tr td.e_mn {
	width: 320px;
}

tr td.e_mn_1 {
	width: 110px;
}

tr td.e_mn_2 {
	width: 200px;
}

tr td.e_mn_3 {
	width: 150px;
}

td ul.actions li {
	/* display: inline-block; */
	display: block;
}
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
					$.each(
							data.ProgramDetails,
							function(key, val) {
									html = html
									     + '<tr>'
										     + '<td class="e_mn">'+data.ProgramDetails[key].programName+'</td>'
										     +  '<td class="e_mn_1">'+data.ProgramDetails[key].duration+'</td>'
											 +  '<td class="e_mn_2">'+data.ProgramDetails[key].dateAndTimeFrom+'</td>'
											 +  '<td class="e_mn_3">'+data.ProgramDetails[key].channel+'</td>'
											 +  '<td class="e_mn_4">'+data.ProgramDetails[key].guest+'</td>'
											 +  '<td class="e_mn_5">'
											 	+ '<ul class="actions">'
											 		+ '<li>'
											 			+ '<a href="programProfile.jsp"> '
											 				+ '<button id='+data.ProgramDetails[key].programId+' class="btn btn-success btn-sm" onclick="getProgramProfile(this.id)">'
											 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		<%if(bAdmin){ %>
											 		+ '<li>'
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
					$(html).appendTo("#programListData");
					$(html).appendTo("</table></div></div>");
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

	<!-- <div class="container" style="margin-top: 30px;">
</div> -->
	<div class="container" style="margin-top: 30px;">
		<div class="row">
			<div class="col-md-12">



				<div class="program_list">
					<div class="row">

						<div class="col-md-10">
							<div class="">
								<table class="table  table-bordered">
									<tr>
										<th>Program Name</th>
										<th>Duration</th>
										<th>Date & Time From</th>
										<th>Channel</th>
										<th>Guest</th>

										<th></th>
									</tr>
									<tr>
										<td><div class="row">
												<div class="col-md-10">
													<input type="text" name='name0' placeholder='Program Name'
														class="form-control " style="width: 200px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Duration'
														class="form-control " style="width: 50px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0'
														placeholder='Date & Time From' class="form-control "
														style="width: 80px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Channel'
														class="form-control " style="width: 80px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Guest'
														class="form-control " style="width: 80px;" />
												</div>
											</div></td>

										<td></td>
									</tr>
								</table>
								<div class="row">
									<div class="col-md-12">

										<table class="table  table-bordered">
											<div id="programListData"></div>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>

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
