<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Parking Spaces</title>
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
        $('#ParkingSpaceContainer').jtable({
            title: 'Parking Space Details',
			sorting:true,
			paging:true,
			pagesize:10,
            actions: {
                listAction: 'ManageParkingSpaceServlet?action=list',
                updateAction: 'ManageParkingSpaceServlet?action=update',
                deleteAction: 'ManageParkingSpaceServlet?action=delete'
            },
            fields: {
                po_id: {
					title:'PO_id',
					list: false,
					edit: false,
					key: true
                },
 				po_name: {
	                    title: 'Parking Owner Name',
	                    width: '20%',
						edit: false
	            },
				po_state: {
		                    title: 'State',
		                    width: '10%',
							edit: false
		       },
				po_city: {
			                title: 'City',
			                width: '10%',
							edit: false
			    },
				p_id: {
				             title: 'Parking id',
							list: false,
							key: true
				},
				p_name: {
					         title: 'Parking Name',
					         width: '20%',
							edit: true
				},
				p_address: {
						      title: 'Address',
						      width: '20%',
							edit: true
				}
            }
        });     
		$('#ParkingSpaceContainer').jtable('load');
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
  </div>
</div>
<div style="width:80%;margin-right:10%;margin-left:10%;text-align:center;">
<div id="ParkingSpaceContainer"></div>
</div>
<jsp:include page="./footer.jsp"/>
</body>
</html>