<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@page import="java.sql.*"%>
<%@ page import="com.mvc.util.DBConnection"%>
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
	<div class="account-container">

		<div class="content clearfix">

			<form action="Update" method="post">
				<%
					//session.getAttribute("name");
					//String a = request.getParameter("username");
					String a = (String) request.getSession().getAttribute("username");

					try {

						Connection conn = DBConnection.createConnection();
						String query = "select * from parkingowner inner join users on users.user_id= parkingowner.PO_id where users.username= '" + a + "'";
						Statement st = conn.createStatement();
						ResultSet rs = st.executeQuery(query);

						while (rs.next()) {
				%>
				<input type="hidden" name="user_id" value="<%=rs.getString("PO_id")%>">

				<div class="login-fields">

					<div class="field">
						<label for="fullname">Full Name</label> <input type="text"
							id="fullname" name="fullname"
							value="<%=rs.getString("PO_fullName")%>" placeholder="Full Name"
							class="login username-field" pattern="[A-Za-z ]{2,}" required />
					</div>

					<!-- /field -->

					<!-- /password -->

					<!-- /select -->
					<div class="field">
						<label for="number">Contact Number</label> <input type="number"
							id="number" name="number"
							value="<%=rs.getString("PO_contactNo")%>"
							placeholder="Contact Number" class="login username-field"
							min="1111111111" max="9999999999" required />
					</div>

					<div class="field">
						<label for="address">Address</label> <input type="text"
							id="address" name="address"
							value="<%=rs.getString("PO_address")%>" placeholder="Address"
							class="login username-field" required />
					</div>

					<div class="field">
						<label for="city">City</label> <input type="text" id="city"
							name="city" value="<%=rs.getString("PO_city")%>"
							placeholder="City" class="login username-field"
							pattern="[A-Za-z ]{2,}" required />
					</div>

					<div class="field">
						<label for="state">State</label> <input type="text" id="state"
							name="state" value="<%=rs.getString("PO_state")%>"
							placeholder="State" class="login username-field"
							pattern="[A-Za-z ]{2,}" required />
					</div>

					<div class="field">
						<label for="zipcode">Zip code</label> <input type="number"
							id="zipcode" name="zipcode" value="<%=rs.getString("PO_zip")%>"
							placeholder="Zip Code" class="login username-field" min="11111"
							max="99999" required />
					</div>
				</div>
				<!-- /login-fields -->
				<%
					}
					} catch (Exception e) {
						out.print(e.getMessage());
						e.printStackTrace();

					}
				%>
				<div class="login-actions">

					<button type="submit" class="button btn btn-success btn-large">Update</button>

				</div>
				<!-- .actions -->

			</form>

		</div>
		<!-- /content -->

	</div>
	<!-- /account-container -->

	<!-- /Main -->


	<!-- footer -->
	<jsp:include page="./footer.jsp" />
	<!-- /footer -->

	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/excanvas.min.js"></script>
	<script src="js/chart.min.js" type="text/javascript"></script>

</body>
</html>