<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Vehicle Owner Dashboard</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
		<link href="css/font-awesome.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="css/pages/dashboard.css" rel="stylesheet">
		<style>
   			body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif;}
   			body {font-size:16px;} 
   			.table thead th {font-size: large;font-weight: bold;text-align: center}
   			.table tbody td {font-size: medium;text-align: center}
		</style>
	</head>
	<body>
	
			<%
				if(session.getAttribute("username")==null){
					
					response.sendRedirect("login.jsp");
					
				}
			
			%>
			
			<!-- navbar -->
			<jsp:include page="./vehicleOwnerHeader.jsp"/>
			<!-- /navbar -->
			
			<div class="subnavbar">
				  <div class="subnavbar-inner">
				    <div class="container">
				      <ul class="mainnav">
				        <li class=""><a href="vehicleOwnerDashboard.jsp"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
				            <li class="active"><a href="Profile.jsp"><i class="fa fa-address-card"></i><span>Edit Profile</span></a></li>
				       		<li><a href="changePassword.jsp"><i class="fa fa-thumb-tack"></i><span>Change Password</span></a> </li>
				            <li><a href="bookparking.jsp"><i class="fa fa-braille"></i><span>Book Parking Space</span></a> </li>
				            <li><a href="yourBookings.jsp"><i class="fa fa-clipboard"></i><span>Your Bookings</span></a> </li>
				            <li><a href="manageVehicle.jsp"><i class="fa fa-automobile"></i><span>Manage Vehicles </span></a> </li>
				            <li><a href="parkingLocator.jsp"><i class="fa fa-location-arrow"></i><span>Parking Locator</span> </a> </li>
				      </ul>
				    </div>
				    <!-- /container --> 
				  </div>
				  <!-- /subnavbar-inner --> 
			</div>
				<!-- /subnavbar -->
			
			
			<div class="main">
	
				<div class="main-inner">

	    				<div class="container">
					
					      <div class="row">
					      	
					      	<div class="span12">      		
					     		
					      		<div class="widget ">
					     			
					      			<div class="widget-header">
					      				<i class="icon-user"></i>
					      				<h3>Update Details</h3>
					  				</div> <!-- /widget-header -->
										
									<div class="widget-content">
															
										<div class="tabbable">
													
										<br>
										
										<div class="tab-content">
				
				
											<form method="get" action="Registration" class="form-horizontal" >
														<fieldset>
															
															<div class="control-group">											
																<label class="control-label" for="username" >User Name</label>
																<div class="controls">
																	<input type="text" name="username" value="<%=session.getAttribute("username")%>" readonly="readonly" required="required">
																</div> <!-- /controls -->				
															</div> <!-- /control-group -->
															
															
															<div class="control-group">											
																<label class="control-label" for="mobile" >Mobile Number</label>
																<div class="controls">
																	<input type="text" class="span6" id="mobile" name="mobile" placeholder="Mobile no">
																</div> <!-- /controls -->				
															</div> <!-- /control-group -->
															
															<div class="form-actions">
																<button type="submit" class="btn btn-primary" id="submit">Update</button> 
																
															</div> <!-- /form-actions -->
														</fieldset>
											</form>
												</div>
													
													
														
											  
											</div>
																	
										</div> <!-- /widget-content -->
											<div id="responseNote"></div>
									</div> <!-- /widget -->
						      		
							    </div> <!-- /span8 -->
						      	
						      	</div>
						      	
						      	</div>
						      	
						      	
						      </div> <!-- /row -->
						
						    </div> <!-- /container -->
	    
				</div> <!-- /main-inner -->
    
			</div> <!-- /main -->

			<!-- footer -->
			<jsp:include page="./footer.jsp"/>
			<!-- /footer --> 
 
			<!-- Placed at the end of the document so the pages load faster --> 
	</body>
</html>
