<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Users</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/metro/crimson/jtable.css" rel="stylesheet"
	type="text/css" />
<script src="js/jquery-1.7.2.min.js"></script>
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"
	type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<script src="js/base.js"></script>




<style>
.ui-widget-header {
	background: #609083 url(images/ui-bg_highlight-soft_15_cc0000_1x100.png)
		50% 50% repeat-x;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//initialize jTable
		$('#UserTableContainer1').jtable({
			title : 'Vehicle Owners',
			sorting : true,
			actions : {
				listAction : 'ManageVOServlet?action=list',
				updateAction : 'ManageVOServlet?action=update',
				deleteAction : 'ManageVOServlet?action=delete'
			},
			fields : {
				userid : {
					title : 'User Id',
					key : true,
					list : true,
					width : '10%'
				},
				fullName : {
					title : 'Full Name',
					width : '15%',
					edit : true
				},
				contact : {
					title : 'Contact',
					width : '10%',
					edit : true
				},
				email : {
					title : 'Email Id',
					width : '10%',
					edit : true
				},
				username : {
					title : 'User Name',
					width : '5%',
					list : false,
					edit : false
				},
				password : {
					title : 'Password',
					width : '5%',
					type : 'password',
					list : false,
					edit : false
				},
				address : {
					title : 'Address',
					width : '5%',
					list : false,
					edit : true
				},
				city : {
					title : 'City',
					width : '5%',
					list : false,
					edit : true
				},
				state : {
					title : 'State',
					width : '5%',
					list : false,
					edit : true
				},
				zip : {
					title : 'Zip Code',
					width : '5%',
					list : false,
					edit : true
				},
				type : {
					title : 'User Type',
					width : '10%',
					edit : true
				}
			}
		});
		$('#UserTableContainer1').jtable('load');
	});

	$(document).ready(function() {
		//initialize jTable
		$('#UserTableContainer2').jtable({
			title : 'Anonymous Users',
			sorting : true,
			actions : {
				listAction : 'ManageAUServlet?action=list',
				updateAction : 'ManageAUServlet?action=update',
				deleteAction : 'ManageAUServlet?action=delete'
			},
			fields : {
				userid : {
					title : 'User Id',
					key : true,
					list : true,
					width : '10%'
				},
				fullName : {
					title : 'Full Name',
					width : '15%',
					edit : true
				},
				contact : {
					title : 'Contact',
					width : '10%',
					edit : true
				},
				email : {
					title : 'Email Id',
					width : '10%',
					edit : true
				},
				username : {
					title : 'User Name',
					width : '5%',
					list : false,
					edit : false
				},
				password : {
					title : 'Password',
					width : '5%',
					type : 'password',
					list : false,
					edit : false
				},
				parkingname : {
					title : 'Parking Name',
					width : '15%',
					list : true,
					edit : true
				},
				type : {
					title : 'User Type',
					width : '10%',
					edit : true
				}
			}
		});
		$('#UserTableContainer2').jtable('load');
	});

	$(document).ready(function() {
		//initialize jTable
		$('#UserTableContainer').jtable({
			title : 'Parking Owners',
			sorting : true,
			actions : {
				listAction : 'ManageUserServlet?action=list',
				updateAction : 'ManageUserServlet?action=update',
				deleteAction : 'ManageUserServlet?action=delete'
			},
			fields : {
				userid : {
					title : 'User Id',
					key : true,
					list : true,
					width : '10%'
				},
				fullName : {
					title : 'Full Name',
					width : '15%',
					edit : true
				},
				contact : {
					title : 'Contact',
					width : '10%',
					edit : true
				},
				email : {
					title : 'Email Id',
					width : '10%',
					edit : true
				},
				username : {
					title : 'User Name',
					width : '5%',
					list : false,
					edit : false
				},
				password : {
					title : 'Password',
					width : '5%',
					type : 'password',
					list : false,
					edit : false
				},
				address : {
					title : 'Address',
					width : '5%',
					list : false,
					edit : true
				},
				city : {
					title : 'City',
					width : '5%',
					list : false,
					edit : true
				},
				state : {
					title : 'State',
					width : '5%',
					list : false,
					edit : true
				},
				zip : {
					title : 'Zip Code',
					width : '5%',
					list : false,
					edit : true
				},
				type : {
					title : 'User Type',
					width : '10%',
					edit : true
				},
				count : {
					title : 'No. of Parking Spaces',
					width : '10%',
					edit : false,
					create : false,
					list : true
				}
			}
		});
		$('#UserTableContainer').jtable('load');
	});
</script>
</head>
<body>
	<%
		if (session.getAttribute("username") == null) {

			response.sendRedirect("adminLogin.jsp");

		}
	%>
	<jsp:include page="./adminHeader.jsp" />
	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
					<li><a href="adminDashboard.jsp"><i class="fa fa-bars"></i><span>Dashboard</span>
					</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class="fa fa-cogs"></i><span>Manage</span>
							<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="manageVehicles.jsp">Vehicle Types</a></li>
							<li><a href="manageUsers.jsp">Users</a></li>
							<li><a href="manageVehicleDetails.jsp">Vehicle Details </a></li>
							<li><a href="manageParkingSpaces.jsp">Parking Spaces </a></li>
						</ul></li>
					<li><a href="approveParkingSpace.jsp"><i
							class="fa fa-automobile"></i><span>Approve Parking Space</span></a></li>
				</ul>
			</div>
			<!-- /container -->
		</div>
		<!-- /subnavbar-inner -->
	</div>
	<div
		style="width: 70%; margin-right: 15%; margin-left: 15%; text-align: center; margin-bottom: 65px;">
		<div id="UserTableContainer"></div>
		<br /> <br />
		<div id="UserTableContainer1"></div>
		<br /> <br />
		<div id="UserTableContainer2"></div>
	</div>
	<jsp:include page="./footer.jsp" />


</body>
</html>