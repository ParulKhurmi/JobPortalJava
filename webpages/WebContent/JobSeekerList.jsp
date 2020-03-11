<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.2.0
Version: 3.1.3
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest (the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>Manage Adds | Job Portal</title>

  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <meta content="Metronic Shop UI description" name="description">
  <meta content="Metronic Shop UI keywords" name="keywords">
  <meta content="keenthemes" name="author">

  <link rel="shortcut icon" href="logo.ico">

  <!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
  <!-- Fonts END -->

 <!-- Global styles START -->          
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href="css/jquery.fancybox.css" rel="stylesheet">
  <!-- Page level plugin styles END -->

  <!-- Theme styles START -->
  <link href="css/components.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
 
  <link href="css/custom.css" rel="stylesheet">
  <style>
  .btn-apply{
      padding: 5px 7px;
	  font-size: 11px;
  }
  </style>
  <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="corporate">
    <!-- BEGIN STYLE CUSTOMIZER -->
   
    <!-- END BEGIN STYLE CUSTOMIZER --> 
<!-- BEGIN TOP BAR -->
    <div class="pre-header">
        <div class="container">
            <div class="row">
                <!-- BEGIN TOP BAR LEFT PART -->
                <div class="col-md-6 col-sm-6 additional-shop-info">
                    <ul class="list-unstyled list-inline">
                        <li><i class="fa fa-phone"></i><span>+1 456 6717</span></li>
                        <li><i class="fa fa-envelope-o"></i><span>info@keenthemes.com</span></li>
                    </ul>
                </div>
                <!-- END TOP BAR LEFT PART -->
                <!-- BEGIN TOP BAR MENU -->
                <div class="col-md-6 col-sm-6 additional-nav">
                    <ul class="list-unstyled list-inline pull-right">
                        <li><a href="page-login.html">Log In</a></li>
                        <li><a href="page-reg-page.html">Registration</a></li>
                    </ul>
                </div>
                <!-- END TOP BAR MENU -->
            </div>
        </div>        
    </div>
    <!-- END TOP BAR -->
    <!-- BEGIN HEADER -->
    <div class="header">
      <div class="container">
        <a class="site-logo" href="index.html"><img width="50%" src="images/logo.jpg" alt="Metronic FrontEnd"></a>
			 <h1 style="width: 55%; float: left; padding: 45px;">The Easiest Way To Get New Job</h1>	
        <!-- BEGIN NAVIGATION
        <div class="header-navigation pull-right font-transform-inherit">
          <ul>
				<li><a href="shop-index.html" target="_blank">Register</a></li>
				<li><a href="shop-index.html" target="_blank">Login</a></li>
		 </ul>
        </div>
        <!-- END NAVIGATION -->
      </div>
    </div>
    <!-- Header END -->

    <div class="main">
      <div class="container">
       <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="#">Pages</a></li>
            <li class="active">Login</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
      
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix"><a href="ManageAdds.jsp"><i class="fa fa-angle-right"></i> Manage Adds</a></li>
              <li class="list-group-item clearfix"><a href="CreateAdds.jsp"><i class="fa fa-angle-right"></i> Create Add</a></li>                             
            </ul>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-9">
           
            <div class="content-page">
             <h2>Welcome <b><%out.println("Following are the Job Seekers for "+request.getParameter("jobname"));
             %></b></h2>
              
			  <%
					int jobid = Integer.parseInt(request.getParameter("jobid"));
			  
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = null;
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234"); 
					PreparedStatement stmt = null;
					ResultSet result = null;
					try {
						System.out.println("----------------------------------------------------------employer_id is "+jobid+"-----------------------------");
						String sql = "SELECT job_applications.empid,REGISTERUSER.firstname,REGISTERUSER.lastname,REGISTERUSER.address,REGISTERUSER.emailid FROM job_applications JOIN REGISTERUSER ON job_applications.empid = REGISTERUSER.userid WHERE job_applications.jobid =?";
						stmt = con.prepareStatement(sql);
						stmt.setInt(1, jobid);		
						result = stmt.executeQuery();
						if(!result.isBeforeFirst()) {
							out.println("<h1> No Entries Found for"+jobid+" </h1>");
							} 
					else {
						while(result.next()) {									
							out.println("<div class='search-result-item'><p>"+result.getString("firstname")+" "+result.getString("lastname")+"</p>");
							out.println("<p>"+result.getString("address")+" and email address is "+result.getString("emailid")+"</p>");
							out.println("<a class='btn btn-primary btn-apply' href='ResponseToJobSeeker.jsp?jobid="+jobid+"&jobname="+request.getParameter("jobname")+"&useremail="+result.getString("emailid")+"'> Respond </a></div>");
							}
						}
					} catch(Exception e) {throw e;}
					finally {
							try {
									if(stmt != null)
										stmt.close();
										if(con != null)
											con.close();
								} 
								catch(SQLException e) 
								{
									e.printStackTrace();
								}
							}
			%>
			  
			  
              </div>
              
             

              <div class="row">
                <div class="col-md-4 col-sm-4 items-info">Items 1 to 9 of 10 total</div>
                <div class="col-md-8 col-sm-8">
                  <ul class="pagination pull-right">
                    <li><a href="#">Â«</a></li>
                    <li><a href="#">1</a></li>
                    <li><span>2</span></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">Â»</a></li>
                  </ul>
                </div>
              </div>

            </div>
          </div>
          <!-- END CONTENT -->
        </div>
      </div>
    </div>



    <!-- BEGIN FOOTER -->
    <div class="footer">
      <div class="container">
        <div class="row">
          <!-- BEGIN COPYRIGHT -->
          <div class="col-md-6 col-sm-6 padding-top-10">
            2018 Â© Job Portal. ALL Rights Reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
          </div>
          <!-- END COPYRIGHT -->
          <!-- BEGIN PAYMENTS -->
          <div class="col-md-6 col-sm-6">
            <ul class="social-footer list-unstyled list-inline pull-right">
              <li><a href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
              <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
              <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#"><i class="fa fa-skype"></i></a></li>
              <li><a href="#"><i class="fa fa-github"></i></a></li>
              <li><a href="#"><i class="fa fa-youtube"></i></a></li>
              <li><a href="#"><i class="fa fa-dropbox"></i></a></li>
            </ul>  
          </div>
          <!-- END PAYMENTS -->
        </div>
      </div>
    </div>
    <!-- END FOOTER -->

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="assets/global/plugins/respond.min.js"></script>
    <![endif]--> 
     <script src="scripts/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="scripts/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="scripts/bootstrap.min.js" type="text/javascript"></script>      
    <script src="scripts/back-to-top.js" type="text/javascript"></script> <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="scripts/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->

    <script src="scripts/layout.js" type="text/javascript"></script>
    
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>