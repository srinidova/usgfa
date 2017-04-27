<!doctype html>
<html>
<body>
<!----------------------top_header start-------------------------------->
    <jsp:include page="includes.jsp"/> 
    <!----------------------top_header end----------------------------------> 
    <body>
        <!----------------------top_header start---------------------------->
        <jsp:include page="topheader.jsp"/> 
        <!----------------------top_header end------------------------------> 

        <!----------------------header  start------------------------------->
        <jsp:include page="header.jsp"/> 
        <!----------------------header end----------------------------------> 

        <!----------------------menus start--------------------------------->
        <jsp:include page="menu.jsp"/> 
        <!----------------------menus end-----------------------------------> 

        <!----------------------banner start-------------------------------->
        <%-- <jsp:include page="banner.jsp"/>  --%>
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
	//alert("ohcouhwdj..........");
	//getMemberDetails();
	getMemberDetails();
	//showNewsListData(JSON.parse(lstNews));
});
function getMemberDetails() {
	//alert("-------2-----");
	var html = '';
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
										     + '<td style="width: 100px;">'+data.MemberDetails[key].title+'</td>'
										     +  '<td style="width: 60px;">'+data.MemberDetails[key].firstName+'</td>'
										     +  '<td style="width: 60px;">'+data.MemberDetails[key].middleName+'</td>'
											 +  '<td style="width: 60px;">'+data.MemberDetails[key].mobile+'</td>'
											 +  '<td style="width: 60px;">'+data.MemberDetails[key].address+'</td>'
											 +  '<td>'+data.MemberDetails[key].email+'</td>'
											 +  '<td style ="width:50px;">'
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
										<!-- <tr>
											<td><img src="images/5326574-a-sheep-wallpapers.jpg" width="50px" height="50px"></td>
											<td>Abcdef</td>
											<td>1234567890</td>
											<td>Abcdef</td>
											<td>1</td>
											<td>H.No: 8-2-608/27, Mastan Mansion,<br> Gaffer
												Khan Colony, Road No. 10,<br> Banjarahills, Hyderabad,
												TS, India -500034
											</td>
											<td>1234</td>
											<td>10-02-2017</td>
											<td><ul class="actions">
													<li><a href="#">
															<button class="btn btn-success btn-sm">
																<i class="fa fa-eye" aria-hidden="true"></i>
															</button>
													</a></li>
													<li><a href="#">
															<button class="btn  btn-primary btn-sm">
																<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
															</button>
													</a></li>
													<li><a href="#">
															<button class="btn btn-danger btn-sm">
																<i class="fa fa-trash-o" aria-hidden="true"></i>
															</button>
													</a></li>
												</ul></td>
										</tr> -->
										<!-- <tr>
											<td><img src="images/5326574-a-sheep-wallpapers.jpg" width="50px" height="50px"></td>
											<td>Abcdef</td>
											<td>1234567890</td>
											<td>Abcdef</td>
											<td>1</td>
											<td>H.No: 8-2-608/27, Mastan Mansion,<br> Gaffer
												Khan Colony, Road No. 10,<br> Banjarahills, Hyderabad,
												TS, India -500034
											</td>
											<td>1234</td>
											<td>10-02-2017</td>
											<td><ul class="actions">
													<li><a href="#">
															<button class="btn btn-success btn-sm">
																<i class="fa fa-eye" aria-hidden="true"></i>
															</button>
													</a></li>
													<li><a href="#">
															<button class="btn  btn-primary btn-sm">
																<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
															</button>
													</a></li>
													<li><a href="#">
															<button class="btn btn-danger btn-sm">
																<i class="fa fa-trash-o" aria-hidden="true"></i>
															</button>
													</a></li>
												</ul></td>
										</tr> -->
									</tbody>
								</table>
							</div>
							<div class="member_list">
									<div class="row">

										<div class="col-md-10">
											<div class="table-responsive">
												<table class="table  table-bordered">
													<div id="memberListData"></div>
												</table>
											</div>
										</div>
									</div>
								</div>
							<!-- <div class="row">
								<div class="col-md-4 pull-right">
									<div class="page-nation ">
										<ul class="pagination pagination-large">
											<li class="disabled"><span>«</span></li>
											<li class="active"><span>1</span></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li class="disabled"><span>...</span></li>
											<li><a rel="next" href="#">Next</a></li>
										</ul>
									</div>
								</div>
							</div> -->
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	 <jsp:include page="footer.jsp"/>
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
