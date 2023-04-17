<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
.div1{
	
	 height:400px;
	 width:400px;
	 padding:20px;
	 margin: auto;
	 padding: 10px;
	 margin-top:40px;
	 border-radius:3px;
	 background-color:rgb(255,255,255);
	
	}
body{
	background-color:rgb(176,224,230);
}
button{
	border:1px solid blue;
	background-color:rgb(0,0,255);
	width:360px;
	height:40px;
	margin-left:15px;
	border-radius:2px;
}
input{
	margin-left:15px;
	width:350px;
	height:20px;
}

</style>
</head>
<body>
<form action="admin">
<div class="div1">
<h3 style="padding-left:15px;"><i class="fas fa-user-alt" style="font-size:30px;"></i>&nbsp;&nbsp;Admin Login</h3><hr><br>
<label style="padding-left:15px;">Email</label><br>
<input type="text" id="email" name="email" placeholder="enter email"><br><br>
<label style="padding-left:15px;">Password </label><br>
<input type="password"  id="email" name="pwd" placeholder="enter password" ><br><br><br>
<button type="submit">Login</button>   

</div>
</form>
</body>
</html>