<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{
 text-align:center;
}
.doctor_div{
		position: absolute;
    	top:200px;
    	left:380px;
    	width:550px;
		height:300px;
	     background-color: rgba(204,204,255,0.6);
		padding-left:20px;
		padding-top:20px;
		text-align:center;
		justify-content:center;
		font-size:20px;
		font-style:bold;

}
</style>
</head>
<body>
<jsp:include page="public2.jsp"></jsp:include>
<div class="doctor_div">


<h1>Find a Doctor by Specialisation</h1>
	<form action="all_doctor_of_same_specia.jsp" method="post">
		<label for="specialisation">Select Specialisation:</label>
		<select name="specialist">
	<%
	 try{  
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select DISTINCT specialization from doctors");
		while(rs.next())
		{ %>
    	<option value=<%=rs.getString("specialization")%>><%=rs.getString("specialization")%></option>
			<% 
		}
	}
	catch(Exception e)
	{ 	out.println(e);}
	%>
	</select>
		<br><br>
		<button type="submit">Search</button>
	</form>
 

</div>

</body>
</html>