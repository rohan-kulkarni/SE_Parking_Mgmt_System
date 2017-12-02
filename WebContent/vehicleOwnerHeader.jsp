<!-- RAHUL -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/jquery-1.7.2.min.js"></script> 
<script src="js/bootstrap.js"></script>
<script src="js/base.js"></script> 
<style>
   body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif;}
   body {font-size:20px;}
   .btn-success,.btn-large {background-color:#49635c;}  
    
   .navbar .container > .nav-collapse > ul > li > ul > li > a:hover {
	color: #ffffff;
	text-decoration: none;
	background-color: #609083;
	} 
	.navbar-inner{height:80px}
    ul.dropdown {background-color: white} 
   
</style>
</head>
<body>

			<%
				if(session.getAttribute("username")==null){
					
					response.sendRedirect("login.jsp");
					
				}
			
			%>


<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="brand" href="#" style="font-size: xx-large;">Parking Management System </a>
      <div class="nav-collapse">
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> ${username} <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Profile</a></li>
              <li><a href="LogoutServlet">Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <!--/.nav-collapse -->
      <br/>
    <p style="font-size: x-large; margin-right: 50px; color: #ffffff;">Vehicle Owner</p> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->

<!-- Placed at the end of the document so the pages load faster --> 


</body>
</html>
