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
       <%--  <jsp:include page="banner.jsp"/>  --%>
        <!----------------------banner end----------------------------------> 
        <head>
<link rel="stylesheet" href="css/chosen.min.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/jquery-ui.min.css">
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<!-- <script  src="https://code.jquery.com/jquery-2.2.4.js"></script> -->
<script src="js/jquery-ui.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/chosen.jquery.js"></script>
<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="js/vendor-date.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var html =' ';
						//alert("-------in Member Profile--Jsp---");
						$
								.ajax({
									url : "emp/memberService/getMemberProfile",
									success : function(data) {
										$
												.each(
														data.MemberProfile,
														function(key, val) {
															//alert("getMemberProfile---*****123*****-------memberId=="+data.MemberProfile[key].memberId);
															$('#memberProfTitle')
																	.text(
																			data.MemberProfile[key].title);
															$('#memberProfName')
																	.text(
																			data.MemberProfile[key].firstName);
															$('#memberProfMobile')
																	.text(
																			data.MemberProfile[key].mobile);
															$('#memberProfEmail')
																	.text(
																			data.MemberProfile[key].email);
															$(
																	'#memberProfAddress')
																	.text(
																			data.MemberProfile[key].address);
															$(
															'#memberProfProfession')
															.text(
																	data.MemberProfile[key].profession);
															$('#memberProfMemberId')
																	.val(
																			data.MemberProfile[key].memberId);
														})
										$.each(
											data.MemberFarmProfile,
											function(key, val) {
												//alert("MemberFarmProfile --------- farmName=="+data.MemberFarmProfile[key].farmName);
												$('#memberFarmProfFarmName').text(data.MemberFarmProfile[key].farmName);
												$('#memberFarmProfFarmAddress').text(data.MemberFarmProfile[key].farmAddress);
												$('#memberFarmProfAboutFarm').text(data.MemberFarmProfile[key].aboutFarm);
												
										})
										$.each(
												data.MEMBERFILES,
												function(key, val) {
													alert("MEMBERFILES---*****99999999999*****-------filePath=="+data.MEMBERFILE[key].filePath);
													html = html
													+'<li>'
													+'<div class="fff">'
														+'<div class="photo">'
															+'<a class="g-image" href="#" data-image-id="" data-toggle="modal" data-title="" data-caption="" data-image="images/g1.jpeg" data-target="#image-gallery"> <img class="img-responsive" src="images/g1.jpeg" alt="Short alt text"> </a>'
														+'</div>'
														+'<div class="img_tiltle" style="margin-top: 7px;">'
															+'<h2>Image 1</h2>'
														+'</div>'
														+'<div class="caption" style="margin-top: 0px;">'
															+'<div class="checkbox"> <label> <input id="login-remember" type="checkbox" name="remember" value="1"> Show as Public </label>'
																+'<div class="suceee_msg">'
																	+'<h4>Updated successfully</h4>'
																+'</div>'
															+'</div>'
															+'<div class="delete_box"> <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>'
																+'<div class="suceee_msg">'
																	+'<h4>Delete Message</h4>'
																+'</div>'
															+'</div>'
														+'</div>'
													+'</div>'
													+'</li>'

												})
												$(html).appendTo("#eventImages");
									}
								});
					});
	function editProfMember() {
	    //alert("editProfMember---**********-------memberProfMemberId=="+ $("#memberProfMemberId").val());
		var memberId = $("#memberProfMemberId").val();
		//////alert("editProfNews---**********-------newsId=="+newsId);
		var memberObject = new Object();
		memberObject.memberId = memberId;
		$.ajax({
			data : memberObject,
			url : "emp/memberService/getMemberId",
			success : function(data) {
				if (data.Msg = "success") {
				}
			}
		});

	}
</script>
</head>
	<!----------------------body_content start-------------------------->
	
      <div class="clearfix"></div>
<div id="aboutus">
  <div class="container" >
    <div class="row">
      <div class="aboutus">
        <h2>Member Profile</h2>
        <div class="line3"></div>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>

<div class="container" style="margin-top: 20px;">
  <div class="row">
    <div class=" col-md-12" >
      <div class="panel panel-info">
        <div class="panel-heading">
          <h3 class="panel-title">Member Registration Profile</h3>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="col-md-12">
              <div class="row">
                <div class="col-md-10 col-lg-8 col-md-offset-2">
                  <div class="member_registration" >
                    <h2>Personal Info</h2>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-10 col-lg-8 col-md-offset-2">
                  <table class="table table-user-information  table-bordered table-responsive">
                    <tbody>
                      <tr>
                        <td class="text-nowrap"><b>Title :</b></td>
                        <td><div id = "memberProfTitle"></div>
                        <input type="hidden"
											class="form-control" id="memberProfMemberId"
											name="memberProfMemberId"></td>
                      </tr>
                      <tr>
                        <td><b> Name :</b></td>
                        <td><div id ="memberProfName"></div></td>
                      </tr>
                      <tr>
                        <td><b>Mobile/Contact No :</b></td>
                        <td><div id = "memberProfMobile"></div></td>
                      </tr>
                      <tr>
                        <td><b> Email :</b></td>
                        <td><div id = "memberProfEmail"></div></td>
                      </tr>
                      <tr>
                        <td><b>Address:</b></td>
                        <td><!-- H.No: 8-2-608/27, Mastan Mansion,</br>
                          Gaffer Khan Colony, 
                          Road No. 10, Banjarahills, 
                          Hyderabad, TS, India -500034 --><div id = "memberProfAddress"></div></td>
                      </tr>
                      <tr>
                        <td><b> Profession :</b></td>
                        <td><div id = "memberProfProfession"></div></td>
                      </tr>
                        </tr>
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12">
              <div class="row">
                <div class="col-md-10 col-lg-8 col-md-offset-2">
                  <div class="member_registration" >
                    <h2>Farm Info</h2>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-10 col-lg-8 col-md-offset-2">
                  <table class="table table-user-information  table-bordered table-responsive">
                    <tbody>
                      <tr>
                        <td class="text-nowrap"><b>Farm Name :</b></td>
                        <td><div id = "memberFarmProfFarmName"></div></td>
                      </tr>
                      <tr>
                        <td><b>Farm Address:</b></td>
                        <td><!-- H.No: 8-2-608/27, Mastan Mansion,</br>
                          Gaffer Khan Colony, 
                          Road No. 10, Banjarahills, 
                          Hyderabad, TS, India -500034 -->
                          <div id = "memberFarmProfFarmAddress"></td>
                      </tr>
                      <tr>
                        <td><b>About You/Farm :</b></td>
                        <td><!-- H.No: 8-2-608/27, Mastan Mansion,</br>
                          Gaffer Khan Colony, 
                          Road No. 10, Banjarahills, 
                          Hyderabad, TS, India -500034 -->
                          <div id = "memberFarmProfAboutFarm">
                          
                          </div></td>
                      </tr>
                        </tr>
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="modal fade" id="image-gallery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                      <h4 class="modal-title" id="image-gallery-title"></h4>
                    </div>
                    <div class="modal-body"> <img id="image-gallery-image" class="img-responsive" src=""> </div>
                    <div class="modal-footer">
                      <div class="col-md-2">
                        <button type="button" class="btn btn-primary" id="show-previous-image">Previous</button>
                      </div>
                      <div class="col-md-8 text-justify" id="image-gallery-caption"> This text will be overwritten by jQuery </div>
                      <div class="col-md-2">
                        <button type="button" id="show-next-image" class="btn btn-default">Next</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="">
              <div class="col-md-6">
                <div class="control-box pager "> <a class="left fa fa-angle-left btn btn-default button-arrow" href="#myCarousel" data-slide="prev"></a> <a class="right fa fa-angle-right btn btn-default button-arrow" href="#myCarousel" data-slide="next"></a> </div>
                <div class="carousel slide" id="myCarousel">
                  <div class="carousel-inner">
                    <div class="item active">
                      <ul style="padding-left:0px;">
                       <!--  <li>
                          <div class="fff">
                            <div class="photo"> <a class="g-image" href="#" data-image-id="1" data-toggle="modal" data-title="" data-caption="" data-image="images/g1.jpeg" data-target="#image-gallery"> <img class="img-responsive" src="images/g1.jpeg" alt="Short alt text"> </a> </div>
                            <div class="img_tiltle" style="margin-top: 7px;">
                              <h2>Image 1</h2>
                            </div>
                            <div class="caption" style="margin-top: 0px;">
                              <div class="checkbox">
                                <label>
                                  <input id="login-remember" type="checkbox" name="remember" value="1">
                                  Show as Public </label>
                                <div class="suceee_msg">
                                  <h4>Updated successfully</h4>
                                </div>
                              </div>
                              <div class="delete_box"><a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>
                                <div class="suceee_msg">
                                  <h4>Delete Message</h4>
                                </div>
                              </div>
                            </div>
                          </div>
                        </li> -->
                      </ul>
                    </div>
                    <div class="item ">
                      <ul style="padding-left:0px;">
                        <li>
                          <div class="fff">
                            <div class="photo"> <a class="g-image" href="#" data-image-id="2" data-toggle="modal" data-title="" data-caption="" data-image="images/g2.jpg" data-target="#image-gallery"> <img class="img-responsive" src="images/g2.jpg" alt="Short alt text"> </a> </div>
                            <div class="img_tiltle" style="margin-top: 7px;">
                              <h2>Image 2</h2>
                            </div>
                            <div class="caption" style="margin-top: 0px;">
                              <div class="checkbox">
                                <label>
                                  <input id="login-remember" type="checkbox" name="remember" value="1">
                                  Show as Public </label>
                                <div class="suceee_msg">
                                  <h4>Updated successfully</h4>
                                </div>
                              </div>
                              <div class="delete_box"><a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>
                                <div class="suceee_msg">
                                  <h4>Delete Message</h4>
                                </div>
                              </div>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                    <!-- /Slide3 --> 
                  </div>
                  
                  <!-- /.control-box --> 
                  
                </div>
                <!-- /#myCarousel --> 
                
              </div>
              <div class="col-md-6 col-lg-6 ">
                <div class="control-box pager "> <a class="left fa fa-angle-left btn btn-default button-arrow" href="#myCarousel1" data-slide="prev"></a> <a class="right fa fa-angle-right btn btn-default button-arrow" href="#myCarousel1" data-slide="next"></a> </div>
                <div class="carousel slide" id="myCarousel1">
                  <div class="carousel-inner">
                    <div class="item active">
                      <ul style="padding-left:0px;">
                        <li>
                          <div class="fff">
                            <div class="">
                              <iframe src="https://player.vimeo.com/video/152115588" width="100%" height="339" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>
                            </div>
                            <div class="img_tiltle">
                              <h2>video 1</h2>
                            </div>
                            <div class="caption">
                              <div class="checkbox">
                                <label>
                                  <input id="login-remember" type="checkbox" name="remember" value="1">
                                  Show as Public </label>
                                <div class="suceee_msg">
                                  <h4>Updated successfully</h4>
                                </div>
                              </div>
                              <div class="delete_box"><a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>
                                <div class="suceee_msg">
                                  <h4>Delete Message</h4>
                                </div>
                              </div>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                    <!-- /Slide1 --> 
                    <!-- /Slide2 -->
                    
                    <div class="item ">
                      <ul style="padding-left:0px;">
                        <li>
                          <div class="fff">
                            <div class="">
                              <iframe src="https://player.vimeo.com/video/152115588" width="100%" height="339" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>
                            </div>
                            <div class="img_tiltle">
                              <h2>video 2</h2>
                            </div>
                            <div class="caption">
                              <div class="checkbox">
                                <label>
                                  <input id="login-remember" type="checkbox" name="remember" value="1">
                                  Show as Public </label>
                                <div class="suceee_msg">
                                  <h4>Updated successfully</h4>
                                </div>
                              </div>
                              <div class="delete_box"><a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>
                                <div class="suceee_msg">
                                  <h4>Delete Message</h4>
                                </div>
                              </div>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                    <!-- /Slide3 --> 
                  </div>
                  
                  <!-- /.control-box --> 
                  
                </div>
                <!-- /#myCarousel --> 
                
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12">
              <div class="row">
                <div class="col-md-10 col-lg-8 col-md-offset-2">
                  <div class="member_registration" >
                    <h2>Member Registration</h2>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-10 col-lg-8 col-md-offset-2">
                  <table class="table table-user-information  table-bordered table-responsive">
                    <tbody>
                      <tr>
                        <td class="text-nowrap"><b>Membership Type :</b></td>
                        <td>Ordinary</td>
                      </tr>
                      <tr>
                        <td><b>Amount :</b></td>
                        <td>50000/-</td>
                      </tr>
                        </tr>
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="panel-footer"> <span > <a href="memberEdit.jsp" onClick = "editProfMember()" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a> </span> </div>
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
