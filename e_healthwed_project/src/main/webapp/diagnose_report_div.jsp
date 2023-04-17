<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style>
.doctor_div{
    position: absolute;
    top:180px;
    left:150px;
    height:600px;
	width:950px;
	padding-left:80px;
	justify-content: center;
			}
table{
    margin-top:50px;
    margin-left:-35px;
}
td{
		padding:10px;
		margin:1px;
		text-align:center;
		
}

</style>

</head>
<body>
<jsp:include page="doctor_dashboard.jsp"></jsp:include>
<div class="doctor_div" style="background-color:rgb(60,179,113);">
<%

try{  
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from diagnose");
	out.println("<table id='customers' border=1 width='600'><tr>");
	out.println("<td><h3>diagnose_id</h3></td>");
	out.println("<td><h3>dignose_date</h3> </td>");
	out.println("<td><h3>disease_id</h3></td>");
	out.println("<td><h3>meds</h3></td>");
	out.println("<td><h3>patient_id</h3></td>");
	out.println("<td><h3>hospital_id</h3></td>");
	out.println("<td><h3>doctors_id</h3></td>");
	out.println("<td><h3>remarks</h3></td></tr>");
	while(rs.next())
	{
		out.print("<tr><td> "+rs.getString("diagnose_id")+" "+"     </td>" );
		out.print("<td> "+rs.getString("dignose_date")+" "+"  </td>");
		out.print("<td> "+rs.getString("disease_id")+" "+"  </td>");
		out.print("<td> "+rs.getString("meds")+" "+"  </td>");
		out.print("<td> "+rs.getString("patient_id")+" "+"  </td>");
		out.print("<td> "+rs.getString("hospital_id")+" "+"  </td>");
		out.print("<td> "+rs.getString("doctors_id")+" "+"  </td>");
		out.print("<td> "+rs.getString("remarks")+"\n\n"+    "</td></tr>");
	}
}
catch(Exception e)
{ 
	
} 
%>
</div>


</body>
</html>