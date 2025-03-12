

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Balance
 */
@WebServlet("/Balance")
public class Balance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Balance() {
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
		
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sathyadb","sathyadb");
				PreparedStatement ps=con.prepareStatement("select*from  banking where Accountno=? and Name=? and Password=? ");
				ps.setLong(1, Accountno);
				ps.setString(2, Name);
				ps.setString(3, password);
				ResultSet rs=ps.executeQuery();
				ResultSetMetaData rsm=rs.getMetaData();
				out.println( "<table border='1'>");
				int n=rsm.getColumnCount();
				for(int i=1;i<=n;i++)
				
					out.print("<td><font color=blue size='2'>"+"<br>"+rsm.getColumnName(i));
					out.println("<tr>");
					while(rs.next())
					{
						out.println("<tr>");
						for(int j=1;j<=n;j++) {
							out.println("<td>"+rs.getString(j)+"</td>");
						}
						out.println("</tr>");
					
					
					}
				out.println("</table>");
				con.close();
			}
				catch(Exception ex) {
			
				
					out.println(ex);
				
			}
}
}
