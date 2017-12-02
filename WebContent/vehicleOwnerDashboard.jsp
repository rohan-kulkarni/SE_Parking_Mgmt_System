<!-- RAHUL -->
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="js/jquery-1.7.2.min.js"></script> 


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

body {
	font-size: 20px;
}

.btn-success, .btn-large {
	background-color: #49635c;
}

.navbar .container>.nav-collapse>ul>li>ul>li>a:hover {
	color: #ffffff;
	text-decoration: none;
	background-color: #609083;
}

.navbar-inner {
	height: 80px
}

ul.dropdown {
	background-color: white
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : 'POST',
			url : 'VehicleOwnerDashboard',
			success : function(responseText) {
				$('#BookingDetails').html(responseText);
			}
		});
	});
</script>
</head>
<body>

	<%
		if (session.getAttribute("username") == null) {

			response.sendRedirect("login.jsp");

		}
	%>

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

			<div id="BookingDetails"></div>
		</div>
		<!-- /main-inner -->




	</div>
	<!-- /main -->

	<!-- footer -->
	<jsp:include page="./footer.jsp" />
	<!-- /footer -->

</body>
</html>
