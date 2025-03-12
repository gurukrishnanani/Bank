

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("uname");
		String password=request.getParameter("psw");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender"); 
		String state=request.getParameter("state");
		long mobile_no=Long.parseLong(request.getParameter("mno"));
	
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sathyadb","sathyadb");
				PreparedStatement ps=con.prepareStatement("insert into userregister values(?,?,?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, password);
				ps.setString(3, email);
				ps.setString(4, gender);
				ps.setString(5, state);
				ps.setLong(6, mobile_no);
				int i=ps.executeUpdate();
				
				
					out.print(i+"new user succesfully register...");
					con.close();
				}
				catch(Exception ex)
				{
					out.print(ex);
				}
				}




				
			
		
		
		

	

	}

