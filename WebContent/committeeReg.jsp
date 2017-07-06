<!doctype html>
<html>
<head>
<script type="text/javascript" src="js/news.js"></script>
<script type="text/javascript">
	function committeeSave() {
		var member = $("#member").val();
		var role = $("#role").val();
		var displayOrder = $("#displayOrder").val();
		var comments = $("#comments").val();
		var committeeObject = new Object();
		committeeObject.member = member;
		committeeObject.role = role;
		committeeObject.displayOrder = displayOrder;
		committeeObject.comments = comments;
		$.ajax({
			data : committeeObject,
			url : "emp/CommitteeService/addCommittee",
			success : function(data) {
				defaultData();
			}
		});

	}
</script>
</head>
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
	<%-- <jsp:include page="banner.jsp" /> --%>
	<!----------------------banner end---------------------------------->
<head>
<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
</style>

</head>
<!----------------------body_content start-------------------------->

<div class="clearfix"></div>
<div id="aboutus">
	<div class="container">
		<div class="row">
			<div class="aboutus">
				<h2>Committee</h2>
				<div class="line3"></div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<div class="container" style="margin-top: 30px;">
	<div class="row">
		<div class="col-md-12">
			<div class="from">
				<div class="form-group">
					<label for="event_name">
						<h4>* These fields are required</h4>
					</label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="title">Member *</label> <select class="form-control"
							id="member" name="member">
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="title">Role *</label> <select class="form-control"
							id="role" name="role">
							<option value="President">President</option>
							<option value="Seceretary">Seceretary</option>
							<option value="Treasurer">Treasurer</option>
							<option value="ExecuteMember">ExecuteMember</option>
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Display Order *</label> <input type="text"
							class="form-control" id="displayOrder" name="displayOrder"
							maxlength="30" tabindex="4"
							onkeyup="emptyCheckTwoFields('link', id,'Paper or Link/Url','errPaper');">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="more_info">Comments</label> <span class="errMsg"
							id="errMoreInfo"></span>
						<textarea class="form-control" rows="5" id="comments"
							name="comments" tabindex="5" maxlength="250"
							onkeyup="emptyCheck(id,'More Info','errMoreInfo');">
						</textarea>
					</div>
				</div>
				<div class="clearfix"></div>
				<!-------------------------submit button--------------------------------------->
				<div class="col-md-10">
					<div class="submit_button text-right">
						<button class="btn btn-success btn-sm text-right "
							onclick="committeeSave();">Submit</button>
					</div>
					<div class="message" id="newsfrm_message">
						<h3>
							<aside class="formFailMsg" id="newsRegFailMsg"></aside>
						</h3>
					</div>
				</div>
				<!-------------------------submit button end--------------------------------------->
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="member_list" id="committeeListDiv">
		<div class="col-md-10">
			<div class="member_registration">
				<h2>Committee List</h2>
			</div>
		</div>
		<div class="col-md-10">
			<table class="table  table-bordered">
				<tr>
					<th><div class="col-md-10">Member</div></th>
					<th><div class="col-md-10">Role</div></th>
					<th><div class="col-md-10">Since</div></th>
					<th><div class="col-md-10">Display Order</div></th>
					<th><div class="col-md-10"></div></th>
				</tr>
				<tbody id="committeeList">
				</tbody>
			</table>
		</div>
	</div>
</div>
<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
<script type="text/javascript">
	$(document).ready(function() {
		defaultData();
	});

	function defaultData() {
		getMembers();
		$.ajax({
					url : "emp/CommitteeService/getCommitteeList",
					success : function(data) {
						if (data.Msg == 'success') {
							if (data.COMMITTEEMEMBERLIST != null) {
								showCommitteeList(data);
							}
						} else {
							document.getElementById("committeeListDiv").style.display = 'none';
						}
					}
				});
	}

	function getMembers() {
		var memberObject = new Object();
		memberObject.memberShip = "Life";
		memberObject.firstName = "";
		memberObject.profession = "null";
		memberObject.place = "";
		memberObject.hadFarm = "null";

		$.ajax({
					data : memberObject,
					url : "emp/memberService/searchMember",
					success : function(data) {
						if (data.Msg = "success") {
							var html = "";

							$.each(
									data.MemberDetails,
									function(key, val) {
										var name = "";
										var fname = data.MemberDetails[key].firstName;
										if (fname.length > 0) {
											name = fname;
										}
										var mname = data.MemberDetails[key].middleName;
										if (mname.length > 0) {
											name = name + " " + mname;
										}

										var lname = data.MemberDetails[key].lastName;
										if (lname.length > 0) {
											name = name + " " + lname;
										}
										html = html

												+ '<option value="'+ data.MemberDetails[key].memberId + '">'
												+ name + '</option>';
									})
							$('#member').empty().append(html);
						}
					}
				});
	}

	function showCommitteeList(data) {
		var html = '';
		$.each(
				data.COMMITTEEMEMBERLIST,
				function(key, val) {
					html = html
							+ '<tr>'
							+ '<td><div class="col-md-10">'
							+ data.COMMITTEEMEMBERLIST[key].firstName
							+ '</div></td>'
							+ '<td><div class="col-md-10">'
							+ data.COMMITTEEMEMBERLIST[key].committeRole
							+ '</div></td>'
							+ '<td><div class="col-md-10">'
							+ data.COMMITTEEMEMBERLIST[key].updatedOn
							+ '</div></td>'
							+ '<td><div class="col-md-10">'
							+ data.COMMITTEEMEMBERLIST[key].committeDispayOder
							+ '</div></td>'
							+ '<td style="width: 150px;">'
							+ '<ul class="actions">'
							+ '<li>'
							+ '<a href="memberProfile.jsp"> '
							+ '<button id='
							+ data.COMMITTEEMEMBERLIST[key].memberId
							+ ' class="btn btn-success btn-sm" onclick="getMemberProfile(this.id)">'
							+ '<i class="fa fa-eye" aria-hidden="true"></i>'
							+ '</button>'
							+ '</a>'
							+ '</li>'
							+ '<li style="margin:0 5px 0 5px;">'
							+ '<a href="committeeEdit.jsp"> '
							+ '<button id='
							+ data.COMMITTEEMEMBERLIST[key].committeId
							+ ' class="btn btn-primary btn-sm" onclick="editCommittee(this.id)">'
							+ '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>'
							+ '</button>'
							+ '</a>'
							+ '</li>'
							+ '<li>'
							+ '<a href="#"> '
							+ '<button id='
							+ data.COMMITTEEMEMBERLIST[key].committeId
							+ ' class="btn btn-danger btn-sm" onclick="deleteCommittee(this.id)">'
							+ '<i class="fa fa-trash-o" aria-hidden="true"></i>'
							+ '</button>' + '</a>' + '</li>' + ' </ul>'
							+ '</td>' + '</tr>';
					document.getElementById("committeeList").innerHTML = html;
				});
	}

	function getMemberProfile(memberId) {
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
	function editCommittee(committeeId) {
		var committeeObject = new Object();
		committeeObject.committeeId = committeeId;
		$.ajax({
			data : committeeObject,
			url : "emp/CommitteeService/getCommitteeId",
			success : function(data) {
				if (data.Msg = "success") {
				}
			}
		});
	}
	function deleteCommittee(committeeId) {
		var committeeObject = new Object();
		committeeObject.committeeId = committeeId;
		$.ajax({
			data : committeeObject,
			url : "emp/CommitteeService/deleteCommittee",
			success : function(data) {
				defaultData();
			}
		});
	}
</script>

</body>
</html>
<jsp:include page="login.jsp" />
