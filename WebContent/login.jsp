<script type="text/javascript">
function login() {
	$("#errLogin").text("");
	var msg = "";
	var title = "";
	var loginMobile =  $("#loginMobile").val();
	//alert("loginMobile=="+loginMobile.length);
	var loginPassword =  $("#loginPassword").val();
	//alert("loginPassword=="+loginPassword.length);
	if (loginMobile.length == 0) {
		msg = "errLogin";
		title = "Mobile No";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		loginMobile.focus();
		return false;
	} else if (loginPassword.length == 0) {
		msg = "errLogin";
		title = "Password";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		loginPassword.focus();
		return false;
	}else{
		$("#errLogin").val("");
		var loginObject = new Object();
		loginObject.loginMobile = loginMobile;
		loginObject.loginPassword = loginPassword;
 		$.ajax({
			data : loginObject,
			url : "emp/loginService/getUser",
			success : function(data) {
				if (data.Msg == 'success') {
					//alert(".....success......");
					window.location.href = "memberList.jsp";
				}else{
					$("#errLogin").text(data.Msg);
				}  
				
			}
		}); 
	}
}
function resetPassword(){
	$("#errLogin").text("");
	var loginMobile = $("#loginMobile").val();
	//var loginPassword = $("#loginPassword").val();
	//alert("----------in to resetPassword--------------");
	if (loginMobile.length == 0) {
		msg = "errLogin";
		title = "Mobile No";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		loginMobile.focus();
		return false;
	}else{
		$("#errLogin").text("");
		var resetObject = new Object();
		resetObject.loginMobile = loginMobile;
		
		$.ajax({
			data : resetObject,
			url : "emp/loginService/resetPassword",
			success : function(data) {
				if (data.Msg == 'success') {
					$("#errLogin").text("OTP sent to your Mobile. Please Re Login.");
				}else{
					$("#errLogin").text(data.Msg);
				}  
				
			}
		});
	}
}
function forgotpassword(){
	$("#errLogin").text("");
	var loginMobile = $("#loginMobile").val();
	//var loginPassword = $("#loginPassword").val();
	//alert("----------in to forgotpassword--------------");
	if (loginMobile.length == 0) {
		msg = "errLogin";
		title = "Mobile No";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		loginMobile.focus();
		return false;
	}else{
		$("#errLogin").text("");
		var resetObject = new Object();
		resetObject.loginMobile = loginMobile;
		
		$.ajax({
			data : resetObject,
			url : "emp/loginService/forgotPassword",
			success : function(data) {
				if (data.Msg == 'success') {
					$("#errLogin").text("Password sent to your Mobile. Please Re Login.");
				}else{
					$("#errLogin").text(data.Msg);
				}  
				
			}
		});
	}
}

function mobileCheck(fName, title, msg) {
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
	}else if(fieldName.value.length != 10){
		$("#" + msg).text(title + " must have ten numbers");
		$("#" + msg).show();
		fieldName.focus();
		return false;
	} else {
		$("#" + msg).text("");
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

function loginClear(){
	//alert("in to clear");
	$("#errLogin").text("");
	$("#loginMobile").val("");
	$("#loginPassword").val("");
}
</script>

<div class="modal fade bd-example-modal-sm " id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm login_popup ">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Login</h4>
				<span class="errMsg" style="margin-left: 0px;" id="errLogin"></span>
			</div>
			<div class="col-md-12">
				<div class="modal-body ">
					<div class="main-login main-center">
						<form class="form-horizontal" method="post" action="#">
							<div class="form-group">
								<div class="cols-sm-10">
									<label for="">Mobile No</label>
									<div class="input-group">
										<input type="text" class="form-control" name="loginMobile"
											id="loginMobile" maxlength="30" placeholder="Mobile No"
											onkeyup="mobileCheck(id,'Mobile No','errLogin');" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="cols-sm-10">
									<label for="">Password</label>
									<div class="input-group">
										<input type="password" class="form-control"
											name="loginPassword" id="loginPassword"
											placeholder="Password"
											onkeyup="emptyCheck(id,'Password','errLogin');" />
									</div>
								</div>
							</div>
							<div class="row">
								<a href="#" class="pull-left need-help" id="resetPassword"
									onclick="resetPassword();">Reset password</a> <a href="#"
									class="pull-right need-help" style="color: #448D00;"
									onclick="forgotpassword();">forgot password</a> <span
									class="clearfix"></span>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="login();">Login</button>
				<button type="button" class="btn btn-primary" onclick="loginClear();">Clear</button>
			</div>
		</div>
	</div>
</div>