
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
            <li><a href="/">HOME</a></li>    
            <li><a href="blog.xml">BLOG</a></li>
            <li><a href="Login.jsp">LOGIN</a></li>
            <li><a href="about.jsp">CONTACT</a></li>
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
        <h1>Contact<br /><span>Details</span> Course</h1>
        <p class="par">
            <h1>Details</h1>  
            <div >  
            <b>Mail:</b> <span id="to"></span><br>  
            <b>Instaagram:</b> <span id="from"></span><br>  
            <b>Source Code:</b> <span id="message"></span>  
            </div> 
            </div>
            
        </p>
      </div>
     
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
xhttp.open("GET", "info.xml", true);
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
