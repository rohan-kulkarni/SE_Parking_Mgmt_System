<!-- Harnish -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mvc.util.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Parking Space</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">

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
		/* $.ajax({
			type : 'GET',
			url : 'ViewParkinSpace',
			success : function(response) {
				if (response != null)
					$('#parkingSpace').html(response);
				else
					$('#msg').html("No Parking Space Added Yet");
			},
			failure : function(error) {
				console.log(error)
			}
		}); */

		function addVehicle() {
			var offSlots = $('#offSlots').val();
			console.log(offSlots);
		}
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
				<div class="content clearfix">
					<!-- /widget -->
					<form action="AddSpace" method="post">

						<h1>Add New Space</h1>

						<div class="login-fields">

							<p>Please provide your details</p>
							<div class="field">
								<label for="pName">Parking Name</label> <input type="text"
									id="pName" name="pName" value="" placeholder="Parking Name"
									class="login username-field" pattern="[A-Za-z ]{2,}" required />
							</div>

							<div class="field">
								<label for="address">Address</label> <input type="text"
									id="address" name="address" value="" placeholder="Address"
									class="login username-field" required />
							</div>

							<div class="field">
								<label for="city">City</label> <input type="text" id="city"
									name="city" value="" placeholder="City"
									class="login username-field" pattern="[A-Za-z ]{2,}" required />
							</div>

							<div class="field">
								<label for="state">State</label> <input type="text" id="state"
									name="state" value="" placeholder="State"
									class="login username-field" pattern="[A-Za-z ]{2,}" required />
							</div>

							<div class="field">
								<label for="zipcode">Zip code</label> <input type="number"
									id="zipcode" name="zipcode" value="" placeholder="Zip Code"
									class="login username-field" min="11111" max="99999" required />
							</div>
							<div class="field">
								<label for="oTime">Open Time</label> <input type="text"
									id="oTime" name="oTime" value="" placeholder="HH:MM"
									class="login username-field" required />
							</div>
							<div class="field">
								<label for="cTime">Close Time</label> <input type="text"
									id="cTime" name="cTime" value="" placeholder="HH:MM"
									class="login username-field" required />
							</div>
						</div>
						<!-- /login-fields -->
						<input id="allVehicles" name="allVehicles" type="hidden" value="">

						<div class="login-actions">
							<button type="button" class="btn btn-info" data-toggle="modal"
								data-target="#myModal">Add Vehicle Spaces</button>
							<button style="float: left; margin-top: 50px;" id="addSpaces"
								class="button btn btn-success btn-large" disabled="true">Add Space</button>
						</div>
						<!-- .actions -->

					</form>

					<!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Parking Spaces</h4>
								</div>
								<div class="modal-body">
									<div class="field">
										<label for="vehicleType">Vehicle Type</label> <select
											id="vehicleType" name="vehicleType" class="select-input">
											<option value="2-wheel">2-wheel</option>
											<option value="4-wheel">4-wheel</option>
											<option value="truck">Truck</option>
										</select>
										<!-- Online -->
										<div class="field">
											<label for="onSlots">Total Online Slots</label> <input
												type="number" id="onSlots" name="onSlots" value=""
												placeholder="Total Online Slots" class="" min="1" max="999"
												required />
										</div>
										<div class="field">
											<label for="onCharge">Online Charges</label> <input
												type="number" id="onCharge" name="onCharge" value=""
												placeholder="Online Charges" min="1" max="999" required />
										</div>
										<!-- Offline -->
										<div class="field">
											<label for="offSlots">Total Offline Slots</label> <input
												type="number" id="offSlots" name="offSlots" value=""
												placeholder="Total Offline Slots" min="1" max="999" required />
										</div>
										<div class="field">
											<label for="offCharge">Offline Charges</label> <input
												type="number" id="offCharge" name="offCharge" value=""
												placeholder="Offline Charges" min="1" max="999" required />
										</div>
										<!-- Tax -->
										<div class="field">
											<label for="tax">Tax in %</label> <input type="number"
												id="tax" name="tax" value="" placeholder="Tax in %" min="1"
												max="99" required />
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal" onclick="addVehicle()">Add</button>
									</div>
								</div>
							</div>
						</div>
					</div>



					<!-- /widget -->
					<!-- /widget -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>


	<!-- /Main -->


	<!-- footer -->
	<jsp:include page="./footer.jsp" />
	<!-- /footer -->
	<script type="text/javascript">
		var vehicles = [];
		function addVehicle() {
			console.log('asdasdasd');
			var onSlots = $('#onSlots').val();
			var onCharge = $('#onCharge').val();
			var offSlots = $('#offSlots').val();
			var offCharge = $('#onCharge').val();
			var tax = $('#tax').val();
			var e = document.getElementById("vehicleType");
			var vType = e.options[e.selectedIndex].value;
			var obj = {
				'VehicleType' : vType,
				'OnlineCharges' : onCharge,
				'AvailableOnlineSlots' : onSlots,
				'AvailableOfflineSlots' : offCharge,
				'OfflineCharges' : offSlots,
				'Tax' : tax
			}
			vehicles.push(obj);
			console.log(JSON.stringify(vehicles));
			if (vehicles.length > 0) {
				document.getElementById('addSpaces').disabled = false;
				$('#allVehicles').val(JSON.stringify(vehicles));
			}

		}
	</script>

	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/excanvas.min.js"></script>
	<script src="js/base.js"></script>
	<script src="js/chart.min.js" type="text/javascript"></script>
	<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
</body>
</html>