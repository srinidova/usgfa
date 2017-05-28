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
	<%-- <jsp:include page="banner.jsp"/>  --%>
	<!----------------------banner end---------------------------------->

	<style>
#memberListData {
	width: 100%;
	float: left;
	margin: auto;
	display: inline-table;
}

tr td img {
	width: 50px;
	height: 50px;
	float: left;
	border: 1px #ccc solid;
	padding: 3px;
	border-radius: 3px;
}

tr td.e_img {
	width: 50px;
}

tr td.e_mn {
	width: 125px;
}

tr td.e_mn_1 {
	width: 140px;
}

tr td.e_mn_2 {
	width: 130px;
}

tr td.e_mn_3 {
	width: 100px;
}

tr td.e_mn_4 {
	width: 190px;
}

tr td.e_mn_5 {
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
	//alert("ohcouhwdj..........");
	//getMemberDetails();
	getMemberDetails();
	//showNewsListData(JSON.parse(lstNews));
});
function getMemberDetails() {
	//alert("-------2-----");
	var html = '<div class="row"><div class="col-md-12"><table class="table table-bordered">';
	$.ajax({
				url : "emp/memberService/getMemberDetails",
				success : function(data) {
					$.each(
							data.MemberDetails,
							//data.FarmDetails,
							function(key, val) {
								//alert(data.MemberDetails[key].title);
								//alert(data.FarmDetails[key].farmName);
								//alert(data.MemberDetails[key].firstName)
									html = html
									     + '<tr>'
									     + '<td class="e_img"><img src="images/5326574-a-sheep-wallpapers.jpg"></td>'
										     + '<td class="e_mn">'+data.MemberDetails[key].title+'</td>'
										     +  '<td class="e_mn_1" >'+data.MemberDetails[key].firstName+'</td>'
										     +  '<td class="e_mn_2">'+data.MemberDetails[key].middleName+'</td>'
											 +  '<td class="e_mn_3">'+data.MemberDetails[key].mobile+'</td>'
											 +  '<td class="e_mn_4">'+data.MemberDetails[key].address+'</td>'
											 +  '<td class="e_mn_5">'+data.MemberDetails[key].address+'</td>'
											 +  '<td>'+data.MemberDetails[key].email+'</td>'
											 +  '<td class="e_mn">' 
											 	+ '<ul class="actions">'
											 		+ '<li>'
											 			+ '<a href="memberProfile.jsp"> '
											 				+ '<button id='+data.MemberDetails[key].memberId+' class="btn btn-success btn-sm" onclick="getMemberProfile(this.id)">'
											 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		+ '<li>'
											 			+ '<a href="memberEdit.jsp"> '
											 				+ '<button id='+data.MemberDetails[key].memberId+' class="btn btn-primary btn-sm" onclick="editMember(this.id)">'
											 					+ '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		+ '<li>'
											 			+ '<a href="memberList.jsp"> '
											 				+ '<button id='+data.MemberDetails[key].memberId+' class="btn btn-danger btn-sm" onclick="deleteMember(this.id)">'
											 					+ '<i class="fa fa-trash-o" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 	+ ' </ul>'
											 +  '</td>'
									     + '</tr>';
							}
					)
					$(html).appendTo("#memberListData");
					$(html).appendTo("</table></div></div>");
				}
					
	});
}
function getMemberProfile(memberId){
	//alert("getMemberProfile..........memberId=="+memberId);
	var memberObject = new Object();
	memberObject.memberId = memberId;
	$.ajax({
		data : memberObject,
		url : "emp/memberService/getMemberId",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
}
function editMember(memberId){
	//alert("editMember----------memberId=="+memberId);
	var memberObject = new Object();
	memberObject.memberId = memberId;
	$.ajax({
		data : memberObject,
		url : "emp/memberService/getMemberId",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
	
}
function deleteMember(memberId){
	//alert("memberId=="+memberId);
	var memberObject = new Object();
	memberObject.memberId = memberId;
	$.ajax({
		data : memberObject,
		url : "emp/memberService/deleteMember",
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
				<h2>Member List</h2>
				<div class="line3"></div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>

<div class="container">
	<div class="row">
		<div class="clearfix"></div>
		<div class="container" style="margin-top: 30px;">
			<div class="row">
				<div class="member_list">

					<div class="col-md-12">
						<div class="  table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th></th>
										<th class="text-nowrap">Member Name</th>
										<th>Mobile No</th>
										<th>FarmName</th>
										<th>Membership</th>
										<th>Address</th>
										<th>Event farm</th>
										<th>Reg Date</th>
										<th style="width: 125px;"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Image</td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Member Name'
														class="form-control " style="width: 120px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Mobile No'
														class="form-control" style="width: 115px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='FarmName'
														class="form-control" style="width: 120px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<select class="form-control" style="width: 80px;">
														<option selected="selected">--select--</option>
														<option>Ordinary</option>
														<option>Pernament</option>
														<option>3</option>
														<option>4</option>
													</select>
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Address'
														class="form-control" style="" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Event farm'
														class="form-control" style="width: 120px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Reg Date'
														class="form-control" style="width: 120px;" />
												</div>
											</div></td>
										<td></td>
									</tr>

								</tbody>
							</table>
						</div>
						<div class="member_list">
							<div class="row">

								<div class="col-md-12">

									<table class="table  table-bordered">
										<div id="memberListData"></div>
									</table>

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
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
