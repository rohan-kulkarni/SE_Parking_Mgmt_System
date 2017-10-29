<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Parking Space</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<link href="css/metro/crimson/jtable.css" rel="stylesheet"
	type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"
	type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>

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
		var url_string = window.location;
		var url = new URL(url_string);
		var c = url.searchParams.get("id");
		console.log(c);
		$('#parkingSpaces').jtable({
			title : 'Anonymous User',
			actions : {
				listAction : 'EditParkingSpace?action=list&pId=' + c,
				createAction : 'EditParkingSpace?action=create&pId=' + c,
				updateAction : 'EditParkingSpace?action=update&pId=' + c,
				deleteAction : 'EditParkingSpace?action=delete&pId=' + c
			},
			fields : {
				vehicleType : {
					title : 'Vehicle Type',
					list : true,
					create : true,
					width : '30%'
				},
				onlineSlots : {
					title : 'Online Slots',
					width : '15%',
					edit : true
				},
				onlineCharge : {
					title : 'Online Charges',
					width : '15%',
					edit : true
				},
				offlineSlots : {
					title : 'Offline Slots',
					width : '15%',
					edit : true

				},
				offlineCharge : {
					title : 'Offline Charges',
					width : '15%',
					edit : true
				},
				tax : {
					title : 'Tax',
					width : '20%',
					edit : true
				},
				psId : {
					title : 'Parking Space ID',
					edit : false,
					list : false,
					key:true
				}
			}
		});
		$('#parkingSpaces').jtable('load');

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
				<div id="parkingSpaces"></div>
				<form action="editParkingSpace?action=deleteEntry&pId=0">
					<button type="submit" class="btn">Delete Parking Space</button>
				</form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>


	<!-- /Main -->


	<!-- footer -->
	<jsp:include page="./footer.jsp" />
	<!-- /footer -->
	<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
	<script src="js/jquery.jtable.js" type="text/javascript"></script>
</body>
</html>