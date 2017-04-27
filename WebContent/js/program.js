function saveProgram(){
	alert(" in to js page----------------");
	var programName = $("#programName").val();
	var duration =$("#duration").val();
	var dateAndTimeFrom = $("#dateAndTimeFrom").val();
	var dateAndTimeTo = $("#dateAndTimeTo").val();
	var channel = $("#channel").val();
	var guest = $("#guest").val();
	var youtube = $("#youtube").val();
	var moreInfo = $("#moreInfo").val();
	alert("programName----------------"+programName);
	alert("programName----------------"+moreInfo);
	
	
	var programObject = new Object();
	programObject.programName = programName;
	programObject.duration = duration;
	programObject.dateAndTimeFrom = dateAndTimeFrom;
	programObject.dateAndtimeTo = dateAndtimeTo;
	programObject.channel = channel;
	programObject.guest = guest;
	programObject.youtube = youtube;
	programObject.moreInfo = moreInfo;
	
	$
	.ajax({
		data : programObject,
		url : "http://localhost:8080/USGFA/emp/programService/addProgram",
		success : function(data) {
			if (data.Msg = "success") {
				alert("b4...........");
				//window.location.href = "newsList.jsp";
				alert("a4...........");
			}
		}
	});
	
}