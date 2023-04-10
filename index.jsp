

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="ISO-8859-1">
  <title>Welcome to our Login Page</title>
  </head>
  <body>

<%
out.println("This is jsp and JDBC code");
%>
<form action="index.jsp" method="post">
  <label for="inputname">Enter your Name</label>
  <input type="text" name="username" required><br>
  <input type="submit" name="submit" value="submit">
  </form>

 <% 
  String sub = request.getParameter("submit");
  if(sub!=null)
  {
    String username = request.getParameter("username");
    out.println("Welcome Mr "+ username);
  }
  %>

  <form action="login" method="post">
  <label for="usernamelbl">Enter your Username</label>
  <input type="text" name="username" required><br>
  <label for="passlbl">Enter your Password</label>
  <input type="password" name="password" required><br>
  <input type="submit" name="submit" value="submit">
  <input type="reset">
  </form>

<div class="container">
          <div class="carousel-caption">
            <h1>Life's Greatest Investement</h1>
            <p id="show"></p>
            <p><a class="btn btn-lg btn-primary" href="#" id="learn" onclick="sendinfo()">Learn more</a></p>
          </div>
        </div>


<h1>Important Note</h1>  
<div >  
<b>To:</b> <span id="to"></span><br>  
<b>From:</b> <span id="from"></span><br>  
<b>Message:</b> <span id="message"></span>  
</div>  

<script>
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
  </body>
  </html>


