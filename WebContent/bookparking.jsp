<%@page import="java.sql.*"%>
<%@ page import="com.mvc.util.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Vehicle Owner Dashboard</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif;
}

body {
	font-size: 16px;
}

.table thead th {
	font-size: large;
	font-weight: bold;
	text-align: center
}

.table tbody td {
	font-size: medium;
	text-align: center
}
</style>
</head>
<body>

	<%
		if (session.getAttribute("username") == null) {

			response.sendRedirect("home.jsp");

		}
	%>

	<!-- navbar -->
	<jsp:include page="./vehicleOwnerHeader.jsp" />
	<!-- /navbar -->

	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
					<li class=""><a href="vehicleOwnerDashboard.jsp"><i
							class="icon-dashboard"></i><span>Dashboard</span> </a></li>
					<li><a href="Profile.jsp"><i class="fa fa-address-card"></i><span>Edit
								Profile</span></a></li>
					<li><a href="changePassword.jsp"><i
							class="fa fa-thumb-tack"></i><span>Change Password</span></a></li>
					<li class="active"><a href="bookparking.jsp"><i
							class="fa fa-braille"></i><span>Book Parking Space</span></a></li>
					<li><a href="yourBookings.jsp"><i class="fa fa-clipboard"></i><span>Your
								Bookings</span></a></li>
					<li><a href="manageVehicle.jsp"><i
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


	<div class="main">

		<div class="main-inner">

			<div class="container">

				<div class="row">

					<div class="span12">

						<div class="widget ">

							<div class="widget-header">
								<i class="icon-user"></i>
								<h3>Book Parking Space</h3>
							</div>
							<!-- /widget-header -->

							<div class="widget-content">

								<div class="tabbable">

									<br>

									<div class="tab-content">

										<form action="Bookparking" method="post"
											class="form-horizontal">
											<fieldset>

												<div class="control-group">
													<label class="control-label" for="username">User
														Name</label>
													<div class="controls">
														<input type="text" name="username"
															value="<%=session.getAttribute("username")%>"
															readonly="readonly" required="required">
													</div>
													<!-- /controls -->
												</div>
												<!-- /control-group -->



												<div class="control-group">
													<label class="control-label" for="regNo">Vehicle
														Registration no</label>
													<div class="controls">
														<select name='regno'>
															<option value="none">Select</option>
															<%
																Connection con1 = DBConnection.createConnection();
																Statement stmt1 = con1.createStatement();

																String username = (String) session.getAttribute("username");

																ResultSet rs1 = stmt1.executeQuery(
																		"Select distinct v_regNo from vehicle where vehicleowner_vo_id =(select vo_id from vehicleowner where users_user_id = (select user_id from users where username = '"
																				+ username + "')) ");
																while (rs1.next()) {
															%>
															<option value="<%=rs1.getString("v_regNo")%>"><%=rs1.getString("v_regNo")%></option>
															<%
																}
															%>
														</select>

													</div>
													<!-- /controls -->
												</div>
												<!-- /control-group -->

												<div class="control-group">
													<label class="control-label" for="regNo">Parking
														Space</label>
													<div class="controls">
														<select name='parkingname'>
															<option value="none">Select</option>
															<%
																Connection con2 = DBConnection.createConnection();
																Statement stmt2 = con2.createStatement();
																ResultSet rs2 = stmt2.executeQuery("Select distinct p_name from parking");
																while (rs2.next()) {
															%>
															<option value="<%=rs2.getString("p_name")%>"><%=rs2.getString("p_name")%></option>
															<%
																}
															%>
														</select>

													</div>
													<!-- /controls -->
												</div>
												<!-- /control-group -->

												<div class="control-group">
													<label class="control-label" for="entry">Entry
														Date and time</label>
													<div class="controls">
														<input type="datetime-local" class="span6" id="entry"
															name="entry">
													</div>
													<!-- /controls -->
												</div>
												<!-- /control-group -->

												<div class="control-group">
													<label class="control-label" for="exit">Exit Date
														and time</label>
													<div class="controls">
														<input type="datetime-local" class="span6" id="exit"
															name="exit">
													</div>
													<!-- /controls -->
												</div>
												<!-- /control-group -->

												<div class="form-actions">
													<button type="submit" class="btn btn-primary" id="submit">Save</button>
													<button class="btn" type="reset">Reset</button>
												</div>
											</fieldset>
										</form>
									</div>




								</div>

							</div>
							<!-- /widget-content -->

						</div>
						<!-- /widget -->

					</div>
					<!-- /span8 -->

				</div>

			</div>

		</div>
		<!-- /main-inner -->

	</div>
	<!-- /main -->

	<!-- footer -->
	<jsp:include page="./footer.jsp" />
	<!-- /footer -->

	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/base.js"></script>
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
