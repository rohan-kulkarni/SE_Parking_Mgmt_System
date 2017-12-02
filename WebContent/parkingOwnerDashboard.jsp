<!-- RAHUL -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Parking Owner Dashboard</title>
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
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/base.js"></script>
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
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : 'POST',
			url : 'ParkingOwnerDashboard',
			success : function(response) {
				if (response != null)
					console.log(response)
			},
			failure : function(error) {
				console.log(error)
			}
		});
		$.ajax({
			type : 'GET',
			url : 'ViewBookingsPO',
			success : function(response) {
				$('#bookingTable').html(response);
				console.log(response);
			},
			failure : function(error) {
				console.log(error)
			}
		});
	});
</script>
</head>
<body>
	<!-- navbar -->
	<jsp:include page="./parkingHeader.jsp" />
	<!-- /navbar -->
	<%
		request.getAttribute("user_id");
	%>
	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="span6">
						<div class="widget widget-nopad">
						<p>Your Parking Space will be subject to verification. Please submit the documents to<b> SE_team5project@gmail.com</b></p>
						</div>

					</div>

					<!-- /widget -->
					<div id="anonymomusUser">
					
					</div>
						<div id="bookingTable">
							<h4 id="msg"></h4>
						</div>
					<!-- /widget -->
					<!-- /widget -->
				</div>
				<!-- /span6 -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /main-inner -->

	<!-- footer -->
	<jsp:include page="./footer.jsp" />
	<!-- /footer -->

	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/excanvas.min.js"></script>
	<script src="js/base.js"></script>
	<script src="js/chart.min.js" type="text/javascript"></script>
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/base.js"></script>
	<!-- /Calendar -->
</body>
</html>
