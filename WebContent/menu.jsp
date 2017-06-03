<!----------------------menus------------------------------>
<% 
//System.out.println("--- LOGINROLE ------");
boolean bShow = false;
String sRole=(String)session.getAttribute("LOGINROLE"); 
//System.out.println("In Menu jsp sRole=="+sRole);
if(sRole != null && (sRole.equals("Life") || sRole.equals("Admin") ) ){
	bShow = true;
}
%>
<div id="menus">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav id='cssmenu'>
                    <div id="head-mobile"></div>
                    <div class="button"></div>
                    <ul>
                        <li class='active'><a href='/usgfa'>Home </a></li>
                        <li><a href='aboutUs.jsp'> About Us</a></li>
                        <li><a href='#'>Events</a>
                            <ul>
                               <% if(bShow){ %>
                               		<li><a href='eventReg.jsp'>Event New</a></li>  
                               <% } %>
                                <li><a href='eventList.jsp'>Event List</a></li>
                            </ul>
                        </li>
                        
                        <li><a href="#">Member</a>
                        <ul>
                           <% if(bShow){ %>
                                <li><a href='member.jsp'>Member New</a></li>
                           <% } %>
                                <li><a href='memberList.jsp'>Member List</a></li>
                            </ul>
                         </li>
                         <li><a href='#'>Programs</a>
                            <ul>
                             <% if(bShow){ %>
                                <li><a href='programReg.jsp'>Program New</a></li>
                              <% } %>   
                                <li><a href='programList.jsp'>Program List</a></li>
                            </ul>
                        </li>
                        <li><a href='#'>News</a>
                            <ul>
                            <% if(bShow){ %>
                                <li><a href='newsReg.jsp'>News New</a></li>
                             <% } %>       
                                <li><a href='newsList.jsp'>News List</a></li>
                            </ul>
                        </li>
                        <li><a href='#'>Success Stories</a>
                            <ul>
                            <% if(bShow){ %>
                                <li><a href='storiesReg.jsp'>Stories New</a></li>
                             <% } %>      
                                <li><a href='storiesList.jsp'>Stories List</a></li>
                            </ul>
                        </li>
                        <li><a href='contactUs.jsp'>Contact Us</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<!----------------------menus end------------------------------> 