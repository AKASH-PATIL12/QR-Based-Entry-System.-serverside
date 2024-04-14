<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.cowshed.PanalDao" %>
    <%@ page import="java.sql.ResultSet" %>
	<%@ page import="java.sql.Timestamp" %>
	<%@ page import="java.time.Duration" %>
	<%@ page import="java.time.LocalDateTime" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_Panel</title>
 
 <link	 href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
 		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cabin+Sketch:wght@400;700&display=swap" rel="stylesheet">


<style type="text/css">
body{
	background: linear-gradient(90deg, #e994ef,#60846b22 80%);
}
.adminpanel{
	margin-bottom:20px;
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
nav div{
    color: rgb(44, 244, 244);
    text-decoration: underline;
    text-shadow: rgb(8, 7, 7) 1px 1px 4px;
    cursor: pointer;
    
}
.links{
    display: flex;
    gap: 20px;
}
.links a{
     color: white;
}
.date{
   font-family: "Comic Neue", cursive;
	box-shadow:  8px 8px 23px #9c9c9c,-8px -8px 23px #ffffff;
	margin: auto;
	padding:10px;
	height:fit-content;
	width:30%;
	margin:auto;
	border-radius:25px;
	 text-align: center;

}
form{
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin: 10px;
    padding: 10px;
 
  
}
</style>
</head>
<body >
<script 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
 			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>	
  
 			
    <div class="adminpanel">
        <nav>
            <div>
                <h3>🔥 ASP</h3>
            </div>
            <div class="links" >
                <a href="Panel.jsp"><h3>Home</h3></a>
                <a href="Donation.jsp"><h3>Doantion</h3></a>
            </div>
        </nav>
        
        <div class="date">
            <form action="selectDate" method="get">
                <div>
                    <label for="date">Select Date :</label>
                </div>
                <div>
                    <input class="form-control" type="date" value="date"  name="date" pattern="\d{4}-\d{2}-\d{2}" required><br>
                </div>
               <div>
                <input class="btn btn-primary" type="submit" value="Show Entries">
                <hr>
            	<h2 align="center">📜</h2>
               </div>

            </form>
        </div>
        </div>
        

        <div class="record">
            <table class="table table-success table-striped" border="1" align="center">
                <tr>
                    <th>Visitor Id</th>
                    <th>name</th>
                    <th>Phone no.</th>
                    <th>Email</th>
                    <th>Entry_Time</th> 
                    <th>Exit_Time</th>
                    <th>Date</th>
                    <th>Work_Hour(HH:MM)</th>
                    <!-- <th colspan="2">Action</th> -->    
                </tr>
                
                
                <%
                PanalDao pd = new PanalDao();
                String date = (String) request.getAttribute("date1");
                ResultSet rs =  pd.selectDate(date);
                
				while(rs.next()) { 
				 	
				 %>
				 
                <tr>
                    
                    <td><%= rs.getInt("eid") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getInt("phno") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getTime("etime") %></td>
                    <td><%= rs.getTime("extime") %> </td>
                    <td><%= rs.getDate("etime") %> </td>
                        
           
                
                    <%        
                    String workHours=" ";
                    
					if(rs.getDate("extime")==null){
						workHours="Not Exited";
					} else{
						// Convert Timestamp objects to LocalDateTime
	                   		LocalDateTime entryTime = rs.getTimestamp("etime").toLocalDateTime();
	                   		LocalDateTime exitTime = rs.getTimestamp("extime").toLocalDateTime();
	                   
	                  
	                    	// Calculate time difference
	                        Duration duration = Duration.between(entryTime, exitTime);
	                     	// Convert duration to hours, minutes, and seconds
	                        long hours = duration.toHours();
	                        long minutes = duration.toMinutesPart();
	                        long seconds = duration.toSecondsPart();
	                        String hoursString = String.valueOf(hours);
	                        String minutesString = String.valueOf(minutes);
	                        workHours= hoursString+":"+minutesString;
					}       
                    
                 	
                    
                    
                    %>
                    <td><%= workHours %></td>
                    <!-- <td><input type="button" value="delete"></td>
                    <td><input type="button" value="Edit"></td> -->
                
                 <% } %>
                 
         	   </tr>       
     	  </table>  
     	
        </div>
   
</body>
</html>