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
            <li><a href="#">Blog</a></li>
            <li><a href="Login.jsp">Login</a></li>
            <li><a href="#">CONTACT</a></li>
          </ul>
        </div>

        <div class="search">
          <form action=""HelloForm" method="Get">
            <input
            class="srch"
            type="search"
            name="title"
            placeholder="Type To text"
          />
          <input class ="btn" type="submit" value="Submit" />
          </form>
          <!--<a href="#"> <button class="btn">Search</button></a>-->
        </div>
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
      <div class="container">
        <div class="carousel-caption">
          <h3>To Read More Blog Click Below</h3>
          <p id="show"></p>
          <p><a class="btn btn-lg btn-primary" href="#" id="learn" onclick="sendinfo()">Learn more</a></p>
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
    </script>
    <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
  	
  </body>
</html>
