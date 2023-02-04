<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>SkyBroker | Flight Status</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="vendor/aos/aos.css" rel="stylesheet">
  <link href="vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="vendor/remixicon/remixicon.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="css/main.css" rel="stylesheet">
  <link href="css/table.css" rel="stylesheet">
</head>
<style>
  table{
    width: 400px;
  }

  th{
    text-align: left;
    background: url(https://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#1b2f45, #34354d);
    font-size: 16px;
    width: 200px;
  }

  td{
    font-size: 16px;
    font-weight: 400;
    text-align: left;
}

  input[type=submit]
  {
    background-color: #1b2f45;
  }

  input[type=submit]:hover
  {
    background-color: #fff;
    color: #1b2f45;
    font-weight: bolder;
  }
</style>

<body class="page-contact" style="background-image: url('imgs/11.jpg');">

  <!-- ======= Header ======= -->
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="Index.css" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <img src="imgs/logo.png" alt=""> 
      </a>

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="Index.jsp">Home</a></li>
          <li><a href="about.jsp">About Us</a></li>
          <li><a href="newreservation.jsp">Search Flights</a></li>
          <li><a href="trackflight.jsp">Flight Status</a></li>
          <li><a href="contact.jsp">Get In Touch</a></li>
        </ul>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main">
  <div class="breadcrumbs d-flex align-items-center" style="background-image: url('imgs/8.jpg');">
      <div class="container position-relative d-flex flex-column align-items-center">

        <h2>Flight Status</h2>

      </div>
    </div><!-- End Breadcrumbs -->

    <div >
      <table>
  <%
String driver = "org.mariadb.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3308/";
String database = "airline";
String userid = "root";
String password = "mysql";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

System.out.println(request.getParameter("pnr"));
try{
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
//String sql="select * from databaseflight";
System.out.println(request.getParameter("pnr")+" "+request.getParameter("name"));
String sql ="select * from passenger where PNR='" + request.getParameter("pnr")+"'and name='" + request.getParameter("name")+"' ";;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<thead>
          <tr>
            <th>PNR No.</th> 
            <td><%=resultSet.getString("PNR") %></td>
          </tr>
        </thead>
        <thead>
          <tr>
              <th>Name</th>
              <td><%=resultSet.getString("name") %></td>
            </tr>
          
          </thead>
          <thead>
          <tr>
              <th>Source</th>
              <td><%=resultSet.getString("src") %></td>
            </tr>
          <thead>
          <tr>
              <th>Destination</th>
              <td><%=resultSet.getString("dest") %></td>
            </tr>
          </thead>
          
          <thead>
            <tr>
              <th>Arrival Time</th>
              <td><%=resultSet.getString("aTime") %></td>
            </tr>
          </thead>
            <tr>
              <th>Departure Time</th>
              <td><%=resultSet.getString("dTime") %></td>
            </tr>
          </thead>
          <% }
          } catch (Exception e){
e.printStackTrace();


}
%>
</table>
  </div>
  
  </main><!-- End #main -->
  
  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>
</div>

  <!-- Vendor JS Files -->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/aos/aos.js"></script>
  <script src="vendor/glightbox/js/glightbox.min.js"></script>
  <script src="vendor/swiper/swiper-bundle.min.js"></script>
  <script src="vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="js/main.js"></script>

</body>
</html>