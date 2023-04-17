<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
*{
	margin:0px;
	padding:0px;
}
#div1{
    height:90px;
    width:1250px;
    
    text-align:center;
  	float:left;
    font-size:40px;
    background-color:rgb(0,128,128);
    color:white;
    text-decoration-line: underline;
   text-shadow: 2px 2px 9px black;
    
    }
#div2{
    height:600px;
    width:200px;
    
	float:left;
	background-color:rgb(176,224,230);
}

.hlink
{	
		width:200px;
		color:black;
		height:40px;
		margin-top:15px;
		margin-left:30px;
      	padding-top:20px;
      	font-size:25px;
      	font-style:italic;
      	display:block;
      	background-color:rgb(0,128,128);
      	box-shadow:8px 8px black;
      	border-radius:30px;
      	text-align:center;
      	text-decoration: none;
      	
      	}
       
a:hover{
		color:white;
		}
body {
  background-color:rgb(176,224,230);
 
}
h4{
	text-transform:uppercase;
	font-size:30px;
	float:left;
	margin-left:40px;
}
#btn{
	
	width:70px;
	heigth:50px;
	border:1px solid black;
	border-radius:3px;
	float:right;
	margin-right:35px;
	margin-top:-10px;
	padding:5px;
	font-size:20px;
	color:black;
}
btn:hover{
		color:white;
}
</style>
</head>
<body  >

<div id="div1">
		<h3 style="padding-top:5px;">
			DASHBOARD
		</h3>
		<h4> 
			<%=session.getAttribute("user") %>
		</h4>
		<a class="alink" id="btn" href="home_page.jsp">Logout </a>
		
</div>

<div id="div2">
<a class="hlink" href="patient.jsp" >Patients</a>
<a class="hlink" href="doctor.jsp">Doctors</a>
<a class="hlink" href="disease.jsp">Disease</a>
<a class="hlink" href="hospital.jsp">Hospital</a>
<a class="hlink" href="reportss.jsp">Report</a>

</div>
</body>
</html>