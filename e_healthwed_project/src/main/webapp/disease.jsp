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
    top:125px;
    left:280px;
    height:450px;
	width:800px;
	padding-left:70px;
	justify-content: center;
	
}
h1{
	text-align: center;
	padding-top:20px;
	padding-right:330px;
	font-family: 'Ubuntu', sans-serif;
	text-decoration:none;
	text-shadow:3px 3px 5px black;
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
  padding-left: 1px;
  padding-right: 60px;
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
<jsp:include page="font_page.jsp"></jsp:include>
<div class="div1" style="background-color:rgb(72,209,204);"> 
<form action="disease">
<table>
    
    <h1 style="margin-left:170px; color:white;">Disease</h1>
    
	<tr>
    <td><label for="disid"> Disease id :</label></td>
	<td><input type="text" id="disid" name="disid"></td>
	</tr>
	
	<tr>
	<td><label for="disname"> Disease name :</label></td>
	<td><input type="text" id="disname" name="disname"></td>
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