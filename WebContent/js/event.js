function saveEvent(){
	alert(" in to js page----------------");
	var eventName = $("#eventName").val();
	var noOfDays =$("#noOfDays").val();
	var timeFrom = $("#timeFrom").val();
	var timeEnd = $("#timeEnd").val();
	var address = $("#address").val();
	var Place = $("#Place").val();
	var mandal = $("#mandal").val();
	var moreInfo = $("#moreInfo").val();
	var district = $("#district").val();
	var state = $("#state").val();
	var landMark = $("#landMark").val();
	var pincode = $("#pincode").val();
	//alert("eventName----------------"+eventName);
	//alert("noOfDays----------------"+noOfDays);
	
	
	var eventObject = new eventObject()
	eventObject.eventName = eventName;
	eventObject.noOfDays = noOfDays;
	eventObject.timeFrom = timeFrom;
	eventObject.timeEnd = timeEnd;
	eventObject.address = address;
	eventObject.Place = Place;
	eventObject.mandal = mandal;
	eventObject.moreInfo = moreInfo;
	eventObject.district = district;
	eventObject.state = state;
	eventObject.landMark = landMark;
	eventObject.pincode = pincode;
	
	$
	.ajax({
		data : eventObject,
		url : "http://localhost:8080/USGFA/emp/eventService/addEvent",
		success : function(data) {
			if (data.Msg = "success") {
				alert("b4...........");
				//window.location.href = "newsList.jsp";
				alert("a4...........");
			}
		}
	});
	
}