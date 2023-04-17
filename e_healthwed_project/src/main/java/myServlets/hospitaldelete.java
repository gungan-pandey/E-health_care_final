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


public class hospitaldelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public hospitaldelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void service(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<body bgcolor='lightblue'>");
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
			out.println("<b><h1>Can't Delete, It exists in it's parent table </b></h1> ");
		}  
		out.println("</body>");
}

}

