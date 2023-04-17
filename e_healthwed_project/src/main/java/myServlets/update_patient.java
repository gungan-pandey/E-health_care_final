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

public class update_patient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public update_patient() {
        super();
    }

	protected void service(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException 
	{
		 int id=Integer.parseInt(req.getParameter("pid"));
		    String name=req.getParameter("pname");
		    String add=req.getParameter("padd");
		    String city=req.getParameter("pcity");
		    String state=req.getParameter("pstate");
		    String dob=req.getParameter("pdob");
		    
		    
		    PrintWriter out = response.getWriter();
			out.println(id);
			out.println(name);
			add=add+", "+city+", "+state;
			out.println(add);
			out.println(dob);
			
			Connection con=null;
			Statement st=null;
			try{  
				out.println("Hello");
				Class.forName("com.mysql.cj.jdbc.Driver");  
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
				out.println("Congratulation ! You are Connected ");
				st=con.createStatement();
				st.executeUpdate("update patient set patient_name='"+name+"',patient_add='"+add+"',dob='"+dob+"' where patient_id="+id);
			}
			catch(Exception e)
			{ 
				
			}  
			response.sendRedirect("patient_report_div.jsp");
	}
}
