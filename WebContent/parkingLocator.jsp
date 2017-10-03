<!DOCTYPE html> 
<%@page import="java.sql.*"%>
<html lang="en">

<head>
<meta charset="utf-8">
		<title>Dashboard</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
		<link href="css/font-awesome.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="css/pages/dashboard.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
		<style>
   			body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif;}
   			body {font-size:16px;} 
   			.table thead th {font-size: large;font-weight: bold;text-align: center}
   			.table tbody td {font-size: medium;text-align: center}
		</style>
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
		<script type="text/javascript">
		    $(document).ready(function() {
		    	$.ajax({
	    			type : 'GET',
	    			url : 'Parkinglocator',
	    			success : function(responseText) {
	    				$('#responseNote').html(responseText);
	    			}
	    		});
		    	$('#submit').click(function() {
		    		var uname = $('#state').val();
		    		var mobile = $('#city').val();
		    		$.ajax({
		    			type : 'POST',
		    			url : 'Parkinglocator',
		    			data: {
		    				state : state,
		    				city : city,
		    				
		    			},
		    			success : function(responseText) {
		    				alert(responseText);
		    			}
		    		});
		    	});
    		});
		 
    	</script>
</head>
<body>
			<!-- navbar -->
			<jsp:include page="./vehicleOwnerHeader.jsp"/>
			<!-- /navbar -->
			
				<div class="main">
	
					<div class="main-inner">
					
					    <div class="container">
					
					      <div class="row">
					      	
					      	<div class="span12">      		
					     		
					      		<div class="widget ">
					     			
					      			<div class="widget-header">
					      				<i class="icon-user"></i>
					      				<h3>Parking Locator</h3>
					  				</div> <!-- /widget-header -->
										
									<div class="widget-content">
															
										<div class="tabbable">
													
										<br>
										
										<div class="tab-content">
				
				
											<form action="" method="post" class="form-horizontal">
												<table>
													<tr>
														<th for="state">State</th>
														<td>
													<select name="state" id="state" onchange="this.form.submit();">
														<option value="0">Select State</option>
														<%
														try{
															String Query = "Select distinct p_state from parking ";
															Class.forName("com.mysql.jdbc.Driver").newInstance();
															Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/se_pms", "root", "admin");
															Statement stm = conn.createStatement();
															ResultSet rs = stm.executeQuery(Query);
															while(rs.next())
															{
																%>
																<option value="<%=rs.getString("p_state")%>"><%= rs.getString("p_state") %></option>
																<%
															}
															
															
														}
														catch(Exception e)
														{
															e.printStackTrace();
														}
														
														%>
													
													</select>
													</td>
													</tr>
													<tr>
														<th for="city">City</th>
														<td>
															<select>
																<option value="0">Select City</option>
																<%
																
																try{
																	String query = "Select distinct p_city from parking where p_state=?";
																	Class.forName("com.mysql.jdbc.Driver").newInstance();
																	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/se_pms", "root", "admin");
																	PreparedStatement psmt = con.prepareStatement(query);
																	psmt.setString(1, request.getParameter("state"));
																	
																	ResultSet rs = psmt.executeQuery();
																	while(rs.next())
																	{
																		%>
																		<option value="<%=rs.getString("p_city")%>"><%=rs.getString("p_city")%> </option>
																		<% 
																		
																	}
																}
																catch(Exception e)
																{
																	e.printStackTrace();
																}
																
																%>
																
																
															</select>
														</td>
													</tr>
												</table>
												<div class="form-actions">
																<button type="submit" class="btn btn-primary" id="submit">Search</button> 
																<button class="btn">Reset</button>
															</div>
												
											</form>
												</div>
													
													
														
											  
											</div>
																	
										</div> <!-- /widget-content -->
											<div id="responseNote"></div>
									</div> <!-- /widget -->
						      		
							    </div> <!-- /span8 -->
						      	
						      	</div>
						      	
						      	</div>
						      	
						      	
						      </div> <!-- /row -->
						
						    </div> <!-- /container -->
						    
						</div> <!-- /main-inner -->
					    
					</div> <!-- /main -->
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

      
    </script><!-- /Calendar -->

</body>


</html>