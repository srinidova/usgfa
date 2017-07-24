<!doctype html>
<html>
<head>
<script type="text/javascript" src="js/news.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				getMembers();
				$.ajax({
					url : "emp/CommitteeService/editCommittee",
					success : function(data) {
						if (data.EditCommittee != undefined) {
							$.each(data.EditCommittee, function(key, val) {
								$('#committeeId').val(
										data.EditCommittee[key].committeeId);
								$('#committeeEditMember').val(
										data.EditCommittee[key].memberId);
								$('#committeeEditRole').val(
										data.EditCommittee[key].role);
								$('#comitteeEditDisplayOrder').val(
										data.EditCommittee[key].displayOrder);
								$('#committeeEditComments').val(
										data.EditCommittee[key].comments);
							})
						}
					}
				});
			});
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
							$('#committeeEditMember').empty().append(html);
						}
					}
				});
	}
	function committeeUpdate() {
		var committeeId = $("#committeeId").val();
		var member = $("#committeeEditMember").val();
		var role = $("#committeeEditRole").val();
		var displayOrder = $("#comitteeEditDisplayOrder").val();
		var comments = $("#committeeEditComments").val();

		var committeeObject = new Object();
		committeeObject.committeeId = committeeId;
		committeeObject.member = member;
		committeeObject.role = role;
		committeeObject.displayOrder = displayOrder;
		committeeObject.comments = comments;
		$.ajax({
			data : committeeObject,
			url : "emp/CommitteeService/updateCommittee",
			success : function(data) {
				if (data.Msg == 'success') {
					window.location.href = "committeeReg.jsp";
				}
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
				<h2>Committee Edit</h2>
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
							id="committeeEditMember" name="committeeEditMember" disabled>
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="title">Role *</label> <select class="form-control"
							id="committeeEditRole" name="committeeEditRole">
							<option value="President">President</option>
							<option value="Seceretary">Seceretary</option>
							<option value="Treasurer">Treasurer</option>
							<option value="ExecuteMember">ExecuteMember</option>
						</select> <input type="hidden" class="form-control" id="committeeId"
							name="committeeId">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Display Order *</label> <input type="text"
							class="form-control" id="comitteeEditDisplayOrder"
							name="comitteeEditDisplayOrder" maxlength="5" tabindex="4"
							onkeyup="emptyCheckTwoFields('link', id,'Paper or Link/Url','errPaper');">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="more_info">Comments</label> <span class="errMsg"
							id="errMoreInfo"></span>
						<textarea class="form-control" rows="5" id="committeeEditComments"
							name="committeeEditComments" tabindex="5" maxlength="250"
							onkeyup="emptyCheck(id,'More Info','errMoreInfo');">
						</textarea>
					</div>
				</div>
				<div class="clearfix"></div>
				<!-------------------------submit button--------------------------------------->
				<div class="col-md-10">
					<div class="submit_button text-right">
						<button class="btn btn-success btn-sm text-right "
							onclick="committeeUpdate();">Submit</button>
					</div>
					<div class="message" id="committeefrm_message">
						<h3>
							<aside class="formFailMsg" id="commkitteeEditFailMsg"></aside>
						</h3>
					</div>
				</div>
				<!-------------------------submit button end--------------------------------------->
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
<script type="text/javascript">
	
</script>

</body>
</html>
<jsp:include page="login.jsp" />
