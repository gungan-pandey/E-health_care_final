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
.disease_div{

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
<div class="disease_div" style="background-color:rgb(176,196,222);">
<%

try{  
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from disease");
	out.println("<table  id='customers' border=1 width='600'><tr>");
	out.println("<td><h3>Disease ID</h3></td>");
	out.println("<td><h3>Disease Name</h3> </td>");
	out.println("<td><h3>Delete/Edit </h3></td></tr>");
	while(rs.next())
	{
		out.print("<tr><td> "+rs.getString("disease_id")+" "+"     </td>" );
		out.print("<td> "+rs.getString("disease_name")+" "+"  </td>");
		out.print("<td><a href='deletedisease?val="+rs.getInt("disease_id")+"'> Delete </a>");
		out.print("/ <a href='edit_disease.jsp?val="+rs.getInt("disease_id")+"'> Edit </a></td></tr>");
	}
}
catch(Exception e)
{ 
	
} 
%>
</div>

</body>
</html>