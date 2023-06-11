package myServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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

/**
 * Servlet implementation class public_add
 */
public class public_add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public public_add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
			ResultSet rs=st.executeQuery("select * from patient where patient_id='"+name+"' && patient_name='"+pass+"' ");
			if(rs.next())
			{
				HttpSession session = req.getSession();	
				session.setAttribute("user",name);
				
				response.sendRedirect("public2.jsp");
			}
			else
				response.sendRedirect("public_login.jsp");
		}
		catch(Exception e)
		{ 
			out.println(e);
		}  
		
		
	}

}
