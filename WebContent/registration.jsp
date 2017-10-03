<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">

<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet"
	type="text/css" />

<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">

<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif;
}

body {
	font-size: 16px;
}

.btn-success, .btn-large {
	background-color: #49635c;
}
</style>

</head>
<body>

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">
				<a class="brand" href="index.html"> Parking Management System </a>

			</div>
			<!-- /container -->

		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->

	<div class="account-container">

		<div class="content clearfix">

			<form action="Registration" method="post">

				<h1>Registration</h1>

				<div class="login-fields">

					<p>Please provide your details</p>
					<div class="field">
						<label for="firstname">First Name</label> <input type="text"
							id="firstname" name="firstname" value="" placeholder="First Name"
							class="login username-field" pattern="[A-Za-z]{2,}" required />
					</div>

					<div class="field">
						<label for="lastname">Second Name</label> <input type="text"
							id="lastname" name="lastname" value="" placeholder="Last Name"
							class="login username-field" pattern="[A-Za-z]{2,}" required />
					</div>

					<div class="field">
						<label for="email">Email</label> <input type="email" id="email"
							name="email" value="" placeholder="Email"
							class="login username-field" required />
					</div>
					<!-- /field -->

					<div class="field">
						<label for="password">Password:</label> <input type="password"
							id="password" name="password" value="" placeholder="Password"
							class="login password-field" required />
					</div>
					<!-- /password -->

					<div class="field">
						<label for="loginType">Password:</label> <select id="loginType"
							name="loginType" class="select-input">
							<option value="#">Select type of user....</option>
							<option value="user">Vehicle Owner</option>
							<option value="owner">Parking Owner</option>
							<option value="anonymous">Parking Attendent</option>
						</select>
					</div>
					<!-- /select -->
					<div class="field">
						<label for="number">Contact Number</label> <input type="number"
							id="number" name="number" value="" placeholder="Contact Number"
							class="login username-field" min="1111111111" max="9999999999" required />
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
				</div>
				<!-- /login-fields -->

				<div class="login-actions">
					<a href="home.jsp" style="float: left;"
						class="">Have an account?</a>
					<button class="button btn btn-success btn-large">Register</button>
					<br /> <br /> Message: ${message} <br>
					<c:remove var="message" scope="session" />
				</div>
				<!-- .actions -->

			</form>

		</div>
		<!-- /content -->

	</div>
	<!-- /account-container -->

	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/bootstrap.js"></script>

	<script src="js/signin.js"></script>
</body>
</html>