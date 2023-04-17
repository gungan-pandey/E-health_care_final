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
.div2{
	
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
	padding-top:20px;
	padding-right:400px;
	font-family: 'Ubuntu', sans-serif;
	text-decoration:none;
	text-shadow:3px 3px 9px black;
	letter-spacing: 4px;
	padding-top:20px;
	
	
}

table
{
	 font-family: 'Ubuntu', sans-serif;
	 padding-top:40px;
	 font-weight:bold;
	 margin-left:200px;
	 color:black;
}
input {
 
  padding: 6px 6px;
  
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
	ResultSet rs=st.executeQuery("select * from hospital where hospital_id="+id1);
	if(rs.next())
	{
%>

<jsp:include page="font_page.jsp"></jsp:include>

<div class="div2" style="background-color:rgb(72,209,204);"> 
<form action="update_hospital">
<table>
    
    <h1 style="margin-left:170px; color:white;">Hospital</h1>

	<tr>
	<td> <label for="hid"> Hospital ID :</label></td>
	<td><input type="text" id="hid" name="hid" value="<%=rs.getString("hospital_id")%>"></td>
	</tr>
	
	<tr>
	<td><label for="hname"> Hospital name :</label></td>
	<td><input type="text" id="hname" name="hname" value="<%=rs.getString("hospital_name")%>"></td>
	</tr>
	
	<tr>
	<td><label for="hadd"> Hospital address :</label></td>
	<td><input type="text" id="hadd" name="hadd"  value="<%=rs.getString("hospital_add")%>"></td>
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