<!doctype html>
<html>

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
        $(document).ready(function(){
	//alert("-------1-----");
	getEventDetails();
});

function getEventDetails() {
	//alert("-------2-----");
	var html = '';
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
										     + '<td>'+data.EventDetails[key].eventName+'</td>'
										     +  '<td>'+data.EventDetails[key].noOfDays+'</td>'
											  +  '<td>'+data.EventDetails[key].timeFrom+'</td>' 
											 +  '<td>'+data.EventDetails[key].address+'</td>'
											 +  '<td style ="width:50px;">'
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
								 <div class="col-md-10">
								<div class="table-responsive">
									<table class="table  table-bordered">
										<div id="eventListData"></div>
									</table>
								</div>
							</div>
								
							</div>
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
	 <jsp:include page="footer.jsp"/>
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />
