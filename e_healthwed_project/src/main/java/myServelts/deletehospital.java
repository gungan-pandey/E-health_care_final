package myServelts;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.*;

public class deletehospital extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public deletehospital() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();

		try
		{  
			int id1=Integer.parseInt(req.getParameter("val"));
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
			Statement st=con.createStatement();
			st.executeUpdate("delete from hospital where hospital_id="+id1);
			response.sendRedirect("hospital_report_div.jsp");
			out.println("Database deleted Successfully ");
		}
		catch(Exception e)
		{ 
			out.println(e);
		}  
	
	
		
	}

}
