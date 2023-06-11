<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

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

.mydiv{
		position: absolute;
    	top:200px;
		width:550px;
		height:300px;
		background-color:rgba(204,204,255,0.6);
		padding-left:20px;
		padding-top:20px;
		justify-content:center;
		font-size:20px;
		font-style:bold;
		
}


.maindiv{
	top:20px;
	justify-content: center;
	margin-left:380px;
	 
}
h3{
	text-align:center;
}
</style>
</head>
<body>
<jsp:include page="public2.jsp"/>
<div class='maindiv'>
<%
	int did = Integer.parseInt(request.getParameter("val"));
	
	try{  
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("Select doctors.doctor_name, doctors.year_of_joining, doctors.specialization, hospital.hospital_name, hospital.hospital_add, doctors.doctor_id From doctors Inner Join diagnose On diagnose.doctors_id = doctors.doctor_id Inner Join hospital On diagnose.hospital_id = hospital.hospital_id Where doctors.doctor_id="+did);
		if(rs.next())
		{  
			
			out.print("<div class='mydiv'>");
			%>
			<div id="heading"><h3>Details of Dr <%=rs.getString("doctors.doctor_name") %></h3><br><hr> </div> 
			<% 
			out.print("Doctor's Name : &nbsp;&nbsp;"+rs.getString("doctors.doctor_name")+"<br><br>" );
			out.print("Specialization : &nbsp;&nbsp; " +rs.getString("doctors.specialization")+"<br><br>");
			out.print("Year of joining : &nbsp;&nbsp; " + rs.getString("doctors.year_of_joining")+"<br><br>");
			out.print("Hospital Name : &nbsp;&nbsp; "+rs.getString("hospital.hospital_name")+"<br><br>");
			out.print("Hospital Address :&nbsp;&nbsp; "+rs.getString("hospital.hospital_add")+"</div>");
		}
	}
	catch(Exception e)
	{ 
		
	}
%>

</div> 
</body>
</html>