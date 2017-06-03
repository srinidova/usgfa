function validateTitle(fName, title, msg, mi, mx) {

	//alert("-------in to validateTitle--------------------");
	var fieldName = document.getElementById(fName);

	var letters = /^[A-Za-z ]+$/;

	//alert("---1--"+fieldName.value.match(letters));
	if (fieldName.value.length == 0) {
		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		fieldName.focus();
		return false;
	} else if (!fieldName.value.match(letters)) {
		$("#" + msg).text(title + " must have alphabet characters only");
		$("#" + msg).show();
		fieldName.focus();
		return false;
	} else if (fieldName.value.length < mi) {
		$("#" + msg).text(title + " minumum length should be " + mi);
		$("#" + msg).show();
		fieldName.focus();
		return false;
	} else if (fieldName.value.length > mx) {
		$("#" + msg).text(title + " maximum length should be " + mx);
		$("#" + msg).show();
		fieldName.focus();
		return false;
	} else {
		$("#" + msg).text("");
		$("#errFirstName").text("");
		$("#errEditMemPlace").text("");
		$("#errEditProgramName").text("");
		$("#errNewsTitle").text("");
		$("#errDate").text("");
		$("#errPaper").text("");
		$("#errProgramName").text("");
		$("#errDateAndTimeFrom").text("");
		$("#errDateAndTimeTo").text("");
		$("#errMoreInfo").text("");
		$("#errName").text("");
		$("#errProfession").text("");
		$("#errFarmName").text("");
		$("#errEventName").text("");
		$("#errTimeFrom").text("");
		$("#errTimeEnd").text("");
		$("#errAddress").text("");
		$("#errPlace").text("");
		$("#errMandal").text("");
		$("#errDistrict").text("");
		$("#errPinCode").text("");
		$("#errLandMark").text("");
		$("#errNoofdays").text("");
		$("#errEditEventName").text("");
		$("#errStoDistrict").text("");
		$("#errStoFarmPlace").text("");
		$("#errStoMandal").text("");
		$("#errEditStoName").text("");
    	$("#errEditStoProfession").text("");
    	$("#errEditStoFarmName").text("");
    	$("#errEditStoFarmAddress").text("");
    	$("#errEditFarmPlace").text("");
    	$("#errEditStomandal").text("");
    	$("#errEditStoDistrict").text("");
    	$("#errEditStoAboutFarm").text("");
    	$("#errEventEditPlace").text("");
		$("#farmName").text("");
		$("#farmPlace").text("");
		$("#farmMandal").text("");
		$("#farmDistrict").text("");
		$("#farmPincode").text("");
		$("#memberFarmEditFarmName").text("");
		$("#memberFarmEditFarmPlace").text("");
		$("#memberFarmEditFarmMandal").text("");
		$("#memberFarmEditFarmDistrict").text("");
		$("#errMemberFarmEditFarmPincode").text("");
		$("#errDuration").text("");
		return true;
	}

}

function emptyCheck(fieldName, title, msg) {
	//alert("----fieldName----"+fieldName+"--------title----------"+title+"--------msg----------"+msg);
	
	var fieldName_len = document.getElementById(fieldName).value.length;
	//alert("----fieldName_len----"+fieldName_len);
	if (fieldName_len == 0) {
		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		fieldName.focus();
		return false;
	} else {
		$("#" + msg).text("");
		return true;
	}
}



function emptyCheckTwoFields(fieldName1, fieldName2, title, msg) {
	alert("----fieldName----");
	alert("----fieldName----"+fieldName1);
	var fieldName1_len = document.getElementById(fieldName1).value.length;

	var fieldName2_len = document.getElementById(fieldName2).value.length;

	if (fieldName1_len == 0 && fieldName2_len == 0) {
		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		//fieldName.focus();
		return false;
	} else {
		$("#" + msg).text("");
		return true;
	}
}


 function minLenCheck(fieldName, mi, title, msg) {
 //alert("fieldName=="+fieldName);
 //alert("== minLenCheckk ==");
 //var fieldName_len = fieldName.value.length;
 var fieldName_len = document.getElementById(fieldName).value.length;
 //alert("fieldName_len=="+fieldName_len);
 if (fieldName_len < mi) {
 $("#" + msg).text(title + " minumum length should be " + mi);
 $("#" + msg).show();
 fieldName.focus();
 return false;
 } else {
 return true;
 }

 }
 function allNumber(fName, title, msg) {
	// alert("allLetter==fName=="+fName+"----title=="+title+"----msg=="+msg);
	//alert("== allNumber ==");
	var fieldName = document.getElementById(fName);
	//alert("== fieldName =="+fieldName);
	var number = /^[0-9]+$/;
	if (fieldName.value.match(number)) {
		$("#" + msg).text("");
		return true;
	} else {
		$("#" + msg).text(title + " must have numbers only");
		$("#" + msg).show();
		fieldName.focus();
		return false;
		
		
	}
}
 
 function pincodeCheck(fName, title, msg) {
		//alert("allLetter==fName=="+fName+"----title=="+title+"----msg=="+msg);
		//alert("== allNumber ==");
		var fieldName = document.getElementById(fName);
		//alert("== fieldName =="+fieldName);
		var number = /^[0-9]+$/;
		if (!fieldName.value.match(number)) {			
			$("#" + msg).text(title + " must have numbers only");
			$("#" + msg).show();
			fieldName.focus();
			return false;
		}else if(fieldName.value.length != 6){
			$("#" + msg).text(title + " must have six numbers");
			$("#" + msg).show();
			fieldName.focus();
			return false;
		} else {
			$("#" + msg).text("");
			return true;
		}
	}
 
 /*
	 * function maxLenCheck(fieldName, mx, title, msg) {
	 * //alert("fieldName=="+fieldName); //alert("== maxLenCheck =="); var
	 * fieldName_len = fieldName.value.length;
	 * //alert("fieldName_len=="+fieldName_len+"-------mx=="+mx); if
	 * (fieldName_len > mx) { $("#" + msg).text(title + " maximum length should
	 * be " + mx); $("#" + msg).show(); fieldName.focus(); return false; } else {
	 * return true; } }
	 * 
	 * function allLetter(fieldName, title, msg) {
	 * //alert("allLetter==fieldName=="+fieldName+"----title=="+title+"----msg=="+msg);
	 * //var letters = /^[A-Za-z]+$/; //var letters = new RegExp("^[a-zA-Z
	 * ]+$"); var letters = ("^[a-zA-Z ]+$"); if
	 * (fieldName.value.match(letters)) { return true; } else { $("#" +
	 * msg).text(title + " must have alphabet characters only"); $("#" +
	 * msg).show(); fieldName.focus(); return false; } }
	 */


 /*function twoFieldsCheck(fieldName1, fieldName2, dispMsg, msg) {
 //alert("fieldName=="+fieldName);
 //alert("== twoFieldsCheck ==");
 var fieldName1_len = fieldName1.value.length;
 var fieldName2_len = fieldName2.value.length;
 //alert("fieldName_len=="+fieldName_len);
 if (fieldName1_len == 0 && fieldName2_len == 0) {
 $("#" + msg).text(dispMsg + " should not be empty");
 $("#" + msg).show();
 return false;
 } else {
 return true;
 }

 }
 function mobile(fieldName, title, msg) {
 //("allLetter==fieldName=="+fieldName+"----title=="+title+"----msg=="+msg);
 //alert("== mobile ==");
 var number = /^1?(\d{3})(\d{3})(\d{4})$/;
 if (fieldName.value.match(number)) {
 return true;
 } else {
 $("#" + msg).text(title + " must have numbers only");
 $("#" + msg).show();
 fieldName.focus();
 return false;
 }
 }
*/
 /*function eMail(fieldName, title, msg) {
 //alert("allLetter==fieldName=="+fieldName+"----title=="+title+"----msg=="+msg);
 alert("== allNumber ==");
 var email = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/;
 //var email =  /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	 var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
 if (fieldName.value.match(email)) {
 return true;
 } else {
 $("#" + msg).text(title + " please enter valid email");
 $("#" + msg).show();
 fieldName.focus();
 return false;
 }
 }*/
 
 function eMail(fName, title, msg) {
		//alert("allLetter==fieldName=="+fieldName+"----title=="+title+"----msg=="+msg);
		//alert("== allNumber ==");
	    var fieldName = document.getElementById(fName);
		var email = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/;
		//var email =  /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		if (!fieldName.value.match(email)) {
			$("#" + msg).text(title + " please enter valid email");
			$("#" + msg).show();
			fieldName.focus();
			return false;
		} else {
			$("#" + msg).text("");
			return true;
		}
 }
 
 /*function eMail(fName, title, msg) {
		//alert("allLetter==fieldName=="+fieldName+"----title=="+title+"----msg=="+msg);
		//alert("== allNumber ==");
	    var fieldName = document.getElementById(fName);
		//var emailVal = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/;
		var email =  /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		if (fieldName.value.match(email)) {
			$("#" + msg).text("");
			return true;
		} else {
			$("#" + msg).text("");
			$("#" + msg).text(title + " please enter valid email");
			$("#" + msg).show();
			fieldName.focus();
			return false;
		}
}*/
 function email(fName, title, msg) {
	     var fieldName = document.getElementById(fName);
	     var email = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	 
	     if (email.test(sEmail)) {
	 
	         return true;
	 
	     }else {
	 
	         return false;
 }
	     }


