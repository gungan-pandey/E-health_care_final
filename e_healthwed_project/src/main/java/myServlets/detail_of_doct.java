package myServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



/**
 * Servlet implementation class doctors_detail
 */
public class detail_of_doct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detail_of_doct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// Retrieve the doctor ID from the request parameters
		
		int doctor_id1 = Integer.parseInt(request.getParameter("specialist"));

        // Retrieve the image data from the database
        byte[] imageData = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ehealthcare", "root", "1234");
            PreparedStatement statement = connection.prepareStatement("SELECT path FROM image WHERE doctor_id = ?");
            statement.setInt(1, doctor_id1);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                imageData = resultSet.getBytes("path");
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error retrieving image data from database", e);
        }

        // Set the content type and write the image data to the response
        if (imageData != null) {
            response.setContentType("image/jpg");
            response.setContentLength(imageData.length);
            try (OutputStream outputStream = response.getOutputStream()) {
                outputStream.write(imageData);
            } catch (IOException e) {
                e.printStackTrace();
                throw new ServletException("Error writing image data to response", e);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
		
		
	}

}
