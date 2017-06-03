<!doctype html>
<html>

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
#eventListData {
	width: 100%;
	float: left;
	margin: auto;
	display: inline-table;
}

tr td.e_name {
	width: 40%;
}

tr td.e_days {
	width: 12%;
}

tr td.e_date {
	width: 17%;
}

tr td.e_details {
	width: 40%;
}
</style>
<head>

<script type="text/javascript">
        $(document).ready(function(){
	//alert("-------1-----");
	getEventDetails();
});

function getEventDetails() {
	//alert("-------2-----");
	var html = '<div class="row"><div class="col-md-12"><table class="table table-bordered">';
	$.ajax({
				url : "emp/eventService/getEventDetails",
				success : function(data) {
					$.each(
							data.EventDetails,
							function(key, val) {
								//alert(data.EventDetails[key].eventName);
								//alert(data.EventDetails[key].noOfDays);
								//alert(data.EventDetails[key].timeFrom);
									html = html
									     + '<tr>'
										     + '<td class="e_name">'+data.EventDetails[key].eventName+'</td>'
										     +  '<td class="e_days">'+data.EventDetails[key].noOfDays+'</td>'
											  +  '<td class="e_date">'+data.EventDetails[key].timeFrom+'</td>' 
											 +  '<td class="e_details">'+data.EventDetails[key].address+'</td>'
											 +  '<td>'
											 	+ '<ul class="actions">'
											 		+ '<li>'
											 			+ '<a href="eventProfile.jsp"> '
											 				+ '<button id='+data.EventDetails[key].eventId+' class="btn btn-success btn-sm" onclick="getEventProfile(this.id)">'
											 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		+ '<li>'
											 			+ '<a href="eventEdit.jsp"> '
											 				+ '<button id='+data.EventDetails[key].eventId+' class="btn btn-primary btn-sm" onclick="editEvent(this.id)">'
											 					+ '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		+ '<li>'
											 			+ '<a href="eventList.jsp"> '
											 				+ '<button id='+data.EventDetails[key].eventId+' class="btn btn-danger btn-sm" onclick="deleteEvent(this.id)">'
											 					+ '<i class="fa fa-trash-o" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 	+ ' </ul>'
											 +  '</td>'
									     + '</tr>';
							}
					)
					$(html).appendTo("#eventListData");
					$(html).appendTo("</table></div></div>");
				}
					
	});
}
function getEventProfile(eventId){
	//alert("getEventProfile..........eventId=="+eventId);
	var eventObject = new Object();
	eventObject.eventId = eventId;
	$.ajax({
		data : eventObject,
		url : "emp/eventService/getEventId",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
}

function editEvent(eventId){
	//alert("editEvent----------eventId=="+eventId);
	var eventObject = new Object();
	eventObject.eventId = eventId;
	$.ajax({
		data : eventObject,
		url : "emp/eventService/getEventId",
		success : function(data) {
			if (data.Msg = "success") {
				//window.location.href = "storiesList.jsp";
			}
		}
	});
	
}
function deleteEvent(eventId){
	//alert("eventId=="+eventId);
	var eventObject = new Object();
	eventObject.eventId = eventId;
	$.ajax({
		data : eventObject,
		url : "emp/eventService/deleteEvent",
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
					<h2>Event List</h2>
					<div class="line3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>

	<div class="container" style="margin-top: 30px;">
		<div class="row">
			<div class="col-md-12">

				<div class="event_list">
					<div class="row">

						<div class="col-md-10">
							<div class="table-responsive">
								<table class="table  table-bordered">
									<tr>
										<th>Event Name11</th>
										<th>Days</th>
										<th>Date</th>
										<th>Address</th>
										<th></th>
									</tr>
									<tr>
										<td><div class="row">
												<div class="col-md-10">
													<input type="text" name='name0' placeholder='Event Name'
														class="form-control " style="width: 200px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Days'
														class="form-control " style="width: 50px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" name='name0' placeholder='Date'
														class="form-control " style="width: 80px;" />
												</div>
											</div></td>
										<td><div class="row">
												<div class="col-md-12">
													<input type="text" class="form-control" style=""
														placeholder="" cols="0" rows="1">
												</div>
											</div></td>
										<td></td>
									</tr>
								</table>
							</div>
						</div>
						<div class="col-md-10">
							<div id="eventListData"></div>
						</div>

					</div>
				</div>
				<div class="clearfix"></div>
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
