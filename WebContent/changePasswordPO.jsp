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


</head>
<body>
	<!-- navbar -->
	<jsp:include page="./parkingHeader.jsp" />
	<!-- /navbar -->


	<!-- Main -->
	<div class="account-container">
		<h2 align="center">
			<strong>Change password </strong>
		</h2>
		<div class="content clearfix">
			<script language="javascript">
				function fncSubmit() {

					if (document.ChangePasswordForm.OldPassword.value == "") {
						alert('Please input old password');
						document.ChangePasswordForm.OldPassword.focus();
						return false;
					}

					if (document.ChangePasswordForm.newpassword.value == "") {
						alert('Please input Password');
						document.ChangePasswordForm.newpassword.focus();
						return false;
					}

					if (document.ChangePasswordForm.conpassword.value == "") {
						alert('Please input Confirm Password');
						document.ChangePasswordForm.conpassword.focus();
						return false;
					}

					if (document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value) {
						alert('Confirm Password Not Match');
						document.ChangePasswordForm.conpassword.focus();
						return false;
					}

					document.ChangePasswordForm.submit();
				}
			</script>
			<form name="ChangePasswordForm" method="post"
				action="processChangePWDPO.jsp" OnSubmit="return fncSubmit();">

				<table border="0" align="center" bgcolor="#2B60DE">

					<tr>
						<td>Old Password</td>
						<TD><input name="OldPassword" type="password" id="OLDpwd"
							size="20" required></td>
					</tr>
					<tr>
						<td>NewPassword</td>
						<td><input name="newpassword" type="password"
							id="newpassword" required></td>
					</tr>
					<tr>
						<td>Confirm Password</td>
						<td><input name="conpassword" type="password"
							id="conpassword" required></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><button class="btn btn-primary" type="submit" name="Submit">Save</button></td>
					</tr>

				</table>
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
	<script>
		$(document).ready(function() {

			$(".mainnav li").removeClass("active");
			$("#change_password").addClass("active");

		});
	</script>
</body>
</html>