<!doctype html>
<html>

    <!----------------------top_header start-------------------------------->
    <jsp:include page="includes.jsp"/> 
    <!----------------------top_header end----------------------------------> 
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
$(document).ready(function() {
	//alert("-------1-----");
	getProgramDetails();
});

function getProgramDetails() {
	//alert("-------2-----");
	var html = '';
	$.ajax({
				url : "emp/programService/getProgramDetails",
				success : function(data) {
					$.each(
							data.ProgramDetails,
							function(key, val) {
								//alert(data.ProgramDetails[key].programName);
								//alert(data.ProgramDetails[key].dateAndTimeFrom);
									html = html
									     + '<tr>'
										     + '<td>'+data.ProgramDetails[key].programName+'</td>'
										     +  '<td>'+data.ProgramDetails[key].duration+'</td>'
											 +  '<td>'+data.ProgramDetails[key].dateAndTimeFrom+'</td>'
											 +  '<td>'+data.ProgramDetails[key].channel+'</td>'
											 +  '<td>'+data.ProgramDetails[key].guest+'</td>'
											 +  '<td style ="width:50px;">'
											 	+ '<ul class="actions">'
											 		+ '<li>'
											 			+ '<a href="programProfile.jsp"> '
											 				+ '<button id='+data.ProgramDetails[key].programId+' class="btn btn-success btn-sm" onclick="getProgramProfile(this.id)">'
											 					+ '<i class="fa fa-eye" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		+ '<li>'
											 			+ '<a href="programEdit.jsp"> '
											 				+ '<button id='+data.ProgramDetails[key].programId+' class="btn btn-primary btn-sm" onclick="editProgram(this.id)">'
											 					+ '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 		+ '<li>'
											 			+ '<a href="programList.jsp"> '
											 				+ '<button id='+data.ProgramDetails[key].programId+' class="btn btn-danger btn-sm" onclick="deleteProgram(this.id)">'
											 					+ '<i class="fa fa-trash-o" aria-hidden="true"></i>' 
											 				+ '</button>'
											 			+ '</a>'
											 		+ '</li>'
											 	+ ' </ul>'
											 +  '</td>'
									     + '</tr>';
							}
					)
					$(html).appendTo("#programListData");
				}
					
	});
}

function getProgramProfile(programId){
	////alert("test.....0.....programId=="+programId);
	var programObject = new Object();
	////alert("test....1......programId=="+programId);
	programObject.programId = programId;
	////alert("test.....2.....programId=="+programId);
	$.ajax({
		data : programObject,
		url : "emp/programService/getProgramId",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
}
function editProgram(programId){
	//alert("editProgram----------programId=="+programId);
	var programObject = new Object();
	programObject.programId = programId;
	/* var newsObject = new Object();
	newsObject.newsId = newsId; */
	$.ajax({
		data : programObject,
		url : "emp/programService/getProgramId",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
	
}
function deleteProgram(programId){
	//alert("programId=="+programId);
	var programObject = new Object();
	programObject.programId = programId;
	$.ajax({
		data : programObject,
		url : "emp/programService/deleteProgram",
		success : function(data) {
			if (data.Msg = "success") {
			}
		}
	});
	
}
</script>
</head>
        
<body>
	<!----------------------body_content start-------------------------->
	
      <div class="clearfix"></div>
<div id="aboutus">
  <div class="container" >
    <div class="row">
      <div class="aboutus">
        <h2>Program List</h2>
        <div class="line3"></div>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>

<!-- <div class="container" style="margin-top: 30px;">
</div> -->
	<div class="container" style="margin-top: 30px;">
<div class="row">
<div class="col-md-12">


       
     <div class="program_list">
        <div class="row">
          
          <div class="col-md-10">
            <div class="table-responsive" >
              <table class="table  table-bordered">
                <tr>
                  <th>Program Name</th>
                  <th>Duration</th>
                  <th>Date & Time From</th>
                  <th>Channel</th>
				  <th>Guest</th>
				  
                  <th></th>
                </tr>
                <tr>
                  <td><div class="row">
                      <div class="col-md-10">
                        <input type="text" name='name0'  placeholder='Program Name' class="form-control " style="width:200px;"/>
                      </div>
                    </div></td>
                  <td><div class="row">
                      <div class="col-md-12">
                        <input type="text" name='name0'  placeholder='Duration' class="form-control " style="width:50px;"/>
                      </div>
                    </div></td>
                  <td><div class="row">
                      <div class="col-md-12">
                        <input type="text" name='name0'  placeholder='Date & Time From' class="form-control " style="width:80px;"/>
                      </div>
                    </div></td>
					<td><div class="row">
                      <div class="col-md-12">
                        <input type="text" name='name0'  placeholder='Channel' class="form-control " style="width:80px;"/>
                      </div>
                    </div></td>
					<td><div class="row">
                      <div class="col-md-12">
                        <input type="text" name='name0'  placeholder='Guest' class="form-control " style="width:80px;"/>
                      </div>
                    </div></td>
                  
                  <td></td>
                </tr>
                <!-- <tr>
                  <td>Abcdef</td>
                  <td>duration</td>
                  <td>Date & time from</td>
                  <td>channel</td>
					<td>guest</td>
					<td style ="width:50px;"><ul class="actions">
                      <li> <a href="event-profile.html">
                       <a href="programProfile.html"> <button class="btn btn-success btn-sm"><i class="fa fa-eye" aria-hidden="true"></i></button>
                        </a> </li>
                      <li> <a href="#">
                        <a href="programEdit.html"><button class="btn  btn-primary btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></a>
                        </a> </li>
                      <li> <a href="#">
                        <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                        </a> </li>
                    </ul></td>
                </tr> -->
              </table>
              <div class="col-md-10">
				<div class="table-responsive">
					<table class="table  table-bordered">
						<div id="programListData"></div>
					</table>
 				</div>
			</div>
            </div>
          </div>
        </div>
      </div>
      <div class="clearfix"></div>
     
      <div class="clearfix"></div>
      
      <!------------------------------guests form--------------------------------------->
     
      
      <!------------------------------guests form end---------------------------------------> 
      
     
      
      <div class="clearfix"></div>
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
