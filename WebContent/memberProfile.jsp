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
	<%--  <jsp:include page="banner.jsp"/>  --%>
	<!----------------------banner end---------------------------------->
<head>

<script type="text/javascript">

	$(document).ready(
			function() {
				var html = ' ';
				var farmProfDis = true;
				
				$.ajax({
					url : "emp/memberService/getMemberProfile",
					success : function(data) {
						$.each(data.MemberProfile, function(key, val) {
							
							var addressFull = "";
							var address = data.MemberProfile[key].address;
							if (address.length > 0) {
								if (addressFull.length > 0) {
									addressFull =  addressFull + ", " + address;
								}else{
									addressFull =  addressFull + " " + address;
								}
							}
							var place = data.MemberProfile[key].place;
							if (place.length > 0) {
								if (addressFull.length > 0) {
									addressFull = addressFull + ", " + place;
								}else{
									addressFull = addressFull + " " + place;
								}
							}

							var mandal = data.MemberProfile[key].mandal;
							if (mandal.length > 0) {
								if (addressFull.length > 0) {
									addressFull = addressFull + ", " + mandal;
								}else{
									addressFull = addressFull + " " + mandal;
								}
							}
							var district = data.MemberProfile[key].district;
							if (district.length > 0) {
								if (addressFull.length > 0) {
									addressFull =  addressFull + ", " +district;
								}else{
									addressFull =  addressFull + " " +district;
								}
							}
							var state = data.MemberProfile[key].state;
							if (state.length > 0) {
								if (addressFull.length > 0) {
									addressFull = addressFull + ", " + state;
								}else{
									addressFull = addressFull + " " + state;
								}
							}

							var pincode = data.MemberProfile[key].pincode;
							if (pincode.length > 0) {
								if (addressFull.length > 0) {
									addressFull = addressFull + " - " + pincode;
								}else{
									addressFull = addressFull + " " + pincode;
								}
							}
							
							
							$('#memberProfTitle').text(
									data.MemberProfile[key].title);
							$('#memberProfName').text(
									data.MemberProfile[key].firstName);
							$('#memberProfMobile').text(
									data.MemberProfile[key].mobile);
							$('#memberProfEmail').text(
									data.MemberProfile[key].email);
							$('#memberProfAddress').text(
									addressFull);
							$('#memberProfProfession').text(
									data.MemberProfile[key].profession);
							$('#memberProfMemberId').val(
									data.MemberProfile[key].memberId);
							$('#memberProfMemberType').text(
									data.MemberProfile[key].memberType);
							$('#memberProfAmount').text(
									data.MemberProfile[key].amountPaid);

						})
						if(data.MEMBERFILES != null ){
						showMemberProfImages(data);
						}
						$.each(
								data.MemberFarmProfile, 
								function(key, val) {
							farmProfDis = false;
							var addressFull1 = "";
							var farmAddress = data.MemberFarmProfile[key].farmAddress;
							if (farmAddress.length > 0) {
								if (farmAddress.length > 0) {
									addressFull1 =  addressFull1 + " " + farmAddress;
								}else{
									addressFull1 =  addressFull1 + " " + farmAddress;
								}
							}
							var farmMandal = data.MemberFarmProfile[key].farmMandal;
							if (farmMandal.length > 0) {
								if (farmMandal.length > 0) {
									addressFull1 = addressFull1 + ", " + farmMandal;
								}else{
									addressFull1 = addressFull1 + " " + farmMandal;
								}
							}
							var farmDistrict = data.MemberFarmProfile[key].farmDistrict;
							if (farmDistrict.length > 0) {
								if (addressFull1.length > 0) {
									addressFull1 = addressFull1 + ", " + farmDistrict;
								}else{
									addressFull1 = addressFull1 + " " + farmDistrict;
								}
							}
							var farmState = data.MemberFarmProfile[key].farmState;
							if (farmState.length > 0) {
								if (addressFull1.length > 0) {
									addressFull1 = addressFull1 + ", " + farmState;
								}else{
									addressFull1 = addressFull1 + " " + farmState;
								}
							}
							var farmPincode = data.MemberFarmProfile[key].farmPincode;
							if (farmState.length > 0) {
								if (addressFull1.length > 0) {
									addressFull1 = addressFull1 + " - " + farmPincode;
								}else{
									addressFull1 = addressFull1 + " " + farmPincode;
								}
							}
							$('#memberFarmProfFarmName').text(
									data.MemberFarmProfile[key].farmName);
							$('#memberFarmProfFarmAddress').text(
									addressFull1);
							$('#memberFarmProfAboutFarm').text(
									data.MemberFarmProfile[key].aboutFarm);

						})
						showFarmProfImages(data);
						if(farmProfDis){
							document.getElementById("farmProf").style.display = 'none';
						}
					}
				});

			});
	function editProfMember() {
		var memberId = $("#memberProfMemberId").val();
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
	function showMemberProfImages(data) {
		var dispImages = '';
		var dispClas = '';
		var dispChkd = '';
		var memImgCont = '';

		$
				.each(
						data.MEMBERFILES,
						function(key, val) {

							memImgCont = memImgCont
									+ '<a class="g-image" href="#" data-image-id="" data-toggle="modal" data-title="" data-caption="" data-image="'+data.MEMBERFILES[key].filePath+'" data-target="#image-gallery">'
									+ '<img src="'+data.MEMBERFILES[key].filePath+'" class="img-responsive" alt="" height="100" width="100" align="middle">'
									+ '</a>';
						})
		document.getElementById("memberProfImages").innerHTML = memImgCont;
		$.getScript('http://dovasofttech.com/usgfa/js/popup.js');

	}
	function showFarmProfImages(data) {
		var dispImages = '';
		var dispClas = '';
		var dispChkd = '';
		var dispItem = '';
		var dispImgCtrls = true;
		if (data.FARMFILES != null) {
			$
					.each(

							data.FARMFILES,
							function(key, val) {
								dispImgCtrls = false;
								var filename = data.FARMFILES[key].filePath;
								var fExt = filename.split('.').pop();
								if(fExt != null && ((fExt == 'mp4') || (fExt == 'wmv') || (fExt == 'avi') || (fExt == 'flv') || (fExt == 'mov'))){
									dispItem = '<iframe src="'+data.FARMFILES[key].filePath+'" autoplay="false" autostart="false" style="text-align: center;width: 100%" type="audio/mp4" height="100" width="100" align="middle"></iframe>';
								}else{
									dispItem = '<img src="'+data.FARMFILES[key].filePath+'" class="img-responsive" alt="" height="100" width="100" align="middle">';
								}
								if (data.FARMFILES[key].showPublic == 1) {
									dispChkd = 'checked';
								} else {
									dispChkd = '';
								}
								if (key == 0) {
									dispClas = "item active";
								} else {
									dispClas = "item";
								}
								dispImages = dispImages
										+ '<div class="'+ dispClas +'">'
										+ '<ul class="thumbnails">'
										+ '<li class="col-md-12">'
										+ '<div class="fff">'
										+ '<div class="thumbnail">'
										+ '<a href="#">'
										+ dispItem
										+ '</a>' + '</div>' + '</div>'
										+ '</li>' + '</ul>' + '</div>'
							})
			document.getElementById("farmProfImages").innerHTML = dispImages;
			$.getScript('http://dovasofttech.com/usgfa/js/popup.js');
		}
		if (dispImgCtrls) {
			document.getElementById("farmProfImgCtrl").style.display = 'none';
		}
	}
</script>
</head>
<!----------------------body_content start-------------------------->

<div class="clearfix"></div>
<div id="aboutus">
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>Member Profile</h2>
				<div class="line3"></div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>

<div class="container" style="margin-top: 20px;">
	<div class="row">
		<div class=" col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">Member Registration Profile</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-10 col-lg-8 col-md-offset-2">
									<div class="member_registration">
										<h2>Personal Info</h2>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-10 col-lg-8 col-md-offset-2">
									<table
										class="table table-user-information  table-bordered table-responsive">
										<tbody>
											<tr>
												<td class="text-nowrap"><b>Title :</b></td>
												<td><div id="memberProfTitle"></div> <input
													type="hidden" class="form-control" id="memberProfMemberId"
													name="memberProfMemberId"></td>
											</tr>
											<tr>
												<td><b> Name :</b></td>
												<td><div id="memberProfName"></div></td>
											</tr>
											<tr>
												<td><b>Mobile/Contact No :</b></td>
												<td><div id="memberProfMobile"></div></td>
											</tr>
											<tr>
												<td><b> Email :</b></td>
												<td><div id="memberProfEmail"></div></td>
											</tr>
											<tr>
												<td><b>Address:</b></td>
												<td><div id="memberProfAddress"></div></td>
											</tr>
											<tr>
												<td><b> Profession :</b></td>
												<td><div id="memberProfProfession"></div></td>
											</tr>
											<tr>
												<td><b> Photo :</b></td>
												<td><div id="memberProfImages"></div></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-10 col-lg-8 col-md-offset-2">
									<div class="member_registration">
										<h2>Member Registration</h2>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-10 col-lg-8 col-md-offset-2">
									<table
										class="table table-user-information  table-bordered table-responsive">
										<tbody>
											<tr>
												<td class="text-nowrap"><b>Membership Type :</b></td>
												<td><div id="memberProfMemberType"></div></td>
											</tr>
											<tr>
												<td><b>Amount :</b></td>
												<td><div id="memberProfAmount"></div></td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="col-md-12" id="farmProf">
							<div class="row">
								<div class="col-md-10 col-lg-8 col-md-offset-2">
									<div class="member_registration">
										<h2>Farm Info</h2>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-10 col-lg-8 col-md-offset-2">
									<table
										class="table table-user-information  table-bordered table-responsive">
										<tbody>
											<tr>
												<td class="text-nowrap"><b>Farm Name :</b></td>
												<td><div id="memberFarmProfFarmName"></div></td>
											</tr>
											<tr>
												<td><b>Farm Address:</b></td>
												<td>
													<div id="memberFarmProfFarmAddress">
												</td>
											</tr>
											<tr>
												<td><b>About You/Farm :</b></td>
												<td>
													<div id="memberFarmProfAboutFarm"></div>
												</td>
											</tr>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
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
						<div class="row" id="farmProfImgCtrl">
							<div class="col-md-6" style="margin-left: 250px;">
								<div class="control-box pager ">
									<a class="left fa fa-angle-left btn btn-default button-arrow"
										href="#myCarousel" data-slide="prev"></a> <a
										class="right fa fa-angle-right btn btn-default button-arrow"
										href="#myCarousel" data-slide="next"></a>
								</div>

								<div class="carousel slide" id="myCarousel">
									<div class="carousel-inner" id="farmProfImages"></div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<%if(bAdmin){ %>
				<div class="panel-footer">
					<span> <a href="memberEdit.jsp" onClick="editProfMember()"
						data-original-title="Edit this user" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<%} else{%>
				<div class="panel-footer">
					<span> <a data-original-title="Edit this user"
						data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				<%}%>
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
