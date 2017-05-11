
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/chosen.min.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<script type="text/javascript" src="../js/jquery-3.1.1.js"></script>
<!-- <script  src="https://code.jquery.com/jquery-2.2.4.js"></script> -->
<script src="../js/jquery-ui.js" type="text/javascript"></script>
<script src="../js/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/chosen.jquery.js"></script>
<script type="text/javascript" src="../js/chosen.jquery.min.js"></script>

<meta charset="UTF-8">
<title>USGFA</title>
</head>
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
	<jsp:include page="banner.jsp" />
	<!----------------------banner end---------------------------------->
	<!----------------------body_content------------------------------>
	<div id="body_content">

		<!----------------------about_us------------------------------>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="about_us">
						<h2>ABOUT US</h2>
						<div class="line4">
							<img src="images/line.png">
						</div>
						<div class="pera">
							<p>Nunc ullamcorper sollicitudin arcu, ut fermentum magna
								ultricies quis. Proin aliquet, est ut pellentesque malesuada,
								purus enim egestas nisl, eget mollis justo lorem facilisis orci.
								Sed in tristique nulla.Nunc ullamcorper sollicitudin arcu, ut
								fermentum magna ultricies quis. Proin aliquet, est ut
								pellentesque malesuada, purus enim egestas nisl, eget mollis
								.justo lorem facilisis orci. Sed in tristique nulla.Nunc
								ullamcorper sollicitudin arcu, ut fermentum magna ultricies
								quis. Proin aliquet, est ut pellentesque malesuada, purus enim
								egestas nisl.</p>
							<a href="aboutUs.jsp">READ MORE</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<!----------------------about_us end------------------------------>

		<!----------------------gallery_section------------------------------>
		<div id="gallery_section">
			<div class="container">
				<div class="row">

					<!----------------------photo_gallery------------------------------>

					<div class="row">
						<div class="modal fade" id="image-gallery" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">×</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="image-gallery-title"></h4>
									</div>
									<div class="modal-body">
										<img id="image-gallery-image" class="img-responsive" src="">
									</div>
									<div class="modal-footer">
										<div class="col-md-2">
											<button type="button" class="btn btn-primary"
												id="show-previous-image">Previous</button>
										</div>
										<div class="col-md-8 text-justify" id="image-gallery-caption">
											This text will be overwritten by jQuery</div>
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
							<div class="col-md-6 col-sm-6">
								<div class="gallery">
									<h2>GALLERY</h2>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
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
								<div class="item active">
									<div class="row">
										<div class="col-sm-12">
											<div class="col-item">
												<div class="photo">
													<a class="g-image" href="#" data-image-id=""
														data-toggle="modal" data-title="" data-caption=""
														data-image="images/g2.jpg" data-target="#image-gallery">
														<img class="img-responsive" src="images/g2.jpg"
														alt="Short alt text">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="row">
										<div class="col-md-12">
											<div class="col-item">
												<div class="photo">
													<a class="g-image" href="#" data-image-id=""
														data-toggle="modal" data-title="" data-caption=""
														data-image="images/g1.jpeg" data-target="#image-gallery">
														<img class="img-responsive" src="images/g1.jpeg"
														alt="Short alt text">
													</a>
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
							<div class="col-md-6 col-sm-6">
								<div class="gallery">
									<h2>Videos</h2>
								</div>
							</div>
							<div class="col-md-6 col-sm-6 ">
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
								<div class="item active">
									<div class="row">
										<div class="col-sm-12">
											<div class="col-item">
												<div class="photo">
													<iframe src="https://player.vimeo.com/video/73051736"
														width="100%" height="347" frameborder="0"
														webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="row">
										<div class="col-md-12">
											<div class="col-item">
												<div class="photo">
													<iframe src="https://player.vimeo.com/video/73051736"
														width="100%" height="347" frameborder="0"
														webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!----------------------video_gallery end------------------------------>

				</div>
			</div>
		</div>
		<div class="clearfix"></div>

		<!----------------------gallery_section end------------------------------>

		<!----------------------service_section------------------------------>
		<div id="service_section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="services">
							<h2>SERVICES</h2>
							<div class="line1"></div>
						</div>
					</div>
					<div class="col-md-12" style="margin-top: 2em;">
						<div class="panel with-nav-tabs ">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab1primary" data-toggle="tab">EVENTS</a></li>
								<li><a href="#tab2primary" data-toggle="tab">PROGRAMS</a></li>
								<li><a href="#tab3primary" data-toggle="tab">NEWS</a></li>
								<li><a href="#tab4primary" data-toggle="tab">Sucess
										Stories</a></li>
							</ul>
						</div>
						<div class="tabs_content">
							<div class="panel-body">
								<div class="tab-content">

									<!-----------------------event tab---------------------->

									<div class="tab-pane fade in active" id="tab1primary">
										<div id="carousel-example" class="carousel slide">
											<!-- Wrapper for slides -->
											<div class="carousel-inner">
												<div class="item active">
													<div class="row">
														<div class="col-md-4">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>Event Name</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event gallery------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12" pull-right>
																					<!-- Controls -->
																					<div class="controls pull-right	">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example2" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example2" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example2" class="carousel slide"
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g1.jpeg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g2.jpg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>

																		<!-------------event gallery end------------->

																		<!-------------event video------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12 pull-right">
																					<!-- Controls -->
																					<div class="controls pull-right">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example3" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example3" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example3" class="carousel slide "
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-------------event video end------------->

																		<div class="readmore">
																			<a href="eventList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-12 col-xs-12">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>Event Name</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event gallery------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12" pull-right>
																					<!-- Controls -->
																					<div class="controls pull-right	">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example4" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example4" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example4" class="carousel slide"
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g1.jpeg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g2.jpg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>

																		<!-------------event gallery end------------->

																		<!-------------event video------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12 pull-right">
																					<!-- Controls -->
																					<div class="controls pull-right">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example5" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example5" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example5" class="carousel slide "
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-------------event video end------------->

																		<div class="readmore">
																			<a href="eventList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-12 col-xs-12">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>Event Name</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event gallery------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12" pull-right>
																					<!-- Controls -->
																					<div class="controls pull-right	">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example6" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example6" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example6" class="carousel slide"
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g1.jpeg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g2.jpg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>

																		<!-------------event gallery end------------->

																		<!-------------event video------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12 pull-right">
																					<!-- Controls -->
																					<div class="controls pull-right">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example7" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example7" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example7" class="carousel slide "
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-------------event video end------------->

																		<div class="readmore">
																			<a href="eventList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="more_events">
													<a href='eventList.jsp'>More Events</a>
												</div>
											</div>
										</div>
									</div>

									<!-----------------------event tab end---------------------->

									<!-----------------------programs---------------------->

									<div class="tab-pane fade" id="tab2primary">
										<div id="carousel-example" class="carousel slide">
											<!-- Wrapper for slides -->
											<div class="carousel-inner">
												<div class="item active">
													<div class="row">
														<div class="col-md-4">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>Progrmas</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event video------------->
																		<div class="col-md-12">
																			<div class="row">
																				<div class="col-md-12 pull-right">
																					<!-- Controls -->
																					<div class="controls pull-right">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example8" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example8" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example8" class="carousel slide "
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-------------event video end------------->

																		<div class="readmore">
																			<a href="programList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-12 col-xs-12">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>Progrmas</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event video------------->
																		<div class="col-md-12">
																			<div class="row">
																				<div class="col-md-12 pull-right">
																					<!-- Controls -->
																					<div class="controls pull-right">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example9" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example9" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example9" class="carousel slide "
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-------------event video end------------->

																		<div class="readmore">
																			<a href="programList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-12 col-xs-12">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>Progrmas</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event video------------->
																		<div class="col-md-12">
																			<div class="row">
																				<div class="col-md-12 pull-right">
																					<!-- Controls -->
																					<div class="controls pull-right">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example10" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example10" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example10" class="carousel slide "
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-------------event video end------------->

																		<div class="readmore">
																			<a href="programList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="more_events">
													<a href="programList.jsp">More Programs</a>
												</div>
											</div>
										</div>
									</div>

									<!-----------------------programs end---------------------->

									<!-----------------------News ---------------------->

									<div class="tab-pane fade" id="tab3primary">
										<div id="carousel-example" class="carousel slide">
											<!-- Wrapper for slides -->
											<div class="carousel-inner">
												<div class="item active">
													<div class="row">
														<div class="col-md-4">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>News</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event gallery------------->
																		<div class="col-md-12">
																			<div class="row">
																				<div class="col-md-12" pull-right>
																					<!-- Controls -->
																					<div class="controls pull-right	">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example11" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example11" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example11" class="carousel slide"
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g1.jpeg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g2.jpg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>

																		<!-------------event gallery end------------->

																		<div class="readmore">
																			<a href="NewsList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-12 col-xs-12">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>News</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event gallery------------->
																		<div class="col-md-12">
																			<div class="row">
																				<div class="col-md-12" pull-right>
																					<!-- Controls -->
																					<div class="controls pull-right	">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example12" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example12" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example12" class="carousel slide"
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g1.jpeg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g2.jpg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>

																		<!-------------event gallery end------------->

																		<div class="readmore">
																			<a href="newsList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-12 col-xs-12">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>News</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event gallery------------->
																		<div class="col-md-12">
																			<div class="row">
																				<div class="col-md-12" pull-right>
																					<!-- Controls -->
																					<div class="controls pull-right	">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example13" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example13" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example13" class="carousel slide"
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g1.jpeg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g2.jpg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>

																		<!-------------event gallery end------------->

																		<div class="readmore">
																			<a href="newsList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="more_events">
													<a href="newsList.jsp">More News</a>
												</div>
											</div>
										</div>
									</div>

									<!-----------------------News end---------------------->

									<!-----------------------Sucess stories---------------------->
									<div class="tab-pane fade" id="tab4primary">
										<div id="carousel-example" class="carousel slide">
											<!-- Wrapper for slides -->
											<div class="carousel-inner">
												<div class="item active">
													<div class="row">
														<div class="col-md-4">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>Sucess Stories</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event gallery------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12" pull-right>
																					<!-- Controls -->
																					<div class="controls pull-right	">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example14" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example14" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example14" class="carousel slide"
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g1.jpeg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g2.jpg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>

																		<!-------------event gallery end------------->

																		<!-------------event video------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12 pull-right">
																					<!-- Controls -->
																					<div class="controls pull-right">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example15" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example15" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example15" class="carousel slide "
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-------------event video end------------->

																		<div class="readmore">
																			<a href="storiesList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-12 col-xs-12">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>Sucess Stories</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event gallery------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12" pull-right>
																					<!-- Controls -->
																					<div class="controls pull-right	">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example16" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example16" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example16" class="carousel slide"
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g1.jpeg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g2.jpg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>

																		<!-------------event gallery end------------->

																		<!-------------event video------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12 pull-right">
																					<!-- Controls -->
																					<div class="controls pull-right">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example17" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example17" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example17" class="carousel slide "
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-------------event video end------------->

																		<div class="readmore">
																			<a href="storiesList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-12 col-xs-12">
															<div class="col-item">
																<div class="event">
																	<div class="date">
																		<h2>22-02-2017</h2>
																	</div>
																	<div class="event_name">
																		<h2>Sucess Stories</h2>
																	</div>
																	<div class="event_details">
																		<p>Aliqua.adipisicing elit,sed do eiusmod tempor
																			ncididunt ut labore et dolore magna aliqua.
																			adipisicing elit, sed do eiusmod tempor ncididunt ut
																			labore et dolore magna</p>
																	</div>
																	<div class="row">

																		<!-------------event gallery------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12" pull-right>
																					<!-- Controls -->
																					<div class="controls pull-right	">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example18" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example18" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example18" class="carousel slide"
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g1.jpeg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="event_img">
																										<img src="images/g2.jpg" alt=""
																											class="img-responsive" />
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>

																		<!-------------event gallery end------------->

																		<!-------------event video------------->
																		<div class="col-md-6">
																			<div class="row">
																				<div class="col-md-12 pull-right">
																					<!-- Controls -->
																					<div class="controls pull-right">
																						<a
																							class="left fa fa-angle-left btn btn-default button-arrow2"
																							href="#carousel-example19" data-slide="prev"></a>
																						<a
																							class="right fa fa-angle-right btn btn-default button-arrow2"
																							href="#carousel-example19" data-slide="next"></a>
																					</div>
																				</div>
																			</div>
																			<div id="carousel-example19" class="carousel slide "
																				data-ride="carousel">
																				<!-- Wrapper for slides -->
																				<div class="carousel-inner">
																					<div class="item active">
																						<div class="row">
																							<div class="col-sm-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="item">
																						<div class="row">
																							<div class="col-md-12">
																								<div class="col-item">
																									<div class="photo">
																										<iframe
																											src="https://player.vimeo.com/video/73051736"
																											width="100%" height="120" frameborder="0"
																											webkitallowfullscreen mozallowfullscreen
																											allowfullscreen></iframe>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-------------event video end------------->

																		<div class="readmore">
																			<a href="storiesList.jsp">More info...</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="more_events">
													<a href="storiesList.jsp">More Sucess Stories</a>
												</div>
											</div>
										</div>
									</div>

									<!-----------------------Sucess stories end---------------------->

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<!----------------------service_section end------------------------------>

	</div>
	<div class="clearfix"></div>
	<!----------------------body_content end------------------------------>

	<!----------------------footer start ------------------------------->
	<jsp:include page="footer.jsp" />
	<!----------------------footer end --------------------------------->
</body>
</html>
<jsp:include page="login.jsp" />

