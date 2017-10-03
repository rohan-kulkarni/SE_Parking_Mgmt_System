<%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Parking Space Approval</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<style>
   body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif;}
   body {font-size:16px;} 
</style>
</head>
<body>
<!-- navbar -->
	<jsp:include page="./adminHeader.jsp"/>
<!-- /navbar -->
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li><a href="adminDashboard.jsp"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
       <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-align-justify"></i><span>Manage</span> 
       <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li class="active"><a href="#">Vehicle Types</a> </li>
            <li class="active"><a href="#">Users</a> </li>
            <li class="active"><a href="#">User Types</a> </li>
            <li class="active"><a href="#">Vehicle Details </a> </li>
            <li class="active"><a href="#">Parking Spaces </a> </li>
          </ul>
        </li>
        <li  class="active"><a href="parkingSpaceApproval.jsp"><i class="fa fa-automobile"></i><span>Approve Parking Space</span></a> </li>
        <li><a href="#"><i class="fa fa-credit-card"></i><span>Tax Details</span></a> </li>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
<!-- /subnavbar -->
<div class="main">
    <div class="container">
	<div class="widget widget-table action-table">
            					<div class="widget-header"> <i class="icon-th-list"></i>
             						 <h3>Parking Space Approval Requests</h3>
            					</div>
            					<!-- /widget-header -->
            				<div class="widget-content">
              					<table class="table table-striped table-bordered">
                					<thead>
                  						<tr>
                    						<th  style="font-family: sans-serif;font-size: 13px;font-weight: bold;">Parking Owner Name</th>
                    						<th  style="font-family: sans-serif;font-size: 13px;font-weight: bold;"> Parking Name </th>
<!--                     						<th  style="font-family: sans-serif;font-size: 13px;font-weight: bold;"> Address </th> -->
<!--                     						<th  style="font-family: sans-serif;font-size: 13px;font-weight: bold;"> Approve Parking Space </th> -->
                  						</tr>
                					</thead>
                					<tbody>
                						<%Iterator itr;%>
                						<% List data= (List)request.getAttribute("data");
										for (itr=data.iterator(); itr.hasNext(); )
										{
										%>
                   						 <tr>
                    						<td> <%=itr.next()%> </td>
                  						  	<td> <%=itr.next()%> </td>
                   							<td><a href="#"> View</a> </td>
                 						 </tr> 
                 						 <%}%>  
                 						 <tr>
                    						<td> Riddhi </td>
                  						  	<td> Crossgates Mall </td>
                   							<td> 1400, Washington Ave, Albany </td>
                   							<td> <a href="#"> View</a>  </td>
                 						 </tr>          
                					</tbody>
              				</table>
            			</div>
            <!-- /widget-content --> 
          </div>



    </div>
</div>
<!-- /main -->
<!-- footer -->
	<jsp:include page="./footer.jsp"/>
<!-- /footer --> 
 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="js/jquery-1.7.2.min.js"></script>  
<script src="js/bootstrap.js"></script>
<script src="js/base.js"></script> 
</body>
</html>
