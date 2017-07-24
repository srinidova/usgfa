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
	<jsp:include page="banner.jsp" />
	<!----------------------banner end---------------------------------->

	<!----------------------body_content start-------------------------->

	<div class="clearfix"></div>
	<div id="aboutus">
		<div class="container">
			<div class="row">
				<div class="aboutus">
					<h2>About Us</h2>
					<div class="line3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>

	<div class="about_team">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="about_pera">
						<p>Nunc ullamcorper sollicitudin arcu, ut fermentum magna
							ultricies quis. Proin aliquet, est ut pellentesque malesuada,
							purus enim egestas nisl, eget mollis justo lorem facilisis orci.
							Sed in tristique nulla.Nunc ullamcorper sollicitudin arcu, ut
							fermentum magna ultricies quis. Proin aliquet, est ut
							pellentesque malesuada, purus enim egestas nisl, eget mollis.
							justo lorem facilisis orci. Sed in tristique nulla.Nunc
							ullamcorper sollicitudin arcu,ut fermentum magna ultricies quis.
							Proin aliquet, est ut pellentesque malesuada, purus enim egestas
							nisl.</p>

						<p>Nunc ullamcorper sollicitudin arcu, ut fermentum magna
							ultricies quis. Proin aliquet, est ut pellentesque malesuada,
							purus enim egestas nisl, eget mollis justo lorem facilisis orci.
							Sed in tristique nulla.Nunc ullamcorper sollicitudin arcu, ut
							fermentum magna ultricies quis. Proin aliquet, est ut
							pellentesque malesuada, purus enim egestas nisl, eget mollis.
							justo lorem facilisis orci. Sed in tristique nulla.Nunc
							ullamcorper sollicitudin arcu,ut fermentum magna ultricies quis.
							Proin aliquet, est ut pellentesque malesuada, purus enim egestas
							nisl.</p>


						<p>Nunc ullamcorper sollicitudin arcu, ut fermentum magna
							ultricies quis. Proin aliquet, est ut pellentesque malesuada,
							purus enim egestas nisl, eget mollis justo lorem facilisis orci.
							Sed in tristique nulla.Nunc ullamcorper sollicitudin arcu, ut
							fermentum magna ultricies quis. Proin aliquet, est ut
							pellentesque malesuada, purus enim egestas nisl, eget mollis.
							justo lorem facilisis orci. Sed in tristique nulla.Nunc
							ullamcorper sollicitudin arcu,ut fermentum magna ultricies quis.
							Proin aliquet, est ut pellentesque malesuada, purus enim egestas
							nisl.</p>
					</div>
				</div>
			</div>
			<div id="aboutUsListDiv"></div>
		</div>
	</div>

	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	<jsp:include page="footer.jsp" />
	<!----------------------footer end --------------------------------->
	<script type="text/javascript">
		//alert(i+"---------------"+i % 2);
		$(document).ready(function() {
			$.ajax({
				url : "emp/CommitteeService/getCommitteeList",
				success : function(data) {
					if (data.Msg == 'success') {
						if (data.COMMITTEEMEMBERLIST != null) {
							showCommitteeList(data);
						}
					} else {
						//document.getElementById("committeeListDiv").style.display = 'none';
					}
				}
			});
		});

		function showCommitteeList(data) {
			var html = '';
			$
					.each(
							data.COMMITTEEMEMBERLIST,
							function(key, val) {
								var name = "";
								var fname = data.COMMITTEEMEMBERLIST[key].firstName;
								if (fname.length > 0) {
									name = fname;
								}
								var mname = data.COMMITTEEMEMBERLIST[key].middleName;
								if (mname.length > 0) {
									name = name + " " + mname;
								}

								var lname = data.COMMITTEEMEMBERLIST[key].lastName;
								if (lname.length > 0) {
									name = name + " " + lname;
								}
								var divCls1 = "team-1";
								var divCls2 = "col-md-2";
								var divCls3 = "col-md-10";
								var oddEvn = key % 2;

								if (oddEvn == 1) {
									divCls1 = "team-2 margintop-30";
									divCls2 = "col-md-2 col-sm-2 col-md-push-10";
									divCls3 = "col-md-10 col-sm-10 col-md-pull-2";
								}

								html = html
										+ '<div class="row">'
										+ '<div class="'+divCls1+'">'
										+ '<div class="'+divCls2+'">'
										+ '<div class="aboutus_img">'
										+ '<img src="'+data.COMMITTEEMEMBERLIST[key].filePath+'" class="img-responsive ">'
										+ '</div>'
										+ '</div>'
										+ '<div class="'+divCls3+'">'
										+ '<div class="about_team_detail">'
										+ '<h2>'
										+ name
										+ '</h2>'
										+ '<h4>'
										+ data.COMMITTEEMEMBERLIST[key].committeRole
										+ '</h4>'
										+ '<h2>'
										+ '<a href="#">'
										+ data.COMMITTEEMEMBERLIST[key].email
										+ '</a>'
										+ '</h2>'
										+ '<h4>'
										+ data.COMMITTEEMEMBERLIST[key].mobile
										+ '</h4>'
										+ '<p>'
										+ data.COMMITTEEMEMBERLIST[key].committeComments
										+ '</p>' + '</div>' + '</div>'
										+ '</div>' + '</div>'
								document.getElementById("aboutUsListDiv").innerHTML = html;
							});
		}
	</script>
</body>
</html>
<jsp:include page="login.jsp" />
