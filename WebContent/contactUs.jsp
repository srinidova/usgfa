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
              <div class="col-xs-7"> <p>One Gateway Center, Suite 25500+,<br>
                Newark 23, NJ 10235 </p></div>
            </div>
            <div class="row col1">
              <div class="col-xs-5"><h4> <i class="fa fa-phone" style="font-size:16px;"></i>   Phone </h4></div>
              <div class="col-xs-7"> <a href="#">+(91) 123 456 7890 </a></div>
            </div>
            
            <div class="row col1">
              <div class="col-xs-5"> <h4><i class="fa fa-envelope" style="font-size:16px;"></i>   Email </h4></div>
              <div class="col-xs-7"> <a href="#">info@yourdomain.com</a> <br>
                <a href="#">support@yourdomain.com</a> </div>
            </div>

          </div>
          </div>
          <div class="col-md-12">
            <form id="ajax-contact"  method="post" action="contact-form-mail.php" role="form">
              <div class="messages" id="form-messages"></div>
              <div class="controls">
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group">
                      <input id="form_name" type="text" name="name" class="form-control contact_page_form" placeholder="Name *" required data-error="">
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <input id="form_name" type="text" name="name" class="form-control contact_page_form" placeholder="Email *" required data-error="Firstname is required.">
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <input id="form_name" type="text" name="name" class="form-control contact_page_form" placeholder="Subject *" required data-error="Firstname is required.">
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                    
                      <textarea id="form_message" name="message" class="form-control contact_page_form" placeholder="Message for me *" rows="4" required data-error="Please,leave us a message."></textarea>
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                  <div class="col-md-12">
                    <input type="submit" class="btn btn-success pull-right" value="Send message">
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12"> <br>
                    <small class="text-muted " style="text-align:right; float:right;"><strong>*</strong> These fields are required.</small> </div>
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
