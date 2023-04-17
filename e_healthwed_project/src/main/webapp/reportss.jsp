<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=url('https://fonts.googleapis.com/css2?family=Ubuntu&display=swap')>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.div3{
	position: absolute;
    top:95px;
    left:205px;
    height:100px;
	width:1000px;
	padding-left:80px;    
}
.alink{
	display:inline-block;
	padding:15px;
	margin:15px;
	font-size:20px;
	font-family: 'Ubuntu', sans-serif;
	text-decoration: none;
}


</style>
</head>
<body>
<jsp:include page="font_page.jsp"></jsp:include>
<div class="div3">
<a class="alink" href="patient_report_div.jsp" >Patient Reports</a>|
<a class="alink" href="doctor_report_div.jsp">Doctor Reports</a>|
<a class="alink" href="disease_report_div.jsp">Disease Reports</a>|
<a class="alink" href="hospital_report_div.jsp">Hospital Reports</a> 
</div>
</body>
</html>