<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

</style>

</head>
<body>
<jsp:include page="public2.jsp"/>
<div class='maindiv'>
<%
	
	
	try{  
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from patient  where patient_id="+session.getAttribute("user")+" ");
		if(rs.next())
		{  
			
			out.print("<div class='mydiv'>");
			out.print("Patient Id : &nbsp;&nbsp;"+rs.getString("patient_id")+"<br><br><br>" );
			out.print("Patient Name : &nbsp;&nbsp; " +rs.getString("patient_name")+"<br><br><br>");
			out.print("Patient Address : &nbsp;&nbsp; " + rs.getString("patient_add")+"<br><br><br>");
			
			out.print("DOB :&nbsp;&nbsp; "+rs.getString("dob")+"</div>");
		}
	}
	catch(Exception e)
	{ 
		
	}
%>



</div> 

</body>
</html>