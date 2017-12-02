<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<link href="css/invoice.css" rel="stylesheet">
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
	$('#exitTime').hide();
	
	$('#exitVehicle').click(function() {
		//$('#invoice').hide();
		var vid = $('#vehicleId').val();
		$.ajax({
			type : 'GET',
			url : 'SearchVehicleServlet',
			data : {
				vehicle_id : vid
			},
			success : function(responseText) {
				//alert(responseText);
				$('#searchedBooking').html(responseText);
				//$('#bookingId').text(vid);
				$('#exitTime').show();
			}
		});
	});
	$('#exitTime').click(function() {
		var vid = $('#vehicleId').val();
		$.ajax({
			type : 'GET',
			url : 'AnonymousExitTime',
			data : {
				vehicle_id : vid
			},
			success : function(responseText) {
				//alert(responseText);
				$('#invoice').html(responseText);
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

<input type="hidden" id="bookingId">
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

								<div class="tab-pane" id="onlineBooking">
								
									<fieldset>
										<div class="control-group">
											<label class="control-label" for="bookingId">Vehicle
												Name</label>
											<div class="controls">
												<input type="text" class="span6" id="vehicleId">
											</div>
											<!-- /controls -->
										</div>
										<!-- /control-group -->
										<div class="form-actions">
											<button id="exitVehicle" class="btn btn-primary">Search</button>
										</div>
										<!-- /form-actions -->
										

									</fieldset>
									<div id="searchedBooking"> </div>
									<button id="exitTime" class="btn btn-primary">Exit Vehicle</button>
								</div>
								<div id ="invoice" class="invoice-box">
									
								</div>


							</div>
							<!-- /widget-content -->
						</div>
						<!-- /widget -->

					</div>
					<!-- /span8 -->


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

	<!-- /Calendar -->
</body>
</html>