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
        $(document).ready(function(){
        	getEventDetails();
});

function getEventDetails() {
	var html = '<div class="row"><div class="col-md-12"><table class="table table-bordered">';
	$.ajax({
				url : "emp/eventService/getEventDetails",
				success : function(data) {
					//alert("in to event details");
					showEventList(data);
				}
					
	});
}
function getEventProfile(eventId){
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
	var delConfirm = confirm("Are you sure to delete");
	if(delConfirm == false){
		return false;
	}else{
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
	
}
function searchEvent(){
	document.getElementById("eventListData").innerHTML = "";
	var eventName =$("#searchEventName").val();
	var days = $("#searchEventDays").val();
	var date = $("#searchEventDate").val();
	var address = $("#searchEventAddress").val();
	var eventObject = new Object();
	eventObject.eventName = eventName;
	eventObject.days = days;
	eventObject.date = date;
	eventObject.address = address;
	$.ajax({
		data : eventObject,
		url : "emp/eventService/searchEvent",
		success : function(data) {
			if (data.Msg = "success") {
				showEventList(data);
			}
		}
	});
}
function showEventList(data){
	var html = '';
	$.each(
			data.EventDetails,
			function(key, val) {
					html = html
					     + '<tr>'
						     + '<td class="e_name">'+data.EventDetails[key].eventName+'</td>'
						     +  '<td class="e_days">'+data.EventDetails[key].noOfDays+'</td>'
							  +  '<td class="e_date">'+data.EventDetails[key].timeFrom+'</td>' 
							 +  '<td class="e_details">'+data.EventDetails[key].address+'</td>'
							 +  '<td style="width: 150px;">'
							 	+ '<ul class="actions">'
							 		+ '<li>'
							 			+ '<a href="eventProfile.jsp"> '
							 				+ '<button id='+data.EventDetails[key].eventId+' class="btn btn-success btn-sm" onclick="getEventProfile(this.id)">'
							 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
							 				+ '</button>'
							 			+ '</a>'
							 		+ '</li>'
							 		<%if(bAdmin){ %>
							 		+ '<li style="margin:0 5px 0 5px;">'
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
							 		<%}%>
							 	+ ' </ul>'
							 +  '</td>'
					     + '</tr>';
			}
	)
	document.getElementById("eventListData").innerHTML = html;
}
function clearEventSearch(){
	$("#searchEventName").val("");
	$("#searchEventAddress").val("");
	searchEvent();
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
			<div class="member_list" id="committeeListDiv">
				<div class="col-md-10">
					<table class="table  table-bordered">
						<tr>
							<th>Event Name</th>
							<th>Days</th>
							<th>Date</th>
							<th>Address</th>
							<th style="width: 150px;"></th>
						</tr>
						<tr>
							<td><div class="row">
									<div class="col-md-10">
										<input type="text"  placeholder='Event Name' name="searchEventName" 
										id="searchEventName" class="form-control " style="width: 200px;" maxlength = "30" onkeyup="searchEvent();" />
									</div>
								</div></td>
							<td><div class="row">
									<div class="col-md-12">
										<input type="text"  placeholder='Days' name="searchEventDays" id="searchEventDays"
											class="form-control " style="width: 50px;" disabled/>
									</div>
								</div></td>
							<td><div class="row">
									<div class="col-md-12">
										<input type="text"  placeholder='Date' name="searchEventDate" id="searchEventDate"
											class="form-control " style="width: 80px;" disabled/>
									</div>
								</div></td>
							<td><div class="row">
									<div class="col-md-12">
										<input type="text" class="form-control" style="" name="searchEventAddress" id="searchEventAddress"
											placeholder="Address" cols="0" rows="1" maxlength = "30" onkeyup="searchEvent();" />
									</div>
								</div></td>
							<td align="center" style="width: 150px;"><input class="btn btn-success btn-sm" type="button" value="CLEAR" onClick="clearEventSearch();"/></td>
						</tr>
						<tbody id="eventListData">
						</tbody>
					</table>
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
