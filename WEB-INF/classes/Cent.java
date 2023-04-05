import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
 class Cent extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	String title = "Calculating the price of Plot";
	String docType ="<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
	String nu = request.getParameter("val");
	Long s = Long.parseLong(nu);
	Long k = s*150470;
	out.println(docType +
"<html>\n" +
"<head><title>" + title + "</title></head>\n" +
"<body bgcolor = \"#f0f0f0\">\n" +
"<h1 align = \"center\">" + title + "</h1>\n" +
"<h2  align = \"center\">Entered  Sq.m is: "+ nu  + "</h2>\n"+
"<h2 algin=\"center\">The approximated price for "+nu+ " Cent plot is Rupees:"+k+"</h2>\n"+
"</body>" +
"</html>"
);
}

public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

      doGet(request, response);
   }
}