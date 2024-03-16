<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Panel</title>
    <meta charset="UTF-8">
    <style type="text/css">
    	nav{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    padding: 5px;
    background:rgb(237, 150, 229) ;
    border-radius: 15px;
    height: 45px;
    margin-bottom:10px;
    border:2px solid black;
}
nav div{
    color: rgb(44, 244, 244);
    text-decoration: underline;
    text-shadow: rgb(8, 7, 7) 1px 1px 4px;
    cursor: pointer;
    
}

.panel{
    background: linear-gradient(180deg, #e994ef,#60846b22 60%);
    color: rgb(0, 0, 0);
    padding: 15px;
    margin: auto;
    border: 2px solid black;
    border-radius: 25px;
    width:40%;
}
.input{
    display: flex;
    flex-direction: column;
    gap: 20px;
}
input{
   
}
    </style>
    
</head>
<body>
    <nav>
        <div>
            <p>🔥 ASP</p>
        </div>
        <div >
            <p>Admin Panel</p>
        </div>

    </nav>
    <div class="panel">
        <form action="panel" method="get">
            <div class="input">
                <label for="file">Import a Barcode</label>
                <input type="file" value="Input Barcode" name="file">
                <input class="btn" type="submit">
               <h3>${msg}</h3>
            </div>
           
        </form>
    </div>
    
</body>
</html>