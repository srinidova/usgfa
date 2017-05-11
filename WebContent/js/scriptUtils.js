function emptyCheck(fieldName, title, msg) {
	//alert("== emptyCheck ==");
	//alert("fieldName=="+fieldName);
	var fieldName_len = fieldName.value.length;
	//alert("fieldName_len=="+fieldName_len);
	if (fieldName_len == 0) {
		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		fieldName.focus();
		return false;
	} else {
		return true;
	}
}

function minLenCheck(fieldName, mi, title, msg) {
	//alert("fieldName=="+fieldName);
	//alert("== minLenCheckk ==");
	var fieldName_len = fieldName.value.length;
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

function maxLenCheck(fieldName, mx, title, msg) {
	//alert("fieldName=="+fieldName);
	//alert("== maxLenCheck ==");
	var fieldName_len = fieldName.value.length;
	//alert("fieldName_len=="+fieldName_len+"-------mx=="+mx);
	if (fieldName_len > mx) {
		$("#" + msg).text(title + " maximum length should be " + mx);
		$("#" + msg).show();
		fieldName.focus();
		return false;
	} else {
		return true;
	}
}

function allLetter(fieldName, title, msg) {
	//alert("allLetter==fieldName=="+fieldName+"----title=="+title+"----msg=="+msg);
	var letters = /^[A-Za-z]+$/;
	if (fieldName.value.match(letters)) {
		return true;
	} else {
		$("#" + msg).text(title + " must have alphabet characters only");
		$("#" + msg).show();
		fieldName.focus();
		return false;
	}
}

function allNumber(fieldName, title, msg) {
	//alert("allLetter==fieldName=="+fieldName+"----title=="+title+"----msg=="+msg);
	//alert("== allNumber ==");
	var number = /^[0-9]+$/;
	if (fieldName.value.match(number)) {
		return true;
	} else {
		$("#" + msg).text(title + " must have numbers only");
		$("#" + msg).show();
		fieldName.focus();
		return false;
	}
}

function twoFieldsCheck(fieldName1, fieldName2, dispMsg, msg) {
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
	//alert("allLetter==fieldName=="+fieldName+"----title=="+title+"----msg=="+msg);
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

function eMail(fieldName, title, msg) {
	//alert("allLetter==fieldName=="+fieldName+"----title=="+title+"----msg=="+msg);
	//alert("== allNumber ==");
	var email = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/;
	if (fieldName.value.match(email)) {
		return true;
	} else {
		$("#" + msg).text(title + " must have numbers only");
		$("#" + msg).show();
		fieldName.focus();
		return false;
	}
}