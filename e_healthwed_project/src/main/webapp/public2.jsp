<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	background-image:url("user5_img.jpg");
	 background-repeat: no-repeat;
	 
}
#div2{
    height:200px;
    width:1200px;
    margin-top:50px;
    margin-left:450px;
   
	
	
}
.hlink
{	
		width:200px;
		color:black;
		height:40px;
      	font-size:28px;
      	font-style:italic;
      	display:block;
      	background-color:rgb(255,255,255);
      	text-align:center;
      	
      	
      	
      	text-decoration: none;
      	
      	}
.hlink:hover{
		color:rgb(0,0,255);
}
.div{
	display: inline-block;
  margin:-5px
  padding: 5px;;
	
}

</style>

</head>
<body>
<div id="div2">

<div class="div"><a class="hlink" href="my_profile.jsp">My profile</a></div>
<div class="div"><a class="hlink" href="public1.jsp">Doctors Details&nbsp;&nbsp;&nbsp;</a></div>
<div class="div"><a class="hlink" href="my_details.jsp">My Details</a></div>
<div class="div"><a class="hlink" href="public2.jsp">Home</a></div>


</div>

</body>
</html>