<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	$('#submit').click(function() {
    		var uname = $('#txtName').val();
    		var txtMobileNumber = $('#txtMobileNumber').val();
    		var txtRegistrationNo = $('#txtRegistrationNo').val();
    		var type = $('#ddlvalue').val();
    		$.ajax({
    			type : 'GET',
    			url : 'AnonymousUser',
    			data: {
    				name: uname,
    				mobile_number : txtMobileNumber,
    				RegistrationNo : txtRegistrationNo,
    				type : type
    			},
    			success : function(responseText) {
    				alert(responseText);
    				$('#ajaxGetUserServletResponse').html(responseText);
    			}
    		});
    	});
    });
    </script>
</head>
<body>
	<div>
                <h1>Booking</h1>

                <div>
                    <table class="table" cellpadding="5" id="BookingForm">
                        <tr height="5">
                            <td colspan="2"></td>
                        </tr>
                        <tr>

                            <td class="width170">Name:</td>
                            <td>
                                <input id="txtName" name="Name" type="text"/>
                            </td>
                        </tr>

                        <tr>
                            <td class="width170">Mobile Number:</td>
                            <td>
                                <input id="txtMobileNumber" name="MobileNumber" type="text" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td class="width170">Registration No:</td>
                            <td>
                                <input id="txtRegistrationNo" name="RegistrationNo"  type="text" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td class="width170">Vehicle Type:</td>
                            <td>
                                
                                <select id="ddlvalue" name="VehicleTypeID" >
                                	<option value="">Please select Vehicle Type</option>
									<option value="1">2 - Wheeler</option>
									<option value="2">3 - Wheeler</option>
									<option value="3">4 - Wheeler</option>
								</select>
                            </td>
                        </tr>
                        <tr>
                            <td class="height5" colspan="2">&nbsp;</td>
                        </tr>
                    </table>

                    <input type="button" value="Save" name="submit" id="submit" />
                    <div id="ajaxGetUserServletResponse"></div>

                </div>
            </div>
	
</body>
</html>