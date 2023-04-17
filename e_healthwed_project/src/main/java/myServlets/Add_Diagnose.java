package myServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Add_Diagnose extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Add_Diagnose() {
        super();
        // TODO Auto-generated consstructor stub
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		
		int patient_id =Integer.parseInt(request.getParameter("diaid"));
		String  disdate=request.getParameter("diadate");
		String disease_id=(request.getParameter("dianame").trim());
		String meds=request.getParameter("diameds");
		int hospital_id=Integer.parseInt(request.getParameter("hosid"));
		String remark=request.getParameter("remark");
		
		HttpSession session = request.getSession();
		String doctor_id =(String.valueOf(session.getAttribute("user")).trim());
		
		out.println(patient_id);
		out.println(disdate);
		out.println(disease_id);
		out.println(meds);
		out.println(hospital_id);
		out.println(remark);
		out.println(doctor_id);
		
		Connection con=null;
		Statement st=null;
		try{  
			out.println("Hello");
			Class.forName("com.mysql.cj.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
			out.println("Congratulation ! You are Connected ");
			st=con.createStatement();
			st.executeUpdate("insert into diagnose(dignose_date,disease_id,meds,patient_id,hospital_id,doctors_id,remarks) values('"+disdate+"',"+disease_id+",'"+meds+"',"+patient_id+","+hospital_id+","+doctor_id+",'"+remark+"')");
			out.println("Database Inserted Successfully ");
		}
		catch(Exception e)
		{ 
			
		}  

  }

}
