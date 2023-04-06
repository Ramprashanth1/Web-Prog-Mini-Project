<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! int count=0; %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Webpage Design</title>
    <link rel="stylesheet" href="style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
   
    <style>
      .main {
        width: 100%;

        background: url(image.jpg);
        background-color: lightblue;
        background-position: center;
        background-size: cover;
        height: 200vh;
        padding: 10px;
      }
      .dark {
        background-color: black;
        /* width: 100%;*/
        /*background: linear-gradient(
            to top,
            rgba(0, 0, 0, 0.5) 50%,
            rgba(0, 0, 0, 0.5) 50%
          ),
          url(image2.webp);
        /*background-color: white;*/
        background-position: center;
        background-size: cover;
        height: 200vh;
        color:white;
      }
    </style>
  </head>
  <body>
    <!--<button id="btn1">Dark</button>-->

    <div class="main">
      <div class="navbar">
        <div class="icon">
          <h2 class="logo">Blog</h2>
        </div>

        <div class="menu">
          <ul>
            <li><a href="#">HOME</a></li>
            <li><a href="#">ABOUT</a></li>
            <li><a href="blog.xml">Blog</a></li>
            <li><a href="Login.jsp">Login</a></li>
            <li><a href="#">CONTACT</a></li>
          </ul>
        </div>

        <div class="search">
          <form action="index.jsp" method="post">
            <input
            class=""
            type="text"
            name="username"
            placeholder="Type your Name"
          />
          <input class ="btn" type="submit" name="submit" value="Submit" />
          </form>
          <!--<a href="#"> <button class="btn">Search</button></a>-->
        </div>
        <% 
        String sub = request.getParameter("submit");
        if(sub!=null)
        {
          String username = request.getParameter("username");
          out.println("Welcome User, "+ username);
          
        }
        %>
        <div class="darkmode">
          <a href="#"> <button class="btn">Dark Mode</button></a>
        </div>
      </div>
      
      
      <div class="content">
        <h1>Web Design & <br /><span>Development</span> <br />Course</h1>
        <p class="par">
          Web design and development is an umbrella term that describes the
          process of creating a website. <br />
          Like the name suggests, it involves two major skill sets: web design
          and web development. <br />
          Web design determines the look and feel of a website, while web
          development determines how it functions.
        </p>
      </div>
      <div>
        <p>Users:</p>
        <%
        try
{
  
 Class.forName("oracle.jdbc.OracleDriver");  
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");  
//Context initContext = new InitialContext();
//Context envContext  = (Context)initContext.lookup("java:/comp/env");
//DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
//Connection conn = ds.getConnection();
Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from users");  
 
                                          
        
        
 while(rs.next()){  
out.print(rs.getString(1)+"  "+rs.getString(2)+"<br>");  
  count=count+1;
 }
 out.print("Total Number Of Users : "+count+"<br>");
//step5 close the connection object  
con.close();  
  
} catch (SQLException e) { 
        
     } 


%>
      </div>
      <div class="container">
        <div class="carousel-caption">
          <h3>To Learn More, Click Below</h3>
          <p id="show"></p>
          <p><a class="btn btn-lg btn-primary" href="#" id="learn" onclick="sendinfo()">Learn more</a></p>
        </div>
      </div>
      <h1>Details</h1>  
    <div >  
    <b>To:</b> <span id="to"></span><br>  
    <b>From:</b> <span id="from"></span><br>  
    <b>Message:</b> <span id="message"></span>  
    </div> 
    </div>
	
     
	 <script>
      $(document).ready(function () {
        $(".darkmode").click(function () {
          $(".main").toggleClass("dark");
        });
      });

      function sendinfo()
      {
        const xhttp = new XMLHttpRequest();
        xhttp.onload  = function()
        {
          document.getElementById("show").innerHTML = this.responseText;
        }

        xhttp.open("GET","ajax.txt");
        xhttp.send()
      }

      var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        myFunction(this);
    }
};
xhttp.open("GET", "test.xml", true);
xhttp.send();

function myFunction(xml) {
    var xmlDoc = xml.responseXML;
	//document.getElementByID("dom").innerHTML=xmlDoc;
    document.getElementById("to").innerHTML= xmlDoc.getElementsByTagName("to")[0].childNodes[0].nodeValue;  
document.getElementById("from").innerHTML= xmlDoc.getElementsByTagName("from")[0].childNodes[0].nodeValue;  
document.getElementById("message").innerHTML= xmlDoc.getElementsByTagName("body")[0].childNodes[0].nodeValue;  
}
    </script>
    <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
  	
  </body>
</html>
