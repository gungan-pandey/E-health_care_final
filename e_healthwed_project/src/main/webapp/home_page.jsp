<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
*{
	margin:0px;
	padding:0px;
}
body{
	background-image:url("ehealth1.jpg");
	
}
#div1{
    height:99px;
    width:1270px;
    text-transform:uppercase;
    text-align:center;
  	float:left;
    font-size:30px;
     background: #33475B;
    color:white;
    text-decoration-line: underline;
    text-shadow: 2px 2px 9px black;
    opacity:0.4;
    
    }
h4{
	margin-top:26px;
    color: rgba(234, 240, 246, 0.8);
    
    text-align: center;
}
button{
	margin-top:200px;
	height:170px;
	width:170px;
	border:1px solid black;
	background-color:rgb(176,196,222);
	padding:20px;
	border-style: outset;
	border-radius: 150px;
	margin-left:30px;
	font-weight:bold;
}
button:hover{
		color:white;
		}

</style>
</head>
<body >
<div id='div1'><h4>E-Health Management System</h4></div>

<a  href="doctor_login.jsp"><button id="b1"><i class="fa fa-user-md" style="font-size:80px;"></i><br><br>Doctor login</button></a>
<a  href="admin_login.jsp"><button id ="b2"><i class="fas fa-user-alt" style="font-size:80px;"></i><br><br>Admin login</button></a>
<a  href="public.jsp"><button id ="b3"><i class="fas fa-users" style="font-size:85px;"></i><br><br>Public</button></a>
</body>
</html>