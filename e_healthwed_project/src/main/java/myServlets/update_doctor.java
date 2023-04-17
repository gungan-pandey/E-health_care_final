package myServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class update_doctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public update_doctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("did"));
	    String name=req.getParameter("dname");
	    String year_of_joining=req.getParameter("dadd");
	    String specialization=req.getParameter("dspeci");
	    
	    PrintWriter out = response.getWriter();
		out.println(id);
		out.println(name);
		out.println(year_of_joining);
		out.println(specialization);
		
		Connection con=null;
		Statement st=null;
		try{  
			out.println("Hello");
			Class.forName("com.mysql.cj.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
			out.println("Congratulation ! You are Connected ");
			st=con.createStatement();
			st.executeUpdate("update doctors set doctor_name='"+name+"',year_of_joining='"+year_of_joining+"',specialization='"+specialization+"' where doctor_id="+id);
			out.println("Database Inserted Successfully ");
		}
		catch(Exception e)
		{ 
			
		}  
		response.sendRedirect("doctor_report_div.jsp");
	
	
}

}

		
		
		
		
	

	
	
