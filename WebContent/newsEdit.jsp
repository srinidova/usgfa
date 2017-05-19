<!doctype html>
<html>
<body>
	<!----------------------top_header start-------------------------------->
	<jsp:include page="includes.jsp" />
	<!----------------------top_header end---------------------------------->
<body>
	<!----------------------top_header start---------------------------->
	<jsp:include page="topheader.jsp" />
	<!----------------------top_header end------------------------------>

	<!----------------------header  start------------------------------->
	<jsp:include page="header.jsp" />
	<!----------------------header end---------------------------------->

	<!----------------------menus start--------------------------------->
	<jsp:include page="menu.jsp" />
	<!----------------------menus end----------------------------------->

	<!----------------------banner start-------------------------------->
	<%-- <jsp:include page="banner.jsp" /> --%>
	<!----------------------banner end---------------------------------->
<head>

<script type="text/javascript">
function newsEditFarmValidation() {
	//alert("==Entered==");
	$("#newsMessage").text("");
	//alert("==1==");
	var newsTitle = document.getElementById("newsEditTitle");
	var date = document.getElementById("newsEditDate");
	var paper = document.getElementById("newsEditPaper");
	var link = document.getElementById("newsEditLink");
	var moreInfo = document.getElementById("newsEditMoreInfo");
	//alert("==2==");
	if (emptyCheck(newsTitle, "Name Title", "newsMessage")
			&& minLenCheck(newsTitle, 5, "newsTitle", "newsMessage")
			&& maxLenCheck(newsTitle, 30, "Name Title", "newsMessage")
			&& allLetter(newsTitle, "Name Title", "newsMessage")
			&& emptyCheck(date, "Date", "newsMessage")
			&& minLenCheck(date, 5, "newsTitle", "newsMessage")
			&& maxLenCheck(date, 30, "Name Title", "newsMessage")
			&& twoFieldsCheck(paper, link, "Paper or Link/Url","newsMessage")
		   /*  && minLenCheck(paper, 5, "Paper", "newsMessage")
			&& maxLenCheck(paper, 30, "Paper", "newsMessage")
			&& minLenCheck(link, 5, "Link/Url", "newsMessage")
			&& maxLenCheck(link, 30, "Link/Url", "newsMessage") */
			&& (emptyCheck(moreInfo, "More Info", "newsMessage")
			&& minLenCheck(moreInfo, 5, "More Info", "newsMessage")
			&& maxLenCheck(moreInfo, 30, "More Info", "newsMessage"))) {

		newsUpdate();
	}

}
$(document).ready(function() {
	//alert("-------in editNews--Jsp---");
	$.ajax({
		url : "emp/newsService/editNews",
		success : function(data) {
				$.each(
						data.EditNews,
						function(key, val) {
							//alert("-------in editNews--Jsp---newsTitle=="+data.EditNews[key].date);
						$('#newsId').val(data.EditNews[key].newsId);	
						$('#newsEditTitle').val(data.EditNews[key].newsTitle);
					 	$('#newsEditDate').val(data.EditNews[key].date);
						$('#newsEditPaper').val(data.EditNews[key].paper);
						$('#newsEditLink').val(data.EditNews[key].link);
						$('#newsEditMoreInfo').val(data.EditNews[key].moreInfo);
						}
				)
		}
	});
});

function newsUpdate(){
	var newsId = $("#newsId").val();
	var newsTitle = $("#newsEditTitle").val();
	var date = $("#newsEditDate").val();
	var paper = $("#newsEditPaper").val();
	var link = $("#newsEditLink").val();
	var moreInfo = $("#newsEditMoreInfo").val();

	//alert("in to newsEditPage");
	
	var newsObject = new Object();
	newsObject.newsId = newsId;
	newsObject.newsTitle = newsTitle;
	newsObject.paper = paper;
	newsObject.date = date;
	newsObject.link = link;
	newsObject.moreInfo = moreInfo;
$
	.ajax({
		data : newsObject,
		url : "emp/newsService/newsUpdate",
		success : function(data) {
			if (data.Msg = "success") {
				//alert("in to newsEdit");
				window.location.href = "newsList.jsp";
				//alert("a4...........newsEdit");
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
				<h2>News Edit</h2>
				<div class="line3"></div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>

<div class="container" style="margin-top: 30px;"></div>
<div class="container" style="margin-top: 30px;">
	<div class="row">
		<div class="col-md-12">

			<div class="from">
				<div class="form-group">
					<label for="event_name"><h4>* These fields are required</h4></label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="event_name">Name Title *</label> 
						<input type="text" class="form-control" id="newsEditTitle" name="newsEditTitle">
						<input type="hidden" class="form-control" id="newsId" name="newsId">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="time_from">Date *</label>
						<div class='input-group date' id="newsEditDate1">
							<input type='text' class="form-control" id="newsEditDate" name="newsEditDate" /> 
							<span class="input-group-addon">
							 <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark"> Paper</label> 
						<input type="text" class="form-control" id="newsEditPaper" name="newsEditPaper">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="land_mark">Link/Url</label> 
						<input type="text" class="form-control" id="newsEditLink" name="newsEditLink">
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="more_info">More Info *</label>
						<textarea class="form-control" rows="5" id="newsEditMoreInfo" name="newsEditMoreInfo"></textarea>
					</div>
				</div>
				<!-------------------------Upload Photo--------------------------------------->
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-2">
							<div class="image">
								<img src="images/img.png" class="img-responsive img-thumbnail">
							</div>
						</div>
						<div class="upload_img">
						<form method="post" action="emp/commonUtils/upload" enctype="multipart/form-data">
							<div class="form-group col-md-6">
								<label for="Upload Photo">Select Photo(s)</label> 
								<input id="file"  name ="file" class="file form-control" type="file">
								<a href="#"><button class="btn btn-success btn-sm text-right">Upload</button></a>
							</div>
						</form>
						</div>
					</div>
				</div>

				<!-------------------------Upload Photo end--------------------------------------->
				<div class="clearfix"></div>

				<div class="clearfix"></div>

				<!----------------------photo_gallery------------------------------>

 <div class="row">
<div class="modal fade" id="image-gallery" tabindex="-1"
role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
style="display: none;">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">
	<span aria-hidden="true">×</span><span class="sr-only">Close</span>
</button>
<h4 class="modal-title" id="image-gallery-title"></h4>
</div>
<div class="modal-body">
<img id="image-gallery-image" class="img-responsive"
	src="images/g2.jpg">
</div>
<div class="modal-footer">
<div class="col-md-2">
	<button type="button" class="btn btn-primary"
		id="show-previous-image" style="display: none;">Previous</button>
</div>
<div class="col-md-8 text-justify"
	id="image-gallery-caption"></div>
<div class="col-md-2">
	<button type="button" id="show-next-image"
		class="btn btn-default">Next</button>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6">
<div class="row">

<div class="col-md-12" style="margin-bottom: 10px;">
<!-- Controls -->
<div class="controls pull-right ">
<a class="left fa fa-angle-left btn btn-default button-arrow"
href="#carousel-example" data-slide="prev"></a> <a
class="right fa fa-angle-right btn btn-default button-arrow"
href="#carousel-example" data-slide="next"></a>
</div>
</div>
</div>
<div id="carousel-example" class="carousel slide"
data-ride="carousel">
<!-- Wrapper for slides -->
<div class="carousel-inner">
<div class="item active left">
<div class="row">
<div class="col-sm-12">
	<div class="col-item">
		<div class="photo">
			<a class="g-image" href="#" data-image-id="1"
				data-toggle="modal" data-title="" data-caption=""
				data-image="images/g2.jpg" data-target="#image-gallery">
				<img class="img-responsive" src="images/g2.jpg"
				alt="Short alt text">
			</a>
		</div>

		<div class="img_tiltle" style="margin-top: 7px;">
			<h2>Image 1</h2>
		</div>

		<div class="caption" style="margin-top: 0px;">
			<div class="checkbox">
				<label> <input id="login-remember"
					type="checkbox" name="remember" value="1"> Show
					as Public
				</label>
				<div class="suceee_msg">
					<!-- <h4>Updated successfully</h4> -->
				</div>
			</div>
			<div class="delete_box">
				<a href="#"><i class="fa fa-trash-o"
					aria-hidden="true"></i> Delete</a>
				<div class="suceee_msg">
					<!-- <h4>Delete Message</h4> -->
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<div class="item next left">
<div class="row">
<div class="col-md-12">
	<div class="col-item">
		<div class="photo">
			<a class="g-image" href="#" data-image-id="2"
				data-toggle="modal" data-title="" data-caption=""
				data-image="images/g1.jpeg" data-target="#image-gallery">
				<img class="img-responsive" src="images/g1.jpeg"
				alt="Short alt text">
			</a>
		</div>


		<div class="img_tiltle" style="margin-top: 7px;">
			<h2>Image 2</h2>
		</div>

		<div class="caption" style="margin-top: 0px;">
			<div class="checkbox">
				<label> <input id="login-remember"
					type="checkbox" name="remember" value="1"> Show
					as Public
				</label>
				<div class="suceee_msg">
					<!-- <h4>Updated successfully</h4> -->
				</div>
			</div>
			<div class="delete_box">
				<a href="#"><i class="fa fa-trash-o"
					aria-hidden="true"></i> Delete</a>
				<div class="suceee_msg">
					<!-- <h4>Delete Message</h4> -->
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
</div>
</div> 
<!----------------------photo_gallery end------------------------------>

<!----------------------video_gallery------------------------------>
 <div class="col-md-6">
<div class="row">

<div class="col-md-12 " style="margin-bottom: 10px;">
<!-- Controls -->
<div class="controls pull-right">
<a class="left fa fa-angle-left btn btn-default button-arrow"
href="#carousel-example1" data-slide="prev"></a> <a
class="right fa fa-angle-right btn btn-default button-arrow"
href="#carousel-example1" data-slide="next"></a>
</div>
</div>
</div>
<div id="carousel-example1" class="carousel slide "
data-ride="carousel">
<!-- Wrapper for slides -->
<div class="carousel-inner">
<div class="item">
<div class="row">
<div class="col-sm-12">
	<div class="col-item">
		<div class="photo">
			<iframe src="https://player.vimeo.com/video/73051736"
				width="100%" height="347" frameborder="0"
				webkitallowfullscreen="" mozallowfullscreen=""
				allowfullscreen=""></iframe>
		</div>

		<div class="img_tiltle" style="margin-top: 7px;">
			<h2>Video 1</h2>
		</div>

		<div class="caption" style="margin-top: 0px;">
			<div class="checkbox">
				<label> <input id="login-remember"
					type="checkbox" name="remember" value="1"> Show
					as Public
				</label>
				<div class="suceee_msg">
					<!-- <h4>Updated successfully</h4> -->
				</div>
			</div>
			<div class="delete_box">
				<a href="#"><i class="fa fa-trash-o"
					aria-hidden="true"></i> Delete</a>
				<div class="suceee_msg">
					<!-- <h4>Delete Message</h4> -->
				</div>
			</div>
		</div>


	</div>
</div>
</div>
</div>
<div class="item active">
<div class="row">
<div class="col-md-12">
	<div class="col-item">
		<div class="photo">
			<iframe src="https://player.vimeo.com/video/73051736"
				width="100%" height="347" frameborder="0"
				webkitallowfullscreen="" mozallowfullscreen=""
				allowfullscreen=""></iframe>
		</div>
	</div>

	<div class="img_tiltle" style="margin-top: 7px;">
		<h2>Video 1</h2>
	</div>

	<div class="caption" style="margin-top: 0px;">
		<div class="checkbox">
			<label> <input id="login-remember"
				type="checkbox" name="remember" value="1"> Show
				as Public
			</label>
			<div class="suceee_msg">
				<!-- <h4>Updated successfully</h4> -->
			</div>
		</div>
		<div class="delete_box">
			<a href="#"><i class="fa fa-trash-o"
				aria-hidden="true"></i> Delete</a>
			<div class="suceee_msg">
				<<!-- h4>Delete Message</h4> -->
			</div>
		</div>
	</div>




</div>
</div>
</div>
</div>
</div>
</div> 
<!----------------------video_gallery end------------------------------>

				<!-------------------------submit button--------------------------------------->
				<div class="col-md-10">
					<div class="submit_button text-right">
						<a href='#'><button class="btn btn-success btn-sm text-right " onclick="newsEditFarmValidation();">Submit</button></a>
					</div>
					<div class="message">
						<h3><aside class=" " id="newsMessage" style="display: none">Save Sucessfully</aside></h3>
					</div>
				</div>

				<!-------------------------submit button end--------------------------------------->


				<div class="clearfix"></div>
			</div>
		</div>

	</div>
</div>
<!----------------------body_content end---------------------------->

<!----------------------footer start ------------------------------->
<jsp:include page="footer.jsp" />
<!----------------------footer end --------------------------------->
<script type="text/javascript">
    $(function () {
	
        $('#newsEditDate1').datetimepicker({
			 useCurrent: false,
			 format: 'DD/MM/YYYY'
			});

		$('.cross_icon').click(function(){
			alert('asdfasdf')
			$(this).parent().remove()
			});
    });
	
	function addItem(e){
		var html = $('.addOne').html();
		$('#content_block').append(html);
		//$(e).append(html);
		
		
				
	}
	
</script> 
</body>
</html>
<jsp:include page="login.jsp" />
