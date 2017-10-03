<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<title>Manage Anonymous User</title>
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
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/knockout/3.4.2/knockout-min.js"></script>
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
		anonymousUser = $.ajax({
			type : 'GET',
			url : 'ViewAnonymous',
			success : function(responseText) {
				$('#responseNote').html(responseText);
			}
		});
		/* 		$('#submit').click(function() {
		 var uname = $('#username').val();
		 var mobile = $('#mobile').val();
		 var regNum = $('#regNum').val();
		 var vehicleType = $('#vehicleType').val();
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
		 alert(responseText);
		 }
		 });
		 }); */
	});
</script>

</head>
<body>

	<!-- navbar -->
	<jsp:include page="./parkingHeader.jsp" />
	<!-- /navbar -->


	<!-- Main -->

	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<!-- /widget -->
					<div class="widget widget-table action-table">
						<div class="widget-header">
							<i class="icon-th-list"></i>
							<h3>All Anonymous User</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content">
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th style="font-weight: bold;">Parking Space
											Name</th>
										<th style="font-weight: bold;">Name</th>
										<th style="font-weight: bold;">Email</th>
										<th style="font-weight: bold;">Contact No</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Star Bazar</td>
										<td>John Doe</td>
										<td>john@doe.com</td>
										<td>9999999999</td>
										<td><button class="btn btn-primary">Login</button></td>
									</tr>
									<tr id="responseNote">

									</tr>
								</tbody>
							</table>
						</div>
						<!-- /widget-content -->
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


	<!-- /Main -->


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

</body>
</html>