<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style1.css">
<style>
.doctor_div{

    position: absolute;
    top:180px;
    left:290px;
    height:590px;
	width:770px;
	padding-left:80px;
	justify-content: center;
	
   

			}
table{
    margin-top:50px;
    margin-left:-35px;
}
td{
		padding:10px;
		margin:10px;
		text-align:center;
		
}



</style>
</head>
<body>
<jsp:include page="font_page.jsp"></jsp:include>
<jsp:include page="reportss.jsp"></jsp:include>
<div class="doctor_div" style="background-color:rgb(176,196,222);">
<%

try{  
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from doctors");
	out.println("<table  id='customers' border=1 width='600'><tr>");
	out.println("<td><h3>Doctor ID</h3></td>");
	out.println("<td><h3>Doctor Name</h3> </td>");
	out.println("<td><h3>Year of joining </h3></td>");
	out.println("<td><h3>specialization</h3></td>");
	out.println("<td><h3>Delete/Edit </h3></td></tr>");
	while(rs.next())
	{
		out.print("<tr><td> "+rs.getString("doctor_id")+" "+"     </td>" );
		out.print("<td> "+rs.getString("doctor_name")+" "+"  </td>");
		out.print("<td> "+rs.getString("year_of_joining")+" "+"  </td>");
		out.print("<td> "+rs.getString("specialization")+"\n\n"+    "</td>");
		out.print("<td><a href='doctordelete?val="+rs.getInt("doctor_id")+"'> Delete </a>");
		out.print("/ <a href='edit_doctor.jsp?val="+rs.getInt("doctor_id")+"'> Edit </a></td></tr>");
	}
}
catch(Exception e)
{ 
	
} 
%>
</div>
</body>
</html>