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
#imgdiv{
    position:absolute;
    top:100px;
	width:230px;
	height:230px;
	background-image:url("doctor_dummy.jpg");
	left:900px;
}
.mydiv{
		margin-top:10px;
		width:300px;
		height:200px;
		margin-left:50px;
		background-color:#FFEFD5;
		padding:5px;
		padding-top:10px;
}

#about{
		position:absolute;
        top:300px;
		margin:20px;
		margin-left:50px;
		width:800px;
		height:290px;		
		background-color:#FFEFD5;
}
#heading{
    
     background-color:#D2B48C;
     text-align:center;
     font-style:bold;

}
</style>
</head>
<body>

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
			%>
			<div id="heading"><h3>Details of Dr <%=rs.getString("doctors.doctor_name") %></h3><br><hr> </div> 
			<%
			out.print("<div class='mydiv'>");
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

<div id="imgdiv"> </div>     
<div id="about"><p><h2>About...</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.sunt in culpa qui officia deserunt mollit anim id est laborum.
				   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.sunt in culpa qui officia deserunt mollit anim id est laborum.
				   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.sunt in culpa qui officia deserunt mollit anim id est laborum.
				</p></div>

</div> 
</body>
</html>