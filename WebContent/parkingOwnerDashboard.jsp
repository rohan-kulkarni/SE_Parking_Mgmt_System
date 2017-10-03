<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Parking Owner Dashboard</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
		<link href="css/font-awesome.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="css/pages/dashboard.css" rel="stylesheet">
		<style>
   			body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif;}
   			body {font-size:16px;} 
   			.table thead th {font-size: large;font-weight: bold;text-align: center}
   			.table tbody td {font-size: medium;text-align: center}
		</style>
	</head>
	<body>
			<!-- navbar -->
			<jsp:include page="./parkingHeader.jsp"/>
			<!-- /navbar -->

			<div class="main">
 				 <div class="main-inner">
   					 <div class="container">
     					 <div class="row">
      						  <div class="span6">
        						  <div class="widget widget-nopad">
          							  <div class="widget">
            							<div class="widget-header"> <i class="icon-signal"></i>
             							<h3> Monthly Booking Statistics</h3>
            						  </div>
            						<!-- /widget-header -->
            						<div class="widget-content">
              							<canvas id="area-chart" class="chart-holder" height="250" width="538"> </canvas>
             							 <!-- /area-chart --> 
            						</div>
           							 <!-- /widget-content --> 
          							</div> 
           
         						 </div>
 
        					</div>
         
         					 <!-- /widget -->
         					 <div class="widget widget-table action-table">
            					<div class="widget-header"> <i class="icon-th-list"></i>
             						 <h3>Available Slots</h3>
            					</div>
            					<!-- /widget-header -->
            				<div class="widget-content">
              					<table class="table table-striped table-bordered">
                					<thead>
                  						<tr>
                    						<th> </th>
                    						<th colspan="2" style="font-weight: bold;"> 2-Wheeler </th>
                    						<th colspan="2" style="font-weight: bold;"> 3-Wheeler </th>
                    						<th colspan="2" style="font-weight: bold;"> 4-Wheeler </th>
                  						</tr>
                					</thead>
                					<tbody>
                 						 <tr>
                    						<td> Parking Space Name </td>
                  						  	<td> Online </td>
                   							<td> Offline </td>
                   							<td> Online </td>
                   							<td> Offline </td>
                   							<td> Online </td>
                   							<td> Offline </td>
                 						 </tr>
                 						 <tr>
                    						<td>  </td>
                  						  	<td>  </td>
                   							<td>  </td>
                   							<td>  </td>
                   							<td>  </td>
                   							<td>  </td>
                   							<td>  </td>
                 						 </tr>   
                 						 <tr>
                    						<td>  </td>
                  						  	<td>  </td>
                   							<td>  </td>
                   							<td>  </td>
                   							<td>  </td>
                   							<td>  </td>
                   							<td>  </td>
                 						 </tr>          
                					</tbody>
              				</table>
            			</div>
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
  <!-- /main-inner --> 

			<!-- footer -->
			<jsp:include page="./footer.jsp"/>
			<!-- /footer --> 
 
			<!-- Placed at the end of the document so the pages load faster --> 
			<script src="js/excanvas.min.js"></script> 
			<script src="js/base.js"></script> 
			<script src="js/chart.min.js" type="text/javascript"></script> 
			<script src="js/jquery-1.7.2.min.js"></script>  
			<script src="js/bootstrap.js"></script>
			<script src="js/base.js"></script> 
			<script>     

        var lineChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
				{
				    fillColor: "rgba(220,220,220,0.5)",
				    strokeColor: "rgba(220,220,220,1)",
				    pointColor: "rgba(220,220,220,1)",
				    pointStrokeColor: "#fff",
				    data: [65, 59, 90, 81, 56, 55, 40]
				},
				{
				    fillColor: "rgba(151,187,205,0.5)",
				    strokeColor: "rgba(151,187,205,1)",
				    pointColor: "rgba(151,187,205,1)",
				    pointStrokeColor: "#fff",
				    data: [28, 48, 40, 19, 96, 27, 100]
				}
			]

        }

        var myLine = new Chart(document.getElementById("area-chart").getContext("2d")).Line(lineChartData);


        var barChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
				{
				    fillColor: "rgba(220,220,220,0.5)",
				    strokeColor: "rgba(220,220,220,1)",
				    data: [65, 59, 90, 81, 56, 55, 40]
				},
				{
				    fillColor: "rgba(151,187,205,0.5)",
				    strokeColor: "rgba(151,187,205,1)",
				    data: [28, 48, 40, 19, 96, 27, 100]
				}
			]

        }    
    </script><!-- /Calendar -->
	</body>
</html>
