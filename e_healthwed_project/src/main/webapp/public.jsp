<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
*{
	margin:0px;
	padding:0px;
}
.doctor_div{
    position: absolute;
	padding-left:20px;
	justify-content: center;

	}
table{
    margin-top:50px;
    margin-left:50px;
}
td{
		padding:10px;
		margin:10px;
		text-align:center;
}

.mydiv
{ border:1px solid black;
		border-radius:10px;
		margin-top:20px;
		top:10px;
		height:150px;
		width:150px;
		padding:4px;
		float:left;
		margin:4px;
		text-transform:uppercase;
}
.maindiv{
	margin-top:50px;
	width:100%;
}
h2{
    text-align:center;
   text-transform:uppercase;
    padding:5px;
    margin:10px;
    margin-top:20px;
}
#btn{
	width:70px;
	heigth:50px;
	border-radius:3px;
	float:right;
	margin-right:25px;
	margin-top:-40px;
	padding:5px;
	font-size:20px;
	text-decoration:none
}
btn:hover{
		background-color:blue;
}
</style>
</head>
<body style="background-color:#FFE4E1;">

<div class="doctor_div">

<h2>Doctor Details</h2>
<a id="btn" href="home_page.jsp">Back</a>
<hr>
<%
try{  
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("Select doctors.doctor_id, doctors.doctor_name, doctors.specialization, doctors.year_of_joining, hospital.hospital_name From admin_login,diagnose Inner Join disease On diagnose.disease_id = disease.disease_id Inner Join doctors On diagnose.doctors_id = doctors.doctor_id Inner Join hospital On diagnose.hospital_id = hospital.hospital_id Inner Join patient On diagnose.patient_id = patient.patient_id Group By doctors.doctor_name, doctors.specialization, doctors.year_of_joining, hospital.hospital_name");
	out.println("<div class='maindiv'>");
	
	while(rs.next())
	{
		out.print("<div class='mydiv'>");
		out.print(rs.getString("doctors.doctor_name")+"<br>" );
		out.print(rs.getString("doctors.specialization")+"<br>");
		out.print(rs.getString("doctors.year_of_joining")+"<br>");
		out.print(rs.getString("hospital.hospital_name")+"<br><br>");
		out.print("<td><a href='doctor_details.jsp?val="+rs.getInt("doctors.doctor_id")+"'> Details.. </a></div>");
		
	}
	out.println("</div>");
}
catch(Exception e)
{ 
} 
%>
</div>
</body>
</html>