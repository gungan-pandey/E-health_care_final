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
.hospital_div{

    position: absolute;
    top:180px;
    left:350px;
    height:400px;
	width:770px;
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
	width: 770px; /* Set the width to match the doctor_div */
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
		padding:5px;
		margin:5px;
		text-align:center;
		
}

</style>
</head>
<body>
<jsp:include page="font_page.jsp"></jsp:include>
<jsp:include page="reportss.jsp"></jsp:include>
<div class="hospital_div" style="background-color:rgb(176,196,222);">
<%

try{  
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from hospital");
	out.println("<table id='customers' border=1><thead><tr>");
	out.println("<td><h3>Hospital ID</h3></td>");
	out.println("<td><h3>Hospital Name</h3> </td>");
	out.println("<td><h3>Hospital address</h3></td>");
	out.println("<td><h3>Delete/Edit </h3></td></tr></thead>");
	out.println("<tbody>");
	
	while(rs.next())
	{
		out.print("<tr><td> "+rs.getString("hospital_id")+" "+"     </td>" );
		out.print("<td> "+rs.getString("hospital_name")+" "+"  </td>");
		out.print("<td> "+rs.getString("hospital_add")+" "+"  </td>");
		out.print("<td><a href='hospitaldelete?val="+rs.getInt("hospital_id")+"'> Delete </a>");
		out.print("/ <a href='edit_hospital.jsp?val="+rs.getInt("hospital_id")+"'> Edit </a></td></tr>");
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