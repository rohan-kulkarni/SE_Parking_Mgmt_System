<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

.jtable-title {
	background-color: #f3f0eb !important;
}

.jtable-title-text {
	color: #000 !important;
}

.jtable-toolbar-item {
	background-color: #f3f0eb !important;
	color: #000 !important;
}

.ui-widget-header {
	background: #f3f0eb url(images/ui-bg_highlight-soft_15_cc0000_1x100.png)
		50% 50% repeat-x !important;
	color: #000 !important;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		console.log('jjjj');
		$('#AnonymousUserContainer').jtable({
			title : 'Anonymous User',
			actions : {
				listAction : 'ViewAnonymous?action=list',
				createAction : 'ViewAnonymous?action=create',
				updateAction : 'ViewAnonymous?action=update',
				deleteAction : 'ViewAnonymous?action=delete'
			},
			fields : {
				parkingName:{
					title : 'Parking Space Name',
					list : true,
					edit:false,
					width : '20%',
					create : false
				},
				parkingNameList : {
					title : 'Parking Space Name',
					list:false,
					options: function(){
						var options = [];
						 
                        $.ajax({ //Not found in cache, get from server
                            url: 'GenerateList?array=parking',
                            type: 'POST',
                            dataType: 'json',
                            async: false,
                            success: function (data) {
                                options = data.Options;
                            }
                        });
                         
                        return options;
					}
					/* options : function(data) {
						if (data.source == 'list') {
							return 'GenerateList?array=parking';
						}
						return data.source.parkingName;
					}, */
				},
				fullName : {
					title : 'Full Name',
					width : '20%',
					edit : true
				},
				email : {
					title : 'Email',
					width : '20%',
					edit : false
				},
				password : {
					title : 'Password',
					list : true,
					type:'password',
					input : function(data) {
						return '<input type="password" name="password">'
					},
					width : '20%'
				},
				contactNo : {
					title : 'Contact Number',
					width : '20%',
					edit : true
				}
			}
		});
		$('#AnonymousUserContainer').jtable('load');
		function callLogin(email, password) {
			console.log(email);
			console.log(password)
			//document.location = 'LoginANonymous=' + id;
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
				<div class="row">
					<!-- /widget -->
					<div class="widget widget-table action-table">
						<!-- /widget-header -->
						<div id="AnonymousUserContainer"></div>
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
	<script src="js/bootstrap.js"></script>
	<script src="js/base.js"></script>
	<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
	<script src="js/jquery.jtable.js" type="text/javascript"></script>
	<script type="text/javascript">
		function nameOptions() {
		}
		function callLogin(email, password) {
			//document.location = 'LoginANonymous=' + id;
		}
		function myclick(table) {
			console.log('aaaaaa');
		}
	</script>
</body>
</html>