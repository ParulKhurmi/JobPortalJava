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
  <title>Job Portal</title>

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
                        <li><a href="Login.jsp?directLogin=1">Log In</a></li>
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
              <form action="#" class="content-search-view2">
                <div class="input-group">
                  <input type="text" id="search" class="form-control" placeholder="Search...">
                  <span class="input-group-btn">
                    <button id="btnSubmitId" class="btn btn-primary">Search</button>
                  </span>
                </div>
              </form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#btnSubmitId").click(function(){
	alert(1);
     	var search = $(this).parent().parent().children().first().val();;
     	alert(search);
   		 $.ajax({
    		type: 'GET',
    		data: {search : search},
    		url: 'Search', 
    		dataType: 'json',
    		success: function(result){
        		debugger;
        		$(".content-page").html("<div class='search-result-item'><h4><a href='#'>"+result[0]+"</a></h4>"+
				"<p>"+result[1]+"</p>"+
				"<a class='btn btn-primary btn-apply' href='Login.jsp?jobid="+result[2]+"&jobname="+result[3]+"'>Apply Now</a></div>");
			
    			}
    		});
		});
	});
</script>
             <!--  <div class="search-result-item">
                <h4><a href="#">Metronic - Responsive Admin Dashboard Template</a></h4>
                <p>Metronic is a responsive admin dashboard template powered with Twitter Bootstrap Framework for admin and backend applications. Metronic has a clean and intuitive metro style design which makes your next project look awesome and yet user friendly..</p>
                 <button type="submit" class="btn btn-primary btn-apply">Apply Now</button>
              </div>
              <div class="search-result-item">
                <h4><a href="#">Metronic - Responsive Admin Dashboard Template</a></h4>
                <p>Metronic is a responsive admin dashboard template powered with Twitter Bootstrap Framework for admin and backend applications. Metronic has a clean and intuitive metro style design which makes your next project look awesome and yet user friendly..</p>
                 <button type="submit" class="btn btn-primary btn-apply">Apply Now</button>
              </div>
              <div class="search-result-item">
                <h4><a href="#">Metronic - Responsive Admin Dashboard Template</a></h4>
                <p>Metronic is a responsive admin dashboard template powered with Twitter Bootstrap Framework for admin and backend applications. Metronic has a clean and intuitive metro style design which makes your next project look awesome and yet user friendly..</p>
                 <button type="submit" class="btn btn-primary btn-apply">Apply Now</button>
              </div>
              -->

  <div class="content-page">
             
              
			  <%			       
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = null;
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234"); 
					PreparedStatement stmt = null;
					ResultSet result = null;
					try {
						stmt = con.prepareStatement("select * from jobs ORDER BY jobid desc");
						//stmt.setInt(1, usrid);		
						System.out.println("----------------------------------------------------------Jov Listing-----------------------------");
						result = stmt.executeQuery();
						if(!result.isBeforeFirst()) {
							out.println("<h1> No Jobs Found. </h1>");
							} 
					else {
						while(result.next()) {		
								if(request.getSession().getAttribute("username")==null)
								{						
									out.println("<div class='search-result-item'><h4><a href='#'>"+result.getString("title")+"</a></h4>");
									out.println("<p>"+result.getString("description")+"</p>");
									out.println("<a class='btn btn-primary btn-apply' href='Login.jsp?jobid="+result.getInt("jobid")+"&jobname="+result.getString("title")+"'>Apply Now</a></div>");
								}
								else{
									out.println("<div class='search-result-item'><h4><a href='#'>"+result.getString("title")+"</a></h4>");
									out.println("<p>"+result.getString("description")+"</p>");
									out.println("<a class='btn btn-primary btn-apply' href='ApplyNow.jsp?jobid="+result.getInt("jobid")+"&jobname="+result.getString("title")+"'>Apply Now</a></div>");
																	
								}
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
                    <li><a href="#">«</a></li>
                    <li><a href="#">1</a></li>
                    <li><span>2</span></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">»</a></li>
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
            2018 © Job Portal. ALL Rights Reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
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
   

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="scripts/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->

    <script src="scripts/layout.js" type="text/javascript"></script>
    <script src="scripts/layout.js" type="text/javascript"></script>
    
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>