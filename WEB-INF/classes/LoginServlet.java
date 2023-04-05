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
    String password = request.getParameter("password");
    try {
      student s = new student(username, password);
      boolean result = s.validateStudent();
      if (result) {
        out.print("Welcome");
      } else {
        out.println("Enter Valid Data");
      }
    } catch (Exception e) {
      System.out.println(e.getLocalizedMessage());
    }
  }
}

class student {
  private String username;
  private String password;

  public student(String username, String password) {
    this.username = username;
    this.password = password;
  }

  public boolean validateStudent()
      throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
    dbmsConnection connect = null;
    PreparedStatement stmt = null;
    Connection con = null;
    boolean found = false;
    try {
      connect = new dbmsConnection("jdbc:mysql://localhost:3306/vit", "root", "sportsma");
      con = connect.getConnection();
      String sql = "select * from student where name=? and password= ?;";
      stmt = con.prepareStatement(sql);
      stmt.setString(1, username);
      stmt.setString(2, password);
      ResultSet rs = stmt.executeQuery();
      if (rs.next() == false) {
        found = false;
      } else {
        found = true;
      }
    } catch (Exception e) {
      System.out.println(e.getLocalizedMessage());
    } finally {
      connect.closeConnection(con, stmt);
    }

    return found;

  }
}

class dbmsConnection {
  String url;
  String username;
  String password;

  public dbmsConnection(String url, String username, String password) {
    this.url = url;
    this.username = username;
    this.password = password;
  }

  public Connection getConnection()
      throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
    Connection con = null;
    try {
      Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
      con = DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    return con;
  }

  public void closeConnection(Connection con, Statement stmt) throws SQLException {
    stmt.close();
    con.close();
  }

}
