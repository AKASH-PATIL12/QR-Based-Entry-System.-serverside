<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.cowshed.DonationDao" %>
    <%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donation</title>

 <link	 href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Cabin+Sketch:wght@400;700&display=swap" rel="stylesheet">


<style type="text/css">
body{
	background: linear-gradient(90deg, #e994ef,#60846b22 80%);
}
nav{
	 font-family: "Cabin Sketch", sans-serif;
	 padding:25px;
	 text-align:left;
	 display:flex;
	 flex-direction:row;
	 justify-content:space-between;
	 text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
	 background:linear-gradient(90deg, rgba(63,94,251,1) 0%, rgba(252,70,107,1) 75%);
	 border-radius:20px;
	 margin:20px;
	 color: white; 
}
.total{
	background:green;
	height:fit-content;
	width:fit-content;
	padding:10px;
	border-radius:15px;
	margin:auto;
	color:white;
}
.record{
	margin-right:20px;
	margin-left:20px;
	border-radius:15px;
	
}
.table{
	border-radius:15px;
	
}

</style>
</head>
<body>
<script 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>	

<div class="donation">
<%
int total=0;
%>
	  <nav>
            <div>
                <h3>🔥 ASP</h3>
            </div>
            <div>
            	
                <h3>Donation Records</h3>
            </div>
        </nav>
        
        <div class="record">
            <table class="table table-success table-striped" border="1" align="center">
                <tr>
                    <th>Order Id</th>
                    <th>Donor name</th>
                    <th>Phone no.</th>
                    <th>Amount(Rs.)</th>
                    <th>Status</th>
                    <!-- <th colspan="2">Action</th> -->    
                </tr>
                
               <%
               		DonationDao dd = new DonationDao();
               		ResultSet rs = dd.fetchDonation();
               		
               		%>
               		<%
               		while(rs.next()){
              		 %>
				 
                <tr>
                    
                    <td><%= rs.getString("order_id")%> </td>
                    <td><%= rs.getInt("phno") %>  </td>
                     <td><%= rs.getInt("phno") %>  </td>
                    <td><%= rs.getInt("amount")/100 %>  </td>
         
                    <% total+=(rs.getInt("amount")/100);
            	
                    %>
                    <td><%= rs.getString("status") %>  </td>
				 <% } %>
				
         	   </tr>       
     	  </table>  
     	  <hr style="height:5px; background: black;">
     	  <div class="total">
     	  	<h3>Total Donation Amount : <%=total %> Rs.</h3>
     	  </div>
         </div>
</div>


</body>
</html>