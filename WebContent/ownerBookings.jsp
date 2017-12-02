<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bookings</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
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
			type : 'GET',
			url : 'ManagePOBookings',
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
		<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<!-- /widget -->
					<div class="widget widget-table action-table">
						<!-- /widget-header -->
						<div id="bookingTable">
							<h4 id="msg"></h4>
						</div>
						<!-- /widget-content -->
					</div>
				
					<!-- /widget -->
					<!-- /widget -->
				</div>
				<div class="row"></div>
				<!-- /span6 -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<script type="text/javascript">
		function deleteRecord(id) {
			$.ajax({
				type : 'GET',
				url : 'DeleteBookingRecord?Bid=' + id,
				success : function(response) {
					console.log('deleted');
					location.reload();
				},
				failure : function(error) {
					console.log(error)
				}
			});
		}
	</script>
	<!-- footer -->
	<jsp:include page="./footer.jsp" />
	<!-- /footer -->
</body>
</html>
