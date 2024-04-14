<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <title>Panel</title>
    <meta charset="UTF-8">
    <link	 href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
 		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Cabin+Sketch:wght@400;700&display=swap" rel="stylesheet">
    
    <style type="text/css">
body{
  	 background: linear-gradient(90deg, #e994ef,#60846b22 80%);
   }
nav{
	 font-family: "Cabin Sketch", sans-serif;
	 padding:25px;
	 text-align:left;
	 text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
	 background:linear-gradient(90deg, rgba(63,94,251,1) 0%, rgba(252,70,107,1) 75%);
	 border-radius:20px;
	 margin:20px;
	 color: white; 
	 display:flex;
	 flex-direction:row;
	 justify-content:space-between;
}
nav div{
    color: rgb(44, 244, 244);
    text-decoration: underline;
    text-shadow: rgb(8, 7, 7) 1px 1px 4px;
    cursor: pointer;
    
}
nav a{
color:white;
}

.panel_in{
    font-family: "Comic Neue", cursive;
	box-shadow:  8px 8px 23px #9c9c9c,-8px -8px 23px #ffffff;
	margin-left: 20px;
	padding:20px;
	height:fit-content;
	width:80%;
	border-radius:25px;
	 text-align: left;
	 margin-bottom:30px;
	 
}
.panel_out{
	font-family: "Comic Neue", cursive;
	box-shadow:  8px 8px 23px #9c9c9c,-8px -8px 23px #ffffff;
	margin-left: 20px;
	padding:20px;
	height:fit-content;
	width:80%;
	border-radius:25px;
	text-align: left;
}
.input{
    display: flex;
    flex-direction: column;
    gap: 20px;
}
.container{
	display:flex;
/* 	background:white; */
	width:100%;
}
.rightside{
/* background:red; */
width:50%;
margin-left:100px;
border:2px solid;
height:fit-content;
padding :30px;
border-radius:15px;
box-shadow:  8px 8px 23px #9c9c9c,-8px -8px 23px #ffffff;
}
.leftside{
/* background:yellow; */
width:50%;
margin-right:100px;

}
    </style>
    
</head>
<body>
<script 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
 			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>	
 			

    <nav>
        <div>
            <h3>🔥 ASP</h3>
        </div>
        <div >
<!--             <a href="adminPanel"><h3>AdminPanel</h3> </a>  -->
        </div>

    </nav>
    <div class="container">
    	<div class="leftside">
    	    <div class="panel_in">
        <form action="panelIn" method="post">
            <div class="input">
            	<h3>Time In : ➡</h3>
                <label for="file">import QR</label>
                <input class="form-control" type="file" value="Input Barcode" name="file">
                <input class="btn btn-primary" type="submit">
               <h3>${msg}</h3>
            </div>
           
        </form>
  
    </div>
    
       <div class="panel_out">
        <form action="panelOut" method="post">
            <div class="input">
            	<h3>Time Out :⬅</h3>
                <label for="file">import QR</label>
                <input class="form-control" type="file" value="Input Barcode" name="file">
                <input class="btn btn-primary" type="submit">
               <h3>${msg2}</h3>
            </div>
           
        </form>
  
    </div>
    </div>
    <div class="rightside" >
    	
    	 <form action="adminLogin" method="post">
            <div class="input">
            	<h3>Admin Panel</h3>
                <label for="uname">Admin Username:</label>
                <input class="form-control" type="text" placeholder="Admin User name" name="uname">
                
                <label for="pass">Password :</label>
                <input class="form-control" type="password" placeholder="password" name="pass">
                <input class="btn btn-primary" type="submit">
               <h3>${msg2}</h3>
            </div>
           
        </form>
    </div>
    </div>
    

</body>
</html>