<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.doctor_div{
	position: absolute;
    top:180px;
    left:350px;
    height:400px;
	width:770px;
	justify-content: center;
	
    overflow: auto;

}
body {
     overflow: hidden;
}
table{
    margin-top:0px
    margin-left: 35px;
    table-layout: fixed;
	padding-left:70px;
	width: 765px; /* Set the width to match the doctor_div */
 	border-collapse: collapse;
}
thead {
  position: sticky;
  top: 0;
  background-color: #fff;
}
tbody {
  overflow-y: scroll;
  height: 314px; /* Adjust the height as needed */
}
td{
		padding:10px;
		margin:10px;
		text-align:center;
		
}
</style>
</head>
<body>
<jsp:include page="public2.jsp"></jsp:include>
<div class="doctor_div" style="background-color:rgb(176,196,222);">
<%
   String  specialist = request.getParameter("specialist");
try{  
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from doctors where specialization='"+specialist+"'");
	out.println("<table  id='customers' border=1><thead><tr>");
	
	out.println("<td><h3>Doctor ID</h3></td>");
	out.println("<td><h3>Doctor Name</h3> </td>");
	out.println("<td><h3>Year of joining </h3></td>");
	out.println("<td><h3>specialization</h3></td></tr></thead>");
	
	out.println("<tbody>");
	while(rs.next())
	{
		out.print("<tr><td> "+rs.getString("doctor_id")+" "+"     </td>" );
		out.print("<td><a href='doctor_details.jsp?val="+rs.getString("doctor_id")+"'>"+ rs.getString("doctor_name")+" </a></td>");
		out.print("<td> "+rs.getString("year_of_joining")+" "+"  </td>");
		out.print("<td> "+rs.getString("specialization")+"\n\n"+    "</td>");
		
	}
	out.println("</tbody>");
    out.println("</table>");
}
catch(Exception e)
{ 
	
} 
%>



</body>
</html>