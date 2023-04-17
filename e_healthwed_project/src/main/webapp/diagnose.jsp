<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=url('https://fonts.googleapis.com/css2?family=Ubuntu&display=swap')>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
*{
	margin:0px;
	padding:0px;
}
.div1{
	
	position: absolute;
    top:162px;
    left:220px;
    height:495px;
	width:800px;
	padding-left:70px;
	justify-content: center;
	
}
h1{
	text-align: center;
	padding-top:1px;
	padding-right:400px;
	font-family: 'Ubuntu', sans-serif;
	text-decoration:none;
	text-shadow:3px 3px 9px black;
	letter-spacing: 4px;
	
	
}

table
{
	 font-family: 'Ubuntu', sans-serif;
	 padding-top:25px;
	 font-weight:bold;
	 margin-left:100px;
	 color:black;
}
input {
 
  padding: 3px 3px;
  
}
td {
  padding-top: 10px;
  padding-bottom: 10px;
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
<jsp:include page="doctor_dashboard.jsp"></jsp:include>
<div class="div1" style="background-color:rgb(60,179,113);"> 
<form action="Add_Diagnose">
<table>
    <tr>
    <td colspan=2>
    <h1 style="margin-left:120px; color:white;">Disease</h1>
	</td>
	</tr>
	<tr>
    <td><label for="diaid"> Patient id :</label></td>
	<td><input type="text" id="diaid" name="diaid"></td>

	<tr>
	<td><label for="diadate"> Disease date :</label></td>
	<td><input type="date" id="diadate" name="diadate"></td>
	</tr>
	<tr>
	<td><label for="dianame">Disease name:</label></td>
	<td><select name="dianame">
	<%
	 try{  
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from disease");
		while(rs.next())
		{ %>
    	<option value=<%=rs.getString("disease_id")%>><%=rs.getString("disease_name")%></option>
			<% 
		}
	}
	catch(Exception e)
	{ 	out.println(e);}
	%>
	</select></td>
	</tr>
	<tr>
	<td><label for="diameds">meds. precribed</label></td>
	<td><textarea rows="3" cols="35" name="diameds"> </textarea></td>
	</tr>
	
    <tr>
    <td> <label for="diahospital">Hospital ID</label></td>
	<td><input type="text" id="hosid" name="hosid"></td>
    </tr>
    
    <tr>
    <td><label for="remark">Remarks</label></td>
	<td> <textarea rows="3" cols="35" id="remark" name="remark"> </textarea></td>
    </tr>
    
    
    <tr>
    <td><button type="submit">ADD</button></td>
	<td><button type="reset">RESET</button></td>
    </tr>
</table>
</form>
</div>
</body>
</html>