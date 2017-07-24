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
	<%-- <jsp:include page="banner.jsp"/>  --%>
	<!----------------------banner end---------------------------------->

	<style>
</style>
<head>

<script type="text/javascript">

$(document).ready(function() {
	getMemberDetails();
    $('#searchMemProfession').click(function(e) {
    	sortDropDownListByText("#searchMemProfession");
    });
    $('#searchMemMemberShip').click(function(e) {
    	sortDropDownListByText("#searchMemMemberShip");
    });
    $('#searchMemHadFarm').click(function(e) {
    	sortDropDownListByText("#searchMemHadFarm");
    });
});
function getMemberDetails() {
	$.ajax({
				url : "emp/memberService/getMemberDetails",
				success : function(data) {
					showMemberList(data);
				}
					
	});
}
function getMemberProfile(memberId){
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
	var delConfirm = confirm("Are you sure to delete");
	if(delConfirm == false){
		return false;
	}else{
		var memberObject = new Object();
		memberObject.memberId = memberId;
		$.ajax({
			data : memberObject,
			url : "emp/memberService/deleteMember",
			success : function(data) {
				if (data.Msg = "success") {
					window.location.href = "memberList.jsp";
				}
			}
		});
	}
	
}

function searchMember(){
	document.getElementById("memberListData").innerHTML = "";
	var firstName =$("#searchMemFirstName").val();
	var profession = $("#searchMemProfession").val();
	var memberShip = $("#searchMemMemberShip").val();
	var place = $("#searchMemPlace").val();
	var hadFarm = $("#searchMemHadFarm").val();
	var memberObject = new Object();
	memberObject.firstName = firstName;
	memberObject.profession = profession;
	memberObject.memberShip = memberShip;
	memberObject.place = place;
	memberObject.hadFarm = hadFarm;
	$.ajax({
		data : memberObject,
		url : "emp/memberService/searchMember",
		success : function(data) {
			if (data.Msg = "success") {
				showMemberList(data);
			}
		}
	});
}
function showMemberList(data){
	var html = '';
	$.each(
			data.MemberDetails,
			function(key, val) {
					html = html
					     + '<tr>'
					     + '<td>'
							 	+'<a class="g-image" href="#" data-image-id="" data-toggle="modal" data-title="" data-caption="" data-image="'+data.MemberDetails[key].filePath+'" data-target="#image-gallery">'
							 	  +'<img src="'+data.MemberDetails[key].filePath+'" class="img-responsive" alt="" align="middle">'
							 	+'</a>'
					     +'</td>'
						     + '<td>'+data.MemberDetails[key].firstName+' '+data.MemberDetails[key].middleName+'</td>'
						     +  '<td>'+data.MemberDetails[key].profession+'</td>'
						     +  '<td>'+data.MemberDetails[key].memberType+'</td>'
							 +  '<td>'+data.MemberDetails[key].amountPaid+'</td>'
							 +  '<td>'+data.MemberDetails[key].place+'</td>'
							 +  '<td>'+data.MemberDetails[key].updatedOn+'</td>'
							 +  '<td>'+data.MemberDetails[key].haveFarm+'</td>'
							 +  '<td style="width: 150px;">' 
							 	+ '<ul class="actions">'
							 		+ '<li>'
							 			+ '<a href="memberProfile.jsp"> '
							 				+ '<button id='+data.MemberDetails[key].memberId+' class="btn btn-success btn-sm" onclick="getMemberProfile(this.id)">'
							 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
							 				+ '</button>'
							 			+ '</a>'
							 		+ '</li>'
							 		<%if(bAdmin){ %>
							 		+ '<li style="margin:0 5px 0 5px;">'
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
							 		<%}%>
							 	+ ' </ul>'
							 +  '</td>'
					     + '</tr>';
			}
	)
	$(html).appendTo("#memberListData");
	$.getScript('http://dovasofttech.com/usgfa/js/popup.js');
}
function clearMemSearch(){
	$("#searchMemFirstName").val("");
	$("#searchMemProfession").val("null");
	$("#searchMemMemberShip").val("null");
	$("#searchMemPlace").val("");
	$("#searchMemHadFarm").val("null");
	searchMember();
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

<!-- <div class="container">
	<div class="row">
		<div class="clearfix"></div> -->
		<div class="container" style="margin-top: 30px;">
			<div class="row">
				<div class="member_list">
					<div class="col-md-11">
						<div class="  table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th></th>
										<th class="text-nowrap">Name</th>
										<th>Profession</th>
										<th>Membership</th>
										<th>Amount</th>
										<th>Place/City</th>
										<th>Reg Date</th>
										<th>Had Farm</th>
										<th style="width: 125px;">
										</th>
									</tr>
								</thead>
<!-- 								<tbody> -->
									<tr>
										<td>Image</td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name="searchMemFirstName" id="searchMemFirstName" placeholder='Member Name'
														class="form-control " style="width: 120px;" maxlength = "30" onkeyup="searchMember();"/>
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
												<select class="form-control" style="width: 80px;" name="searchMemProfession" id="searchMemProfession"  onChange="searchMember();">
														<option value="null">Select</option>
														<option value="Doctor">Doctor</option>
														<option value="Professor">Professor</option>
														<option value="Agriculture">Agriculture</option>
														<option value="Poultry">Poultry</option>
														<option value="Veterinary">Veterinary</option>
														<option value="Physician">Physician</option>
														<option value="Teacher">Teacher</option>
														<option value="Technician">Technician</option>
														<option value="Lawyer">Lawyer</option>
														<option value="Engineer">Engineer</option>
														<option value="Accountant">Accountant</option>
														<option value="Pharmacist">Pharmacist</option>
														<option value="Electrician">Electrician</option>
														<option value="Mechanic">Mechanic</option>
														<option value="Consultant">Consultant</option>
														<option value="Chef">Chef</option>
														<option value="Secretary">Secretary</option>
														<option value="Surveyor">Surveyor</option>
														<option value="Plumber">Plumber</option>
														<option value="Writer">Writer</option>
														<option value="Police">Police</option>
														<option value="Scientist">Scientist</option>
														<option value="Architect">Architect</option>
														<option value="Tailor">Tailor</option>
														<option value="Artist">Artist</option>
														<option value="Welder">Welder</option>
														<option value="Actor">Actor</option>
														<option value="Other">Other</option>
												</select>
													<!-- <input type="text" name="searchMemProfession" id="searchMemProfession" placeholder='Profession'
														class="form-control" style="width: 115px;" onkeyup="searchMember();"/> -->
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<select class="form-control" style="width: 80px;" name="searchMemMemberShip" id="searchMemMemberShip" onChange="searchMember();">
														<option value="null">Select</option>
														<option value="Ordinary">Ordinary</option>
														<option value="Life">Life</option>
													</select>
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Amount'
														class="form-control" style="width: 120px;" disabled />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name="searchMemPlace" id="searchMemPlace" placeholder='Place/City'
														class="form-control" style="" maxlength = "30" onkeyup="searchMember();"/>
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Reg Date'
														class="form-control" style="width: 120px;" disabled/>
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
												<select class="form-control" style="width: 80px;" name="searchMemHadFarm" id="searchMemHadFarm" onChange="searchMember();">
														<option value="null">Select</option>
														<option value="Yes">Yes</option>
														<option value="No">No</option>
													</select>
													<!-- <input type="text" name='name0' placeholder='Had Farm'
														class="form-control" style="width: 120px;" /> -->
												</div>
											</div></td>
										<td align="center"><input type="button" value="CLEAR" class="btn btn-success btn-sm" onClick="clearMemSearch();"/></td>
									</tr>
									<tbody id="memberListData">
									</tbody>
								<!-- </tbody> -->
							</table>
						</div>
						
						<div class="row">
							<div class="modal fade" id="image-gallery" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
								style="display: none;">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">×</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="image-gallery-title"></h4>
										</div>
										<div class="modal-body" id="modelBodyNewsProf">
										    <img id="image-gallery-image" align="middle" class="img-responsive" src="">
										</div>
										<div class="modal-footer">
											<div class="col-md-2">
												<button type="button" class="btn btn-primary"
													id="show-previous-image" style="display: none;">Previous</button>
											</div>
											<div class="col-md-8 text-justify" id="image-gallery-caption"></div>
											<div class="col-md-2">
												<button type="button" id="show-next-image"
													class="btn btn-primary">Next</button>
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
		<div class="clearfix"></div>
<!-- 	</div>
</div> -->

<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
<script> 
/* $(document).ready(function() {
    $('#searchMemProfession').click(function(e) {
    	sortDropDownListByText("#searchMemProfession");
    });
    $('#searchMemMemberShip').click(function(e) {
    	sortDropDownListByText("#searchMemMemberShip");
    });
    $('#searchMemHadFarm').click(function(e) {
    	sortDropDownListByText("#searchMemHadFarm");
    });
    
}); */

 function sortDropDownListByText(selItem) {
	$(selItem).each(function() {
		var selectedValue = $(this).val();
		$(this).html($("option", $(this)).sort(function(a, b) {
			return a.text.toUpperCase() == b.text.toUpperCase() ? 0 : a.text.toUpperCase() < b.text.toUpperCase() ? -1 : 1
		}));
		$(this).val(selectedValue);
	});
} 
 </script>
</body>
</html>
<jsp:include page="login.jsp" />
