<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Dashboard</title>
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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
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
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#entryTimeOnline').hide();
		$.ajax({
			type : 'GET',
			url : 'AnonymousUser',
			success : function(responseText) {
				$('#responseNote').html(responseText);
			}
		});
		$('#searchBooking').click(function() {
			var bid = $('#bookingId').val();
			$.ajax({
				type : 'GET',
				url : 'SearchBookingServlet',
				data : {
					booking_id : bid
				},
				success : function(responseText) {
					$('#searchedBooking').html(responseText);
					$('#entryTimeOnline').show();
				}
			});
		});
		$('#submit123').click(function() {
			var uname = $('#username').val();
			var mobile = $('#mobile').val();
			var regNum = $('#regNum').val();
			var vehicleType = $('#vehicleType').val();
			console.log(uname);
			console.log(mobile);
			console.log(regNum);
			console.log(vehicleType);
			$.ajax({
				type : 'POST',
				url : 'AnonymousUser',
				data : {
					name : uname,
					mobile_number : mobile,
					RegistrationNo : regNum,
					type : vehicleType
				},
				success : function(responseText) {
					console.log(responseText);
				},
				failure : function(error) {
					console.log(error);
				}
			});
		});
		$('#entryTimeOnline').click(function() {
			var bid = $('#bookingId').val();
			alert(bid);
			$.ajax({
				type : 'GET',
				url : 'OnlineBookingEntry',
				data : {
					bookingid : bid
				},
				success : function(responseText) {
					$('#searchedBooking').html(responseText);
				},
				failure : function(error) {
					console.log(error);
				}
			});
		});
	});
</script>
</head>
<body>
	<!-- navbar -->
	<jsp:include page="./anonymousHeader.jsp" />
	<!-- /navbar -->

	<div class="main">

		<div class="main-inner">

			<div class="container">

				<div class="row">

					<div class="span12">

						<div class="widget ">

							<div class="widget-header">
								<i class="icon-user"></i>
								

									<%
												int id =Integer.parseInt((String)session.getAttribute("user_id"));
												Connection con1 = DBConnection.createConnection();
												Statement stmt1 = con1.createStatement();
												ResultSet rs1 = stmt1.executeQuery("Select parking.P_name from parking,anonymoususer,users where anonymoususer.Parking_P_id=parking.P_id and anonymoususer.Users_user_id=users.user_id and users.user_id="+id);
												rs1.next();
												String P_name=rs1.getString("P_name");
									%>
							<h3><% out.println(P_name); %></h3>
							</div>
							<!-- /widget-header -->

							<div class="widget-content">

								<div class="tabbable">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#booking" data-toggle="tab">Booking</a></li>
										<li><a href="#onlineBooking" data-toggle="tab">Online
												Booking Time Entry</a></li>
										<li><a href="#parkingSlots" data-toggle="tab">Available
												Parking Slots</a></li>
									</ul>
									<br>

									<div class="tab-content">
										<div class="tab-pane active" id="booking">
											<form id="bookingForm" class="form-horizontal">
												<fieldset>

													<div class="control-group">
														<label class="control-label" for="username">Name</label>
														<div class="controls">
															<input type="text" class="span6 disabled" id="username">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<div class="control-group">
														<label class="control-label" for="mobile">Mobile
															Number</label>
														<div class="controls">
															<input type="text" class="span6" id="mobile">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<div class="control-group">
														<label class="control-label" for="regNum">Registration
															Number</label>
														<div class="controls">
															<input type="text" class="span6" id="regNum">
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label">Vehicle Type</label>
														<div class="controls">
															<select class="form-control" id="vehicleType">
																<option>Please Select Vehicle Type</option>
																<option>2-Wheeler</option>
																<option>4-Wheeler</option>
																<option>RV</option>
																<option>Truck</option>
															</select>

														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<br />
													<div class="form-actions">
														<button class="btn btn-primary" onclick="bookingCalled()">Save</button>
														<button class="btn">Reset</button>
													</div>
													<!-- /form-actions -->
												</fieldset>
											</form>
											<div id="responseNote"></div>
										</div>

										<div class="tab-pane" id="onlineBooking">

											<fieldset>
												<div class="control-group">
													<label class="control-label" for="bookingId">Booking
														ID</label>
													<div class="controls">
														<input type="text" class="span6 disabled" id="bookingId">
													</div>
													<!-- /controls -->
												</div>
												<!-- /control-group -->
												<div class="form-actions">
													<button id="searchBooking" class="btn btn-primary">Search
														Booking</button>
												</div>
												<!-- /form-actions -->

											</fieldset>
											<div id="searchedBooking"></div>
											<button id="entryTimeOnline" class="btn btn-primary">Entry
												Time</button>
										</div>

										<div class="tab-pane" id="parkingSlots">
											<%
												Connection con = DBConnection.createConnection();
												Statement stmt = con.createStatement();
												ResultSet rs = stmt.executeQuery("Select * from parkingspace");
												while (rs.next()) {
											%>
											<h3>
												Vehicle Type:<%=rs.getString("PS_vehicleType")%>
											</h3>
											<h5>-----------------------------------------------------------------</h5>
											<h4>
												Total Available Online Slots :<%=rs.getString("PS_AvailableOnlineSlots")%>
											</h4>
											<h4>
												Total Available Offline SLots:<%=rs.getString("PS_AvailableOfflineSlots")%>
											</h4>
											</br>
											<%
												}
											%>


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
				<!-- /row -->

			</div>
			<!-- /container -->

		</div>
		<!-- /main-inner -->

	</div>
	<!-- /main -->

	<!-- footer -->
	<jsp:include page="./footer.jsp" />
	<!-- /footer -->
	<script type="text/javascript">
		function bookingCalled() {
			var uname = $('#username').val();
			var mobile = $('#mobile').val();
			var regNum = $('#regNum').val();
			var vehicleType = $('#vehicleType').val();
			console.log(uname);
			console.log(mobile);
			console.log(regNum);
			console.log(vehicleType);
			$.ajax({
				type : 'POST',
				url : 'AnonymousUser',
				data : {
					name : uname,
					mobile_number : mobile,
					RegistrationNo : regNum,
					type : vehicleType
				},
				success : function(responseText) {
					console.log(responseText);
				},
				failure : function(error) {
					console.log(error);
				}
			});
		}
	</script>

	<!-- Placed at the end of the document so the pages load faster -->
	<!-- /Calendar -->
</body>
</html>
