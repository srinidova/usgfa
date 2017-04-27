<!doctype html>
<html>
<head>
 <script type="text/javascript" src="js/program.js"></script>
<!-- <script type="text/javascript">
	var programData = '${sessionScope.sessAllPrograms}';
	$(document).ready(function() {
		showProgramData(programData);
	});
</script> -->
</head>
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
        <%-- <jsp:include page="banner.jsp"/>  --%>
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
			//alert("-------in Program Profile--Jsp---");
			$
					.ajax({
						url : "emp/programService/getProgramProfile",
						success : function(data) {
							$
									.each(
											data.ProgramProfile,
											function(key, val) {
												//alert("getProgramProfile---*****123*****-------programId=="+data.ProgramProfile[key].programId);
												 $('#programProfName')
														.text(
																data.ProgramProfile[key].programName);
												  $('#programProfDuration')
														.text(
																data.ProgramProfile[key].duration); 
												  $('#programProfDate ')
														.text(
																data.ProgramProfile[key].dateAndTimeFrom);
												$('#programProfChannel')
														.text(
																data.ProgramProfile[key].channel);
												$(
														'#programProfGuest')
														.text(
																data.ProgramProfile[key].guest);
												$('#programProfProgramId')
														.val(
																data.ProgramProfile[key].programId); 
											})
						}
					});
		});
function editProfProgram() {
	////alert("editProfProgram---**********-------programProfNewsId=="+ $("#programProfNewsId").val());
	var programId = $("#programProfProgramId").val();
	//alert("editProfProgram---**********-------programId=="+programId);
	var progarmObject = new Object();
	programObject.programId = programId;
	$.ajax({
		data : programObject,
		url : "emp/progarmService/getProgramId",
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
		<div class="container">
			<div class="row">
				<div class="aboutus">
					<h2>Program Form Profile</h2>
					<div class="line3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>

	<div class="container" style="margin-top: 20px;">
  <div class="row">
    <div class="col-xs-12 col-sm-12 col-md-10 toppad" >
      <div class="panel panel-info">
        <div class="panel-heading">
          <h3 class="panel-title">Prorgam Form Profile</h3>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class=" col-md-10 col-lg-8 col-md-offset-2">
              <table class="table table-user-information  table-bordered table-responsive">
                <tbody>
                  <tr>
                    <td class="text-nowrap"><b>Program Name:</b></td>
                    <td><div id ="programProfName"><input type="hidden"
											class="form-control" id="programProfProgramId"
											name="programProfProgramId">
                    </div>
                    <!-- <input type="hidden"class="form-control" id="programProfProgramId" name="programProfProgramId"> -->
                    </td>
                  </tr>
                  <tr>
                    <td><b>Duration:</b></td>
                    <td><div id ="programProfDuration"></div></td>
                  </tr>
                  <tr>
                    <td><b>Date & TIme From:</b></td>
                    <td><div id ="programProfDate"></div></td>
                  </tr>
                  <tr>
                    <td><b>Channel:</b></td>
                    <td><div id ="programProfChannel"></td>
                  </tr>
                  <tr>
                    <td><b>Guest:</b></td>
                    <td><div id ="programProfGuest"></td>
                  </tr>
                  
                </tbody>
              </table>
            </div>
          </div>
                   <div class="row">
            <div class="col-md-6">
              <nav>
                <ul class="control-box pager text-left">
                  <li><a data-slide="prev" href="#myCarousel" class=""><i class="glyphicon glyphicon-chevron-left"></i></a></li>
                  <li><a data-slide="next" href="#myCarousel" class=""> <i class="glyphicon glyphicon-chevron-right"></i></a></li>
                </ul>
              </nav>
              <div class="carousel slide" id="myCarousel">
                <div class="carousel-inner">
                  <div class="item active">
                    <ul class="thumbnails">
                      <li class="col-md-12">
                        <div class="fff">
                          <div class="thumbnail"> <a href="#"> <img src="images/5326574-a-sheep-wallpapers.jpg" class="img-responsive" alt=""> </a> </div>
                          <div class="img_tiltle">
                            <h2>Image 1</h2>
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
                  <div class="item ">
                    <ul class="thumbnails">
                      <li class="col-md-12">
                        <div class="fff">
                          <div class="thumbnail"> <a href="#"><img src="images/5326574-a-sheep-wallpapers.jpg" alt=""></a> </div>
                          <div class="img_tiltle">
                            <h2>Image 2</h2>
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
            <div class="col-md-6 col-lg-6 ">
              <nav>
                <ul class="control-box pager" style="width:98%;">
                  <li><a data-slide="prev" href="#myCarousel1" class=""><i class="glyphicon glyphicon-chevron-left"></i></a></li>
                  <li><a data-slide="next" href="#myCarousel1" class=""> <i class="glyphicon glyphicon-chevron-right"></i></a></li>
                </ul>
              </nav>
              <div class="carousel slide" id="myCarousel1">
                <div class="carousel-inner">
                  <div class="item active">
                    <ul class="thumbnails">
                      <li class="col-md-12">
                        <div class="fff">
                          <div class="thumbnail">
                            <iframe src="https://player.vimeo.com/video/152115588" width="100%" height="258" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>
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
                    <ul class="thumbnails">
                      <li class="col-md-12">
                        <div class="fff">
                          <div class="thumbnail">
                            <iframe src="https://player.vimeo.com/video/152115588" width="100%" height="258" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>
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
          <div class="row">
            <div class="col-md-12">
              
              
              <div class="card-footer p-0  hidden">
                <nav aria-label="...">
                  <ul class="pagination justify-content-end mt-3 mr-3">
                    <li class="page-item disabled"> <span class="page-link">Previous</span> </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"> <span class="page-link">2<span class="sr-only">(current)</span> </span> </li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"> <a class="page-link" href="#">Next</a> </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
        <div class="panel-footer"> <span > <a href="programEdit.jsp" onclick="editProfProgram()"data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a> </span> </div>
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
