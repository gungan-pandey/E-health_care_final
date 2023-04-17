package myServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.http.HttpSession;

public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public admin() 
    {
        super();
    }

	
	protected void service(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
	
		String name=req.getParameter("email");
	    String pass=req.getParameter("pwd");
	    
	    PrintWriter out = response.getWriter();
		out.println(name);
		out.println(pass);
		
		Connection con=null;
		Statement st=null;
		try{  
			out.println("Hello");
			Class.forName("com.mysql.cj.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
			out.println("Congratulation ! You are Connected ");
			st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from admin_login where user_name='"+name+"' && password='"+pass+"' ");
			if(rs.next())
			{
				HttpSession session = req.getSession();	
				session.setAttribute("user",name);
				response.sendRedirect("font_page.jsp");
			}
			else
				response.sendRedirect("admin_login.jsp");
		}
		catch(Exception e)
		{ 
			out.println(e);
		}  
	}
}
		
