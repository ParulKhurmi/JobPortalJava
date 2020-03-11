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
  <title>Register | Job Portal</title>

  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <meta content="Metronic Shop UI description" name="description">
  <meta content="Metronic Shop UI keywords" name="keywords">
  <meta content="keenthemes" name="author">

  <meta property="og:site_name" content="-CUSTOMER VALUE-">
  <meta property="og:title" content="-CUSTOMER VALUE-">
  <meta property="og:description" content="-CUSTOMER VALUE-">
  <meta property="og:type" content="website">
  <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
  <meta property="og:url" content="-CUSTOMER VALUE-">

<link rel="shortcut icon" href="logo.ico">

  <!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
  <!-- Fonts END -->

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

        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>
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
          <div class="col-md-12">
           
            <div class="content-page">
             <div class="col-md-7 col-sm-7">
             
               <%			   
               if((request.getParameter("jobid") !=null && request.getParameter("delete") ==null))
               {
					int jobid = Integer.parseInt(request.getParameter("jobid"));
					request.getSession().setAttribute("jobid", jobid);
					System.out.println("----------------------------jobid : "+jobid); 
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = null;
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234"); 
					PreparedStatement stmt = null;
					ResultSet result = null;
					try {
						stmt = con.prepareStatement("select * from jobs where jobid=?");
						stmt.setInt(1, jobid);		
						System.out.println("-------------------------------edit job details--------------------------------------------");
						result = stmt.executeQuery();
						if(!result.isBeforeFirst()) {
							out.println("<h1> No Entry Found. </h1>");
							} 
					else {
						while(result.next()) {	
					out.println("<form class='form-horizontal' method='POST' action='Jobs'");
                    out.println("<fieldset>");
                      out.println("<legend>Your personal details</legend>");
                      out.println("<div class='form-group'>");
                        out.println("<label for='firstname' class='col-lg-4 control-label'>Title <span class='require'>*</span></label>");
                        out.println("<div class='col-lg-8'>");
                          out.println("<input type='text' class='form-control' name='title' value='"+result.getString("title")+"'>");
                        out.println("</div>");
                      out.println("</div>");
                      out.println("<div class='form-group'>");
                        out.println("<label for='lastname' class='col-lg-4 control-label'>Description <span class='require'>*</span></label>");
                        out.println("<div class='col-lg-8'>");
                          out.println("<input type='text' class='form-control' name='description' value='"+result.getString("description")+"'>");
                        out.println("</div>");
                      out.println("</div>");
					   out.println("<div class='form-group'>");
                        out.println("<label for='lastname' class='col-lg-4 control-label'>Expiration_date <span class='require'>*</span></label>");
                        out.println("<div class='col-lg-8'>");
                         out.println(" <input type = 'text' name ='expiration_date' class='form-control'  value='"+result.getString("expiration_date")+"'/>");
                        out.println("</div>");
                      out.println("</div>");					  
                   out.println(" </fieldset>");                   
                   out.println(" <div class='row'>");
                     out.println(" <div class='col-lg-8 col-md-offset-4 padding-left-0 padding-top-20'>  ");                      
                     out.println("   <button type='submit' class='btn btn-primary btn-apply'> Save Changes/Update the Job</button> ");                     
                    out.println("  </div>");
                  out.println("  </div>");
                 out.println(" </form>");
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
               }
               if((request.getParameter("delete") != null && request.getParameter("jobid") !=null)&&(request.getParameter("Update") ==null))
               {
				   int jobid = Integer.parseInt(request.getParameter("jobid"));
            	   int isDeleted =Integer.parseInt(request.getParameter("delete"));
            	   System.out.println("-------------------------------   isDeleted : "+isDeleted); 
				   Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = null;
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234"); 
					PreparedStatement stmt = null;
					ResultSet result = null;
					try {
						stmt = con.prepareStatement("delete from jobs where jobid=?");
						stmt.setInt(1, jobid);	
						result = stmt.executeQuery();
						if(!result.isBeforeFirst()) {
							out.println("<h1> No Entry Found. </h1>");
							} 
					else {
						while(result.next()) {	
							out.println("Requested job Deleted Successfully.");
							
							response.sendRedirect("ManageAdds.jsp");
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
               }
              
					  
			%>
			  
                 
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