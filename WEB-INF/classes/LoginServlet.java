import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public LoginServlet() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see Servlet#init(ServletConfig)
   */
  public void init(ServletConfig config) throws ServletException {
    // TODO Auto-generated method stub
  }

  /**
   * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String method = request.getMethod();
    if (method.equals("GET")) {
      doGet(request, response);
    } else if (method.equals("POST")) {
      doPost(request, response);
    }
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String username = request.getParameter("username");
    String password = request.getParameter("password").toString();

    try {
      Class.forName("oracle.jdbc.OracleDriver");
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "tiger");

      // Statement stmt = con.createStatement();
      // ResultSet rs = stmt.executeQuery("select * from users");
      String sql = "select * from users where u_name = ? and password = ?";

      PreparedStatement stmt = con.prepareStatement(sql);
      stmt.setString(1, username);
      stmt.setString(2, password);
      ResultSet rs = stmt.executeQuery();
      // out.print(rs.getInt(1) + " " + rs.getString(2));
      if (rs.next() == false) {
        out.println("<html><body><h1>Invalid Username or Password</h1></body></html>");
      } else {
        out.println("<html><body><h1>Welcome " + rs.getString(2) + "</h1><br><h2>Your ID is " + rs.getString(1)
            + "<br><a href='/'>Home</a></body></html>");
      }

      // step5 close the connection object
      con.close();

    } catch (Exception e) {

    }

    // try {
    // Class.forName("oracle.jdbc.OracleDriver");
    // Connection con =
    // DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system",
    // "sportsma");

    // // Statement stmt=con.Statement();
    // // ResultSet rs=stmt.executeQuery("select * from flight");

    // String sql = "select * from users where u_name = ? and password = ?";

    // PreparedStatement stmt = con.prepareStatement(sql);
    // stmt.setString(1, username);
    // stmt.setString(2, password);

    // ResultSet rs = stmt.executeQuery();
    // if (rs.next() == false)
    // out.print(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3));

    // if (rs.next() == false) {
    // out.println("I doubt you are an hacker.. pls run away");
    // out.println("Welcome Mr " + username + " and your password is " + password);
    // } else {
    // }
    // } catch (Exception e) {
    // out.println(e);
    // }
    //
    // step5 close the connection object
    // con.close();
    //
    // } catch (SQLException e)
    // {
    //
    // }

    // if(username.equals("satish") && password.equals("test123"))
    // {
    // out.println("Welcome Mr "+ username + " and your password is "+ password);
    // }
    // else
    // {
    // out.println("I doubt you are an hacker.. pls run away");
    // }
  }

}