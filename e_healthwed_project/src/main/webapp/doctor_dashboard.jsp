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
    height:99px;
    width:1270px;
    
    text-align:center;
  	float:left;
    font-size:30px;
    background-color:rgb(46,139,87);
    color:white;
    text-decoration-line: underline;
   text-shadow: 2px 2px 9px black;
    
    }
h4{
	text-transform:uppercase;
	font-size:30px;
	float:left;
	margin-left:40px;
}

body {
  background-color:rgb(144,238,144);
 
}
.div3{
	position: absolute;
    top:95px;
    left:180px;
    height:100px;
	width:1000px;
	padding-left:210px;    
}
.alink{
	display:inline-block;
	padding:15px;
	margin:15px;
	font-size:20px;
	font-family: 'Ubuntu', sans-serif;
	text-decoration: none;
}
#three{
	color:blue;
}
#three:hover{
	color:white;
}
#one:hover{
	color:black;
}
#two:hover{
	color:black;
}
#four:hover{
	color:black;
}
</style>
</head>
<body>
<div id="div1">
		<h3 style="padding-top:20px;">
			 DOCTOR DASHBOARD
		</h3>
		<h4> 
			<%="Dr. "+session.getAttribute("name") %>
		</h4>
</div>
<div class="div3">
<a class="alink" id="one" href="diagnose.jsp" >Diagnose</a>|
<a class="alink"  id="two" href="diagnose_report_div.jsp">Diagnosed patient</a>|
<a class="alink" id="four" href="patient_history.jsp">Patient History</a>|
<a class="alink" id="three" href="home_page.jsp"> Logout </a>
</div>
</body>
</html>