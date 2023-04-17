<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	margin-left:100px;
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
	margin-left:170px;
	margin-top:50px;
	font-weight:bold;
}

button:hover
{
	background-color:white;
	color:DodgerBlue;
	cursor: pointer;
}

</style>
<script type="text/javascript">

function fun1()
{
	if(document.getElementById("pidd").checked)
	{
		document.getElementById("pid").disabled = false;
		document.getElementById("pname").disabled = true;
	}	
	else 
	{
		document.getElementById("pid").disabled = true;
		document.getElementById("pname").disabled = false;
	}
}

</script>
</head>
<body>
<jsp:include page="doctor_dashboard.jsp"></jsp:include>
<div class="div1" style="background-color:rgb(60,179,113);"> 
<form action="patient_information.jsp">
<table>
    <tr>
    <td colspan=2>
    <h1 style="margin-left:40px; color:white;">Patient History</h1>
	</td>
	</tr>
	<tr>
	<td>
	<input type="radio" id="pidd" name="pnames" value="pidd" onclick="fun1()">
    <label for="html">patient id</label><br></td>
	<td>
	<input type="radio" id="pnames" name="pnames" value="pnames" onclick="fun1()">
    <label for="html">patient names</label><br>
	</td>
	</tr>

	<tr>
    <td><label for="pid"> Patient id :</label></td>
	<td><input type="text" id="pid" name="pid" disabled></td>
	</tr>
	
	<tr>
	<td><label for="pname"> Patient name :</label></td>
	<td><input type="text" id="pname" name="pname" disabled></td>
	</tr>
	
	<tr >
    <td colspan=2><button type="submit">Search</button></td>
    </tr>
</table>
</form>
</div>
</body>
</html>