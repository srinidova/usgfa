

var serviceUnitArray ={};
var data = {};

function displayUserRow(catObj, dispType) {
	serviceUnitArray[catObj.regId] = catObj;
		 var tblRow ="<ul class=''>"
				 /* + "<li class='five-box'  title='"+catObj.mobileNo+"'>"
				+ catObj.mobileNo  */
				+ "<li class='nine-box'  title='"+catObj.regName+"' style='width:300%;'>"
				+ catObj.regName
				+ "</li>"
				+ "<li class='five-box'  title='"+catObj.mobileNo+"' style='width:140%;'>"
				+ catObj.mobileNo
				+ "</li>"
				+ "<li class='five-box'  title='"+catObj.email+"' style='width:221%;'>"
				+ catObj.email
				+ "</li>"
				+ "<li class='five-box'  title='"+catObj.regType+"' style='width:100%;'>"
				+ catObj.regType
				+ "</li>"
				
				+ "<li class='ten-box' style='width:100%;'>"
				+ "<a href='javascript:void(0)' id='"
				+ catObj.regId
				+ "' onclick='editRegisterData(this.id)' id='editId class='ico del' href='#'>Edit</a>"
				+ '</li>'
				
				+ "<li class='ten-box' style='width:100%;'>"
				+ "<a href='javascript:void(0)' id='"
				+ catObj.regId
				+ "' onclick='deleteRegisterData(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
				+ '</li>'
				+ "</li>"
				+"</ul>";
		 if (dispType == 'append') {
			 $(tblRow).appendTo("#userData");
		 } else {
			 $(tblRow).prependTo("#userData"); 
		 }
	
}

function showRegisterData(response){
	$("#userData ul li").remove();
	//resJSON = JSON.parse(response);
	if(response != undefined && response.length >0){
	$.each(response,function(i, catObj) {
		displayUserRow(catObj, "append");
	});
	//paginationTable(3);
	}
}


function dataClear(){
	
 $('#regName').val("");
 $('#mobileNo').val("");
 $('#regType').val("");
 $('#email').val("");
 $('#password').val("");
 $('#cPassword').val("");
 
}

function editRegisterData(id)
{		 		
	$('#regName').val( serviceUnitArray[id].regName);
	$('#mobileNo').val( serviceUnitArray[id].mobileNo);
	$('#email').val( serviceUnitArray[id].email);
	$('#regType').val( serviceUnitArray[id].regType);
	$('#regId').val( serviceUnitArray[id].regId);
	$('#password').val( serviceUnitArray[id].password);
	
}
function deleteRegisterData(id) {
	var count = 0;
		$.ajax({
					type : "POST",
					url : "deleteRegister.json",
					data : "id=" + id,
					success: function (response) {
	                      
						 if(response != null){
							 
	                    	  	showRegisterData(response);
							 //displayUserRow(JSON.parse(response));
		           				   $("#unc1").text("Delete Sucessfully");
			            		   $("#unc1").show();
			                       $("#unc1").fadeOut(5000);
			                       return false;
		                	}
		                 },
		             error: function (e) { 
							console.log(e);
		             }
				});
}

function userRegister() {
	 data = {};
	data["password"] = $("#password").val();
	data["mobileNo"] = $("#mobileNo").val();
	data["regName"] = $("#regName").val();
	data["regType"] = $("#regType").val();
	data["email"] = $("#email").val();
	data["regId"] = $("#regId").val();
	     if($('#regName').val().length == 0 ) {
		    $('#regName').css('color','red');
		    $("#regName").css("border-color","red");
		    $("#regName").attr("placeholder","Please enter Name");
		    $('#regName').addClass('your-class');
		    setTimeout(function(){$('#regName').focus();},0);
		    return false;
		 }else if(!$('#mobileNo').val().match(/^1?(\d{3})(\d{3})(\d{4})$/) ) {
		    $('#mobileNo').css('color','red');
		    $("#mobileNo").css("border-color","red");
		    $("#mobileNo").attr("placeholder","Please enter Mobile No");
		    $('#mobileNo').addClass('your-class');
		    $('#unc').text("Please enter valid Mobile Number.");
		     $('#unc').show();
		     $("#unc").fadeOut(10000);
		    setTimeout(function(){$('#mobileNo').focus();},0);
		    return false;
		 }
		 else if(!$('#email').val().match(/^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i) ) {
		    	
			    $('#email').css('color','red');
			    $("#email").css("border-color","red");
			    $("#email").attr("placeholder","Please enter email");
			    $('#email').addClass('your-class');
			    $('#unc').text("Please enter valid emailid.");
			     $('#unc').show();
			     $("#unc").fadeOut(10000);
			    setTimeout(function(){$('#email').focus();},0);
			    return false;
			    }
	  else if($("#regId").val() != ""){
			updateRegisterData();
		}else{
			saveRegisterData();
		}
}
function saveRegisterData(){
	$.ajax({
             type: "POST",
             url: "saveRegister.htm",
             data: data,
             success: function (response) {
            		 resJSON = JSON.parse(response);
            		 
                     if(resJSON != null ){
                    	 $("#userData ul li").remove();
                    	 for(i=0;i<resJSON.length;i++){
                    		 
                    		 displayUserRow(resJSON[i],'prepend');
                    	 }
                    	 
                    	  $("#unc").text('Registration done sucessfully.Please login with OTP and reset password.');
                    	  	$("#unc").show();
                    	  	$("#unc").fadeOut(20000);
      					 	$("#regName").val("");
      					 	$("#mobileNo").val("");
      					 	$("#regType").val("");
      					 	$("#email").val("");
      					 	$("#password").val("");
      					 	$("#cPassword").val("");
      					 	window.location.href = "resetPasswordHome";
      					return false;
                      }
            	  else {
            		 
            	 }
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
function updateRegisterData(){
	$.ajax({
             type: "POST",
             url: "updateRegister.htm",
             data: "jsondata= "+JSON.stringify(data),
             success: function (response) {
            	 $("#regId").val("");
            	 data = {};
            	 $("#userData ul li").remove();
            	 resJSON = JSON.parse(response);
            	 
            	 if(resJSON != 0){
            		 for(i=0;i<resJSON.length;i++){
                		 
                		 displayUserRow(resJSON[i],'prepend');
                		 
                	 }
                       
            		 	$("#unc").text("Update Sucessfully");
          		   		$("#unc").show();
          		   		$("#unc").fadeOut(5000); 
          		   		$("#mobileNo").val("");
          		   		$("#regName").val("");
          		   		$("#productType").val("");
          		   		$("#regType").val("");
          		   		$("#email").val("");
					 	$("#password").val("");
					 	$("#cPassword").val("");
					 	$("#cPassword").val("");
					 	return false;
                 }
                 
             },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
 

function removeError(ele){
	$("#"+ele).css('color', "#333333");
	$("#"+ele).css('border-color', "");
	$("#"+ele).removeClass('your-class');
}