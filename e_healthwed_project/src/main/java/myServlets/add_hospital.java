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


public class add_hospital extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public add_hospital() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
	
		 int id=Integer.parseInt(req.getParameter("hid"));
		    String name=req.getParameter("hname");
		    String add=req.getParameter("hadd");
		    
		    
		    PrintWriter out = response.getWriter();
			out.println(id);
			out.println(name);
			out.println(add);
			
			Connection con=null;
			Statement st=null;
			try{  
				out.println("Hello");
				Class.forName("com.mysql.cj.jdbc.Driver");  
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare","root","1234");  
				out.println("Congratulation ! You are Connected ");
				st=con.createStatement();
				st.executeUpdate("insert into  hospital values("+id+",'"+name+"','"+add+"')");
				out.println("Database Inserted Successfully ");
			}
			catch(Exception e)
			{ 
				
			}  
		   
 }

}
