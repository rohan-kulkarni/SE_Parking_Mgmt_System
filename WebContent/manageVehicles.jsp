<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Manage Vehicles</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/metro/crimson/jtable.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.2.min.js"></script>
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<script src="js/base.js"></script> 
<style>
.ui-widget-header {
background: #609083 url(images/ui-bg_highlight-soft_15_cc0000_1x100.png) 50% 50% repeat-x;
}
</style>
<script type="text/javascript">
    $(document).ready(function () {
        //initialize jTable
        $('#VehicleTableContainer').jtable({
            title: 'Table of Vehicles',
			sorting:true,
			paging:true,
			pagesize:10,
            actions: {
                listAction: 'ManageVehicleServlet?action=list',
                createAction:'ManageVehicleServlet?action=create',
                updateAction: 'ManageVehicleServlet?action=update',
                deleteAction: 'ManageVehicleServlet?action=delete'
            },
            fields: {
                vehicleType_id: {
					title:'Vehicle Type ID',
                    key: true,
                    list: true,
					create: true
                },
 				vehicleType: {
	                    title: 'Vehicle Type',
	                    width: '40%',
						edit: true
	                }
            }
        });     
		$('#VehicleTableContainer').jtable('load');
    });
</script>
</head>
<body>
			<%
				if(session.getAttribute("username")==null){
					
					response.sendRedirect("adminLogin.jsp");
					
				}
			
			%>
<jsp:include page="./adminHeader.jsp"/>
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li><a href="adminDashboard.jsp"><i class="fa fa-bars"></i><span>Dashboard</span> </a> </li>
       <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-cogs"></i><span>Manage</span> 
       <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="manageVehicles.jsp">Vehicle Types</a> </li>
            <li><a href="manageUsers.jsp">Users</a> </li>
            <li><a href="manageVehicleDetails.jsp">Vehicle Details </a> </li>
            <li><a href="manageParkingSpaces.jsp">Parking Spaces </a> </li>
          </ul>
        </li>
        <li><a href="approveParkingSpace.jsp"><i class="fa fa-automobile"></i><span>Approve Parking Space</span></a> </li>
         
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
<div style="width:80%;margin-right:10%;margin-left:10%;text-align:center;">
<div id="VehicleTableContainer"></div>
</div>
<jsp:include page="./footer.jsp"/>
</body>
</html>