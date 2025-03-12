

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
 * Servlet implementation class NewAccount
 */
@WebServlet("/NewAccount")
public class NewAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		Long Accountno=Long.parseLong(request.getParameter("Accno"));
		String Name=request.getParameter("uname");
		String password=request.getParameter("psw");
		String Confirm_password=request.getParameter("cpws");
		String amount=request.getParameter("amount"); 
		String address=request.getParameter("address");
		long mobile_no=Long.parseLong(request.getParameter("mno"));
	
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","gurudb");
				PreparedStatement ps=con.prepareStatement("insert into banking values(?,?,?,?,?,?,?)");
				ps.setLong(1, Accountno);
				ps.setString(2, Name);
				ps.setString(3, password);
				ps.setString(4, Confirm_password);
				ps.setString(5,amount );
				ps.setString(6, address);
				ps.setLong(7, mobile_no);
				int i=ps.executeUpdate();
				
				
					out.print(i+"Account succesfully register...");
					con.close();
				}
				catch(Exception ex)
				{
					out.print(ex);
				}
				}
}




				
			
		




