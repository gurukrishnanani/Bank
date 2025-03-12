

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("uname");
		String password=request.getParameter("psw");
		String email=request.getParameter("email");
		long mobile_number=Long.parseLong(request.getParameter("mno"));
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sathyadb","sathyadb");
			PreparedStatement ps=con.prepareStatement("update from userregister set password=?,email=?,mobile_number=?,where name=? ");
			ps.setString(1, name);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setLong(6, mobile_number);
			int i=ps.executeUpdate();
			
			
				out.print(i+"record update successfully.....");
				con.close();
			}
			catch(Exception ex)
			{
				out.print(ex);
			}
			}
}

	

		
		
		
		
	