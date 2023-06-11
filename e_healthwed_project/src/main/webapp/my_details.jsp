<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.disease_div{

    position: absolute;
    top:180px;
    left:350px;
    height:400px;
	width:770px;
	justify-content: center;
	
    overflow: auto;
}
body {
     overflow: hidden;
}
table{
    margin-top:0px
    margin-left: 35px;
    table-layout: fixed;
	padding-left:70px;
	width: 755px; /* Set the width to match the doctor_div */
 	border-collapse: collapse;
}
thead {
  position: sticky;
  top: 0;
  background-color: #fff;
}
tbody {
  overflow-y: scroll;
  height: 300px; /* Adjust the height as needed */
}
td{
		padding:10px;
		margin:10px;
		text-align:center;
		
}
</style>
</head>
<body>

<jsp:include page="public2.jsp"></jsp:include>
<div class="disease_div" style="background-color:rgba(204,204,255,0.6);">
<%

try{  
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
	Statement st=con.createStatement();
//	out.println("Select diagnose.dignose_date, hospital.hospital_name, doctors.doctor_name, disease.disease_name, diagnose.meds, diagnose.remarks, patient.patient_id From diagnose Inner Join disease On diagnose.disease_id = disease.disease_id Inner Join hospital On diagnose.hospital_id = hospital.hospital_id Inner Join doctors On diagnose.doctors_id = doctors.doctor_id Inner Join patient On diagnose.patient_id = patient.patient_id order by diagnose.dignose_date desc where patient.patient_id="+session.getAttribute("user")+"");
	ResultSet rs=st.executeQuery("Select diagnose.dignose_date, hospital.hospital_name, doctors.doctor_name, disease.disease_name, diagnose.meds, diagnose.remarks, patient.patient_id From diagnose Inner Join disease On diagnose.disease_id = disease.disease_id Inner Join hospital On diagnose.hospital_id = hospital.hospital_id Inner Join doctors On diagnose.doctors_id = doctors.doctor_id Inner Join patient On diagnose.patient_id = patient.patient_id  where patient.patient_id="+session.getAttribute("user")+" order by diagnose.dignose_date desc");
	out.println("<table  id='customers' border=1><thead><tr>");
	out.println("<td><h3>Dignose Date</h3></td>");
	out.println("<td><h3>Hospital Name</h3> </td>");
	out.println("<td><h3>Doctor Name</h3> </td>");
	out.println("<td><h3>Disease Name</h3> </td>");
	out.println("<td><h3>Medicines</h3> </td>");
	out.println("<td><h3>remarks</h3> </td>");
	out.println("<td><h3>Patient Id</h3></td></tr></thead>");
	out.println("<tbody>");
	while(rs.next())
	{
		out.print("<tr><td> "+rs.getString("diagnose.dignose_date")+" "+"     </td>" );
		out.print("<td> "+rs.getString("hospital.hospital_name")+" "+"  </td>");
		out.print("<td> "+rs.getString("doctors.doctor_name")+" "+"  </td>");
		out.print("<td> "+rs.getString("disease.disease_name")+" "+"  </td>");
		out.print("<td> "+rs.getString("diagnose.meds")+" "+"  </td>");
		out.print("<td> "+rs.getString("diagnose.remarks")+" "+"  </td>");
		out.print("<td> "+rs.getString("patient.patient_id")+" "+"  </td></tr>");
	
	}
	out.println("</tbody>");
    out.println("</table>");

}
catch(Exception e)
{ 
	
} 
%>
</div>

</body>
</html>