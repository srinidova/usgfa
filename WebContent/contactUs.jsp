<!doctype html>
<html>
<body>
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
        <jsp:include page="banner.jsp"/> 
        <!----------------------banner end----------------------------------> 
 <head>
<script type="text/javascript">
function contactUsFarmValidation() {
	var name = document.getElementById("name");
	var email = document.getElementById("email");
	var subject = document.getElementById("subject");
	var message = document.getElementById("message");
	var msg = "";
	var title = "";
	$("#contactUsMessage").text("");
	if (name.value.length == 0) {
		msg = "errNameContact";
		title = "Name";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		name.focus();
		return false;
	}else if (email.value.length == 0) {
		msg = "errEmailContact";
		title = "Email";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		email.focus();
		return false;
	}else if (subject.value.length == 0) {
		msg = "errSubjectContact";
		title = "Subject";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		subject.focus();
		return false;
	}else if (message.value.length == 0) {
		msg = "errMessageContact";
		title = "Message";

		$("#" + msg).text(title + " should not be empty");
		$("#" + msg).show();
		message.focus();
		return false;
	}else{
		$("#errName").text("");
		$("#errEmail").text("");
		$("#errSubject").text("");
		$("#errMessage").text("");
		saveContact();
	}

}

function saveContact(){
	var name = $("#name").val();
	var email =$("#email").val();
	var subject = $("#subject").val();
	var message = $("#message").val();
	
	
	
	var contactObject = new Object();
	contactObject.name = name;
	contactObject.email = email;
	contactObject.subject = subject;
	contactObject.message = message;
	
	
	$
	.ajax({
		data : contactObject,
		url : "emp/contactService/addContact",
		success : function(data) {
			if (data.Msg == 'success')  {
				//window.location.href = "contactUs.jsp";
				$("#contactUsMessage").text("Message Sent SuccessFully");
			}else{
				$("#contactUsMessage").text("ContactUs Failed");
			}
		}
	});
	
}
</script>
</head>
	<!----------------------body_content start-------------------------->
	
      <div class="clearfix"></div>
<div id="aboutus">
  <div class="container">
    <div class="row">
      <div class="aboutus">
        <h2>Contact Us</h2>
        <div class="line3"></div>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>

<div class="contact-us">
    <div class="container">
      <div class="contact-form">
        <div class="row">
        <div class="col-md-7">
        
        <div class="map">
      	<iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.uk/maps?f=q&source=s_q&hl=en&geocode=&q=10+Rue+de+Rome&sll=48.874650,2.325336&ie=UTF8&hq=&hnear=10+RUE+DE+ROME,+75008,+FRANCE&t=m&z=17&ll=48.875350,2.325336&output=embed"></iframe>  
        
        </div>
        </div>
        <div class="address">
          <div class="col-md-5">
            <div class="row col1">
              <div class="col-xs-5"><h4> <i class="fa fa-map-marker" style="font-size:16px;"></i>   Address </h4></div>
              <div class="col-xs-7"> 
              <p>Plot No: 78, Road No: 71,<br>
                Navanirman Nagar Colony,<br>
                Besides Jublee Hills Public School,<br>
                HYDERABAD -  500033,<br>
                Telangana,India.
                 </p></div>
            </div>
            <div class="row col1">
              <div class="col-xs-5"><h4> <i class="fa fa-phone" style="font-size:16px;"></i>   Phone </h4></div>
              <div class="col-xs-7"> <a href="#">+(91) 123 456 7890 </a></div>
            </div>
            
            <div class="row col1">
              <div class="col-xs-5"> <h4><i class="fa fa-envelope" style="font-size:16px;"></i>   Email </h4></div>
              <div class="col-xs-7"> <a href="#">info@usgfa.com</a> <br>ss
                <a href="#">support@usgfa.com</a> </div>
            </div>

          </div>
          </div>
          <div class="col-md-12">
            <form id="ajax-contact"  method="post" action="#" role="form"> 
              <div class="messages" id="form-messages"></div>
              <div class="controls">
              				<div class="form-group">
					<label for="event_name"><h4>* These fields are required</h4></label>
				</div>
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group"><span class="errMsg" id="errNameContact"></span>
                      <input id="name" type="text" name="name" class="form-control contact_page_form" placeholder="Name *" required data-error=""
                   maxlength="30"   onkeyup="validateTitle(id,'Name','errNameContact',3,30);">
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group"><span class="errMsg" id="errEmailContact"></span>
                      <input id="email" type="text" name="email" class="form-control contact_page_form" placeholder="Email *" required data-error="Firstname is required."
                       onkeyup="eMail(id,'Email','errEmailContact');">
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group"><span class="errMsg" id="errSubjectContact"></span>
                      <input id="subject" type="text" name="name" class="form-control contact_page_form" placeholder="Subject *" required data-error="Firstname is required."
                     maxlength="30" onkeyup="validateTitle(id,'Subject','errSubjectContact',3,30);">
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group"><span class="errMsg" id="errMessageContact"></span>
                    
                      <textarea id="message" name="message" class="form-control contact_page_form" placeholder="Message for me *" rows="4" required data-error="Please,leave us a message."
                  maxlength="250"    onkeyup="validateTitle(id,'Message','errMessageContact',3,250);" ></textarea>
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                  <div class="col-md-12">
                  <div class="message" id="contactfrm_message">
			         <h3>
				         <aside class="formFailMsg" id="contactUsMessage"></aside>
			         </h3>
		        </div>
                    <!-- <a href='#'> -->
                    <input type="submit" class="btn btn-success pull-right"  onclick = "contactUsFarmValidation();" value="Send message">
                    <!-- <div class="message">
            <h3>
            <aside class=" " id="contactUsMessage" style="display: none">Save Sucessfully</aside>
           <aside class="formFailMsg" id="contactUsMessage"></aside>
            </h3>
          </div> -->
          
                    <!-- </a> -->
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
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
