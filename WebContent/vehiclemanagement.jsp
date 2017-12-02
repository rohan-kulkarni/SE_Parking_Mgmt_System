<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vehicle Management</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/metro/crimson/jtable.css" rel="stylesheet"
	type="text/css" />
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<script src="js/jquery-1.7.2.min.js"></script>
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"
	type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<script type="text/javascript">
	    $(document).ready(function() {
		//initialize jTable
		$('#UserTableContainer').jtable({
			title : 'Table of Vehicles',
			sorting : true,
			paging : true,
			pagesize : 10,
			actions : {
				listAction : 'VehicleManagementServlet?action=list',
				deleteAction : 'VehicleManagementServlet?action=delete'
			},
			fields : {
				reg_number : {
					title : 'Registration Number',
					width : '30%',
					list : true,
				//edit: true
				},
				VehicleName : {
					title : 'Vehicle Name',
					width : '30%',
					list : true,
				//edit: true
				},
				VehicleType : {
					title : 'Vehicle Type',
					width : '30%',
					list : true,
				//edit: true
				}
			}
		});
		$('#UserTableContainer').jtable('load');
	});
</script>
</head>
<body>
	<!-- navbar -->
	<jsp:include page="./vehicleOwnerHeader.jsp" />
	<!-- /navbar -->



	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
					<li class="active"><a href="vehicleOwnerDashboard.jsp"><i
							class="icon-dashboard"></i><span>Dashboard</span> </a></li>
					<li><a href="Profile.jsp"><i class="fa fa-address-card"></i><span>Edit
								Profile</span></a></li>
					<li><a href="changePassword.jsp"><i
							class="fa fa-thumb-tack"></i><span>Change Password</span></a></li>
					<li><a href="bookparking.jsp"><i class="fa fa-braille"></i><span>Book
								Parking Space</span></a></li>
					<li><a href="yourBookings.jsp"><i class="fa fa-clipboard"></i><span>Your
								Bookings</span></a></li>
					<li><a href="vehiclemanagement.jsp"><i
							class="fa fa-automobile"></i><span>Manage Vehicles </span></a></li>
					<li><a href="parkingLocator.jsp"><i
							class="fa fa-location-arrow"></i><span>Parking Locator</span> </a></li>
				</ul>
			</div>
			<!-- /container -->
		</div>
		<!-- /subnavbar-inner -->
	</div>
	<!-- /subnavbar -->




	<!-- /navbar -->



	<div class="main">

		<div class="main-inner">

			<div class="container">

				<div class="row">

					<div class="span12">

						<div class="widget ">

							<div class="widget-header">
								<i class="icon-user"></i>
								<h3>Manage Vehicle</h3>
							</div>
							<!-- /widget-header -->

							<div class="widget-content">

								<div class="tabbable">

									<br>

									<div class="tab-content">


										<div style="text-align: center;">
											<form method="get" action="VehicleManagement"
												class="form-horizontal">
												<fieldset>
													<div class="control-group">
														<label class="control-label" for="reg_num">Registration
															Number</label>
														<div class="controls">
															<input type="text" class="span6 disabled" id="reg_num"
																name="reg_num">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													<fieldset>
														<div class="control-group">
															<label class="control-label" for="vehicle_name">Vehicle
																Name</label>
															<div class="controls">
																<input type="text" class="span6 disabled"
																	id="vehicle_name" name="vehicle_name">
															</div>
															<!-- /controls -->
														</div>
														<!-- /control-group -->

														<div class="control-group">
															<label class="control-label" for="vehicle_type">Vehicle
																Type</label>
															<div class="controls">
																<input type="text" class="span6 disabled"
																	id="vehicle_type" name="vehicle_type">
															</div>
															<!-- /controls -->
														</div>
														<!-- /control-group -->

														<div class="form-actions">
															<button type="submit" class="btn btn-primary" id="submit">Add</button>

														</div>
														<!-- /form-actions -->
													</fieldset>
											</form>
										</div>
										<div id="UserTableContainer"></div>
										<!-- footer -->
	<jsp:include page="./footer.jsp" />
	<!-- /footer -->
</body>
</html>