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

  <title>SkyBroker | Available Flights</title>
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
<body class="page-contact" style="background-image: url('imgs/11.jpg');"> 

  <!-- ======= Header ======= -->
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="Index.jsp" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <img src="imgs/logo.png" alt=""> 
      </a>

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="Index.jsp">Home</a></li>
          <li><a href="about.jsp">About Us</a></li>
          <li><a href="newreservation.jsp" class="active">Search Flights</a></li>
          <li><a href="trackflight.jsp">Flight Status</a></li>
          <li><a href="contact.jsp">Get In Touch</a></li>
        </ul>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs d-flex align-items-center" style="background-image: url('imgs/5.jpg');">
      <div class="container position-relative d-flex flex-column align-items-center">

        <h2>Available Flights</h2>

      </div>
    </div><!-- End Breadcrumbs -->
  
  <form method="post" action="travellerdetails.jsp" style="margin-top: 0px;">

<table style="margin-top: 0px;">
<div >
      <table>
        <thead>
          <tr>
            <th></th>
            <th>Flight No</th>
            <th>Airline Name</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Date</th>
            <th>Arrival Time</th>
            <th>Departure Time</th>
            <th>Rate</th>
          </tr>
        </thead>
        <tbody>
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
String source = request.getParameter("source");
String desti = request.getParameter("dest");
String date =request.getParameter("date");
String typ = request.getParameter("classOption");
System.out.println(request.getParameter("source"));

System.out.println("availbleflight: " + typ);
%>
<input type="hidden" name="source" value="<%=request.getParameter("source")%>"/><br>
<input type="hidden" name="classOption" value="<%=request.getParameter("classOption")%>"/><br>
<%
try{
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
//String sql="select * from databaseflight";
String sql ="select * from databaseflight where Source='" + request.getParameter("source")+"'and Destination='" + request.getParameter("dest")+"'and Date='" + request.getParameter("date")+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><strong><img src="imgs/flight.png" alt="" style="width: 90px; height:50px;"></strong></td>
<td><%=resultSet.getString("FlightNo") %></td>
<td><%=resultSet.getString("AirlineName") %></td>
<td><%=resultSet.getString("source") %></td>
<td><%=resultSet.getString("destination") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("arTime") %></td>
<td><%=resultSet.getString("deTime") %></td>
<td><%=resultSet.getInt("rate") %></td>
</tr><br>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
<div class="col-lg-12 justify-content-center" data-aos="fade-up" data-aos-delay="250">
        <form action="travellerdetails.jsp" method="post" role="form" class="php-email-form">
          <div class="row">
            <div class="col-md-2 form-group mt-3 mt-md-0" style="margin-left: 243px;">
              <table>
                <tr>
                  <td><input type="text" name="flightno" class="form-control" id="flightno" placeholder="Flight No" required></td>
                  <td style="padding: 0px; margin: 0px;"><input type="submit" value="Next" style="width: 150px; font-size: large;"></td>
                </tr>
              </table>
            </div>
        </div>
        </form>
      </div><!-- End Contact Form -->
    
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
</body>
</html>