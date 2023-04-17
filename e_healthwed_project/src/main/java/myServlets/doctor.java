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
import java.sql.ResultSet;
import java.sql.Statement;


public class doctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public doctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
	
		String id=req.getParameter("no");
	    String pass=req.getParameter("pwd");
	    
	    PrintWriter out = response.getWriter();
		out.println(id);
		out.println(pass);
		
		Connection con=null;
		Statement st=null;
		try{  
			out.println("Hello");
			Class.forName("com.mysql.cj.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
			out.println("Congratulation ! You are Connected ");
			st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from doctors where doctor_id="+id+" && specialization='"+pass+"'");
			if(rs.next())
			{
				HttpSession session = req.getSession();	
				session.setAttribute("user",id);
				HttpSession sname = req.getSession();	
				sname.setAttribute("name",rs.getString("doctor_name"));
				response.sendRedirect("doctor_dashboard.jsp");
			}
			else
				response.sendRedirect("doctor_login.jsp");
		}
		catch(Exception e)
		{ 
			out.println(e);
		}  
	}
}
	
	