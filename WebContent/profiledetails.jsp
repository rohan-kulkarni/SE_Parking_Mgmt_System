<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Parking Owner Profile</title>
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

<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : 'GET',
			url : 'ViewProfile',
			success : function(responseText) {
				$('#responseNote').html(responseText);
			}
		});
	});
</script>


</head>
<body>
	<!-- navbar -->
	<jsp:include page="./parkingHeader.jsp" />
	<!-- /navbar -->


	<!-- Main -->


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