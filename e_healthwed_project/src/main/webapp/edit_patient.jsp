<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
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
.div1{
	
	position: absolute;
    top:115px;
    left:280px;
    height:490px;
	width:870px;
	padding-left:70px;
	justify-content: center;
	
}
h1{
	text-align: center;
	padding-top:5px;
	padding-right:400px;
	font-family: 'Ubuntu', sans-serif;
	text-decoration:none;
	text-shadow:3px 3px 5px black;
	letter-spacing: 4px;
	padding-top:20px;
	
	
}

table
{
	 font-family: 'Ubuntu', sans-serif;
	 padding-top:0px;
	 font-weight:bold;
	 margin-left:80px;
	 color:black;
}
input {
 
  padding: 2px 3px;
  
}
td {
  padding-top: 10px;
  padding-bottom: 20px;
  padding-left: 30px;
  padding-right: 40px;
}
button
{
	height:30px;
	width:110px;
	background-color:DodgerBlue;
	color:white;
	border-style: outset;
	border-radius: 15px;
	margin-left:30px;
	font-weight:bold;
}

button:hover
{
	background-color:white;
	color:DodgerBlue;
	cursor: pointer;
}

</style>
</head>
<body>
<%
try{  
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
	Statement st=con.createStatement();
	int id1=Integer.parseInt(request.getParameter("val"));
	ResultSet rs=st.executeQuery("select * from patient where patient_id="+id1);
	if(rs.next())
	{
%>
<jsp:include page="font_page.jsp"></jsp:include>
<div class="div1" style="background-color:rgb(72,209,204);"> 
<form action="update_patient">
<table>
    <tr>
    <td colspan=2> <h1 style="margin-left:170px; color:white;">Patient</h1> </td>
	</tr>
	<tr>
	<td><label for="pid">Patient ID :</label></td>
	<td><input type="text" id="pid" name="pid" value="<%=rs.getString("patient_id")%>"></td>
	</tr>
	
	<tr>
	<td><label for="pname"> Patient Name :</label></td>
	<td><input type="text" id="pname" name="pname" value="<%=rs.getString("patient_name")%>"></td>
	</tr>
	
	<tr>
	<td><label for="padd">  Patient Address :</label></td>
	<td><input type="text" id="padd" name="padd" placeholder="padd" value="<%=rs.getString("patient_add")%>"></td>
	</tr>
	
	<tr>
	<td><label for="pcity">city :</label></td>
	<td><input type="text" id="pcity" name="pcity" placeholder="enter city"></td>
	</tr>
	
	<tr>
	<td><label for="pstate">state :</label></td>
	<td><input type="text" id="pstate" name="pstate" placeholder="pstate"></td>
	</tr>
	
	<tr>
	<td><label for="pdob">   DOB :</label></td>
	<td><input type="date" id="pdob" name="pdob" placeholder="pdob" value="<%=rs.getString("dob")%>"></td>
	</tr>
	
	<tr>
    <td><button type="submit">ADD</button></td>
	<td><button type="reset">RESET</button></td>
    </tr>

<%
	}
}
catch(Exception e){}
	
%>
</table>
</form>
</div>
</body>
</html>