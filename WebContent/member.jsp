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
	<jsp:include page="banner.jsp" />
	<!----------------------banner end---------------------------------->
	<!----------------------body_content start-------------------------->

	<div class="clearfix"></div>
	<div id="aboutus">
		<div class="container">
			<div class="row">
				<div class="aboutus">
					<h2>MEMBERSHIP</h2>
					<div class="line3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>

	<div class="about_team">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="member_pera">
						<div id="page">
							<div class="block showmore_one">
								<h2>MEMBERSHIP BENIFITS - ORDINARY MEMBERS</h2>
								<p>
									Free subscription of Association magazine “Goat & Sheep
									Journal” sent at active member’s registered address by post
									on regular basis. Member free LOGIN facility at Association
									website <a href="#">www.usgfa.org</a> where they can download
									restricted useful information.
								</p>
								<p>Members can Tag their animals, take a picture of their
									Goats & Sheep, and either submit the digital picture in JPEG
									format to the State Chapter Office or directly upload at the
									members area. The Association has enrolled many registered
									national and International Animal Traders who would place an
									online bid for these animals. This would ensure higher price of
									your animals. Members would be provided with maximum technical
									support to run their farm on commercial scale. This would
									include help on Feeding, Breeding, Vaccination and healthcare,
									Selection, Management, Manure management, sourcing of animals,
									etc.</p>
								<p>Members would have free access to the members’ area
									where they can find and download useful information on various
									topics of successful farm management. Members willing to set up
									farms under various government Schemes would be offered
									subsidized cost Project Reports (Rs. 7,500 – 15,000)
									depending on the size of the farm, receive a certificate from
									the Association of the authenticity of the project report.
									Technical questions asked by Banks would be answered by
									Technical Experts of the Association. Member farmers would have
									the privilege to request the association to provide technical
									training to 2 persons nominated by them for their farms which
									would cover training to Farm Supervisors and Farm General
									Purpose Assistants.</p>
								<p>At least one professionally run and managed Goat farm in
									each region would be adopted as the Regional Training Centre
									managed by the Association. The Association would send people
									for professional trainings at these farms. The member farmers
									would receive a suitable sum per trainee basis on each
									training. A minimum 4 training sessions would be organized per
									year with a trainee batch size of 15 – 20 persons.</p>
								<p>Association through its State Chapters would address
									problems faced by existing small to medium scale farmers and
									take up the issue with the State departments. Members would be
									invited to all National level Goat & Sheep events organized by
									the Association with free pass to attend all events for general
									public as well as events with invitations. In all such events,
									members would receive discounts on Stalls run or managed by the
									Association which would cover Food, Snacks and publications.</p>
								<p>In every subscription of Association magazine, story of
									one farmer of a State would be published under featured page
									“Our Members” with brief biography and photograph.</p>
							</div>
						</div>

						<div id="page">
							<div class="block showmore_one">
								<h2>MEMBERSHIP BENEFITS - LIFE MEMBERS</h2>
								<p>No annual subscription required.</p>
								<p>Listing as an Office bearer in the State Chapter.</p>
								<p>Membership in the Core Group National Committees
									formulated by the Association to represent at various
									Ministries and Departments of Union Government of India.
								<p>Listing of the name as Life Member on all magazines /
									Website / Event Directories.</p>
								<p>Enlistment as a Professional Trainer in the Association
									registry recognized by HRD Ministry.</p>
								<p>Invitation at selective Industry interaction meets /
									government representations / seminars / exhibitions held on
									National level. Privilege to attend International on invitation
									subsidized tariff events on Goats & Sheep (at your own cost)
									Access to Association online information bank.</p>
								<p>Free life subscription of Association’s magazine
									“Goat & Sheep Journal” Printing of biography with picture
									in Association magazine’s featured column “KNOW ABOUT OUR
									LIFE MEMBERS”. To be printed in Alphabetic order of names of
									all life members. Chair a technical session of interest during
									various Seminars / Farmers Trainings / Symposiums, etc.</p>
								<p>Tailor made Golden collar badges allowing 24X7 access to
									VIP sections / lounges with privilege to attend Lunches /
									Dinners with Guest of Honors. Adoption of Life Member’s farm
									as a regional Skill Development cum Training Centre with
									Ministry of HRD approved training material supplied by the
									Association. Payment of standard per unit Trainee cost by the
									Association to the Life Member’s farm. Listing of the Life
									Member’s farm as a recognized Skill Development cum Training
									Centre at the Association website.</p>
								<p>All other rights of an ordinary member</p>
							</div>
						</div>
					</div>
					<div class="member_register_button">
						<a href='memberReg.jsp'>
							<button type="button" class="btn btn-success">Register</button>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<!----------------------about_us end------------------------------>

	</div>
	<div class="clearfix"></div>
	<!----------------------body_content end---------------------------->

	<!----------------------footer start ------------------------------->
	<jsp:include page="footer.jsp" />
	<!----------------------footer end --------------------------------->
	<script>
$(document).ready(function() {
     	
	$('.showmore_one').showMore({
		speedDown: 100,
	        speedUp: 100,
	        height: '190px',
	        showText: 'Show more',
	        hideText: 'Show less'
	});

	
	      
});
</script>

</body>
</html>
<jsp:include page="login.jsp" />
