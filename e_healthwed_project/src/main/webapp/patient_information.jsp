<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style>
.doctor_div{
    position: absolute;
    top:180px;
    left:150px;
    height:600px;
	width:950px;
	padding-left:80px;
	justify-content: center;
			}
table{
    margin-top:50px;
    margin-left:-35px;
}
td{
		padding:10px;
		margin:1px;
		text-align:center;
		
}

</style>


</head>
<body>
<jsp:include page="doctor_dashboard.jsp"></jsp:include>
<div class="doctor_div" style="background-color:rgb(60,179,113);">
<%

try{
	String ch=request.getParameter("pnames");
	String name= request.getParameter("pname");
	int pid=Integer.parseInt(request.getParameter("pid"));
	
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
	Statement st=con.createStatement();
	String query = "";

	out.println(ch);
	
	if(ch.equals("pidd"))
	{
		out.println("If executed ");
		query="Select disease.disease_name, doctors.doctor_name,hospital.hospital_name, patient.patient_id, patient.patient_name, patient.patient_add, diagnose.dignose_date,diagnose.remarks,diagnose.patient_id As patient_id1 From diagnose Inner Join disease On diagnose.disease_id = disease.disease_id Inner Join doctors On diagnose.doctors_id = doctors.doctor_id Inner Join hospital On diagnose.hospital_id = hospital.hospital_id Inner Join patient On diagnose.patient_id = patient.patient_id where patient.patient_id="+pid;
	}
	else
	{
		out.println("else executed ");
		query="Select disease.disease_name, doctors.doctor_name,hospital.hospital_name, patient.patient_id, patient.patient_name, patient.patient_add, diagnose.dignose_date,diagnose.remarks,diagnose.patient_id As patient_id1 From diagnose Inner Join disease On diagnose.disease_id = disease.disease_id Inner Join doctors On diagnose.doctors_id = doctors.doctor_id Inner Join hospital On diagnose.hospital_id = hospital.hospital_id Inner Join patient On diagnose.patient_id = patient.patient_id where patient.patient_name='"+name+"'";
	}
	ResultSet rs=st.executeQuery(query);
	out.println("<table id='customers' border=1 width='600'><tr>");
	out.println("<td><h3>disease name</h3></td>");
	out.println("<td><h3>doctor name</h3> </td>");
	out.println("<td><h3>hospital name</h3></td>");
	out.println("<td><h3>patient id</h3></td>");
	out.println("<td><h3>patient name</h3></td>");
	out.println("<td><h3>patient add</h3></td>");
	out.println("<td><h3>dignose_date</h3></td>");
	out.println("<td><h3>remarks</h3></td></tr>");
	while(rs.next())
	{
		out.print("<tr><td> "+rs.getString("disease.disease_name")+" "+"     </td>" );
		out.print("<td> "+rs.getString("doctors.doctor_name")+" "+"  </td>");
		out.print("<td> "+rs.getString("hospital.hospital_name")+" "+"  </td>");
		out.print("<td> "+rs.getString("patient.patient_id")+" "+"  </td>");
		out.print("<td> "+rs.getString("patient.patient_name")+" "+"  </td>");
		out.print("<td> "+rs.getString("patient.patient_add")+" "+"  </td>");
		out.print("<td> "+rs.getString("diagnose.dignose_date")+" "+"  </td>");
		out.print("<td> "+rs.getString("diagnose.remarks")+"\n\n"+    "</td></tr>");
	}
}
catch(Exception e)
{ 
	
} 
%>
</div>


</body>
</html>