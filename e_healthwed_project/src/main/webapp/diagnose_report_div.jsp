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
    left:160px;
    height:400px;
	width:1000px;
	justify-content: center;
	background-color: rgb(176,196,222);
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
	width: 1000px; /* Set the width to match the doctor_div */
 	border-collapse: collapse;
}
thead {
  position: sticky;
  top: 0;
  background-color: #fff;
}
tbody {
  overflow-y: scroll;
  height: 300px; /* Adjust the height as needed */
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
	out.println("<table id='customers' border=1><thead><tr>");
	out.println("<td><h3>diagnose_id</h3></td>");
	out.println("<td><h3>dignose_date</h3> </td>");
	out.println("<td><h3>disease_id</h3></td>");
	out.println("<td><h3>meds</h3></td>");
	out.println("<td><h3>patient_id</h3></td>");
	out.println("<td><h3>hospital_id</h3></td>");
	out.println("<td><h3>doctors_id</h3></td>");
	out.println("<td><h3>remarks</h3></td></tr></thead>");
	out.println("<tbody>");
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
	out.println("</tbody>");
    out.println("</table>");
}
catch(Exception e)
{ 
	
} 
%>
</div>


</body>
</html>