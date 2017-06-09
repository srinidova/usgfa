
<%
String sRole=(String)session.getAttribute("LOGINROLE"); 
%>
<div id="header">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="logo"><a href="/usgfa"><img src="images/logo.png" class="img-responsive" title="UNITED SHEEP & GOAT FARMERS ASSOCIATION"></a></div>
      </div>
      <div class="col-md-2 pull-right">
      <% if(sRole == null){ %>
        	<div class="login_button"> <a href="#" data-toggle="modal" data-target="#myModal" onclick="clearLogin();">Login</a> </div>
        <% } else{%>
        	<div class="login_button"> <a href="#" data-toggle="modal" onclick="logout();">Logout</a> </div>
         <% } %>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>

<script type="text/javascript">
function logout() {
	//alert("---------in to logout--------------"+location);
	var temp = location;
	var logoutObject = new Object();
	logoutObject.temp = ""+temp+"";
	$.ajax({
		data : logoutObject,
		url : "emp/LoginService/logout",
		success : function(data) {
			//alert("---------in to success--------------"+location);
			window.location.href = "/usgfa";
		}
	});
}
function clearLogin(){
	//alert("in to Test");
	$("#errLogin").text("");
	$("#loginMobile").val("");
	$("#loginPassword").val("");
	//alert("in to Test");
}
</script>