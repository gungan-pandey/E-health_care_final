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

public class Add_Patient extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public Add_Patient() {
        super();
    }

	protected void service(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
	    int id=Integer.parseInt(req.getParameter("pid"));
	    String name=req.getParameter("pname");
	    String add=req.getParameter("padd");
	    String dob=req.getParameter("pdob");
	   
		PrintWriter out = response.getWriter();
		out.println(id);
		out.println(name);
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
			st.executeUpdate("insert into patient values("+id+",'"+name+"','"+add+"','"+dob+"')");
			out.println("Database Inserted Successfully ");
		}
		catch(Exception e)
		{ 
			
		}  
	}
}
