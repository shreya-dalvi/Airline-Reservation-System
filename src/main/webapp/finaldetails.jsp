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

  <title>SkyBroker | Details</title>
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
<input type="hidden" name="flight" value="<%= request.getParameter("flightno") %>"/><br>
  <!-- ======= Header ======= -->
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center">
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

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs d-flex align-items-center" style="background-image: url('imgs/6.jpg');">
      <div class="container position-relative d-flex flex-column align-items-center">

        <h2>Traveler Details</h2>

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

String name = request.getParameter("name").toString();
String age = request.getParameter("age").toString();
String aadharno =request.getParameter("aadhar").toString();
String flightno =request.getParameter("flight").toString();
String typ =request.getParameter("classOption").toString();
String typ1="Business";
String typ2="First";
String typ3="Economy";
int r1=0;
//String adhar=subString(8);
String PNR=aadharno.substring(8)+flightno;
request.setAttribute("pnr", PNR);

System.out.println("fdetails: "+typ);
%>
<%
try{
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from databaseflight where FlightNo='" + request.getParameter("flight")+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<thead>
          <tr>
            <th>Name</th> 
            <td><%= request.getParameter("name") %></td>
          </tr>
        </thead>
        <thead>
          <tr>
              <th>Age</th>
              <td><%= request.getParameter("age") %></td>
            </tr>
          
          </thead>
          <thead>
          <tr>
              <th>Aadhar No.</th>
              <td><%= request.getParameter("aadhar") %></td>
            </tr>
          <thead>
          <tr>
              <th>PNR No.</th>
              <td><%= PNR %></td>
            </tr>
          </thead>
          
          <thead>
            <tr>
              <th>Flight No</th>
              <td><%=resultSet.getString("FlightNo") %></td>
            </tr>
          </thead>
            <tr>
              <th>Airline Name</th>
              <td><%=resultSet.getString("AirlineName") %></td>
            </tr>
          </thead>
          <thead>
            <tr>
              <th>Source</th>
              <td><%=resultSet.getString("source") %></td>
            </tr>
          </thead>
          <thead>
            <tr>
              <th>Destination</th>
              <td><%=resultSet.getString("destination") %></td>
            </tr>
          </thead>
          <thead>
            <tr>
            <th>Date</th>
              <td><%=resultSet.getString("date") %></td>
            </tr>
          </thead>
          <thead>
            <tr>
              <th>Arrival Time</th>
              <td><%=resultSet.getString("arTime") %></td>
            </tr>
          </thead>
          <thead>
            <tr>
              <th>Departure Time</th>
              <td><%=resultSet.getString("deTime") %></td>
            </tr>
          </thead>
          <thead>
            <tr>
              <th>Rate</th>
              <% r1 = resultSet.getInt("rate");
              	if(typ.equalsIgnoreCase(typ1))
              		r1 *= 3;
              	else if(typ.equalsIgnoreCase(typ2))
              		r1 *= 2;
              %>
			  <td><%= r1 %></td>
            </tr>
          </thead>
 <%
}
String fliNo="-",alname="-",src="-",dest="-",date="-",aTime="-",dTime="-";
String sql1 ="select * from databaseflight where FlightNo='" + request.getParameter("flight")+"' ";
resultSet = statement.executeQuery(sql1);
while(resultSet.next()){
	fliNo=resultSet.getString("FlightNo");
	alname=resultSet.getString("AirlineName");
	src=resultSet.getString("source");
	dest=resultSet.getString("destination");
	date=resultSet.getString("date");
	aTime=resultSet.getString("arTime");
	dTime=resultSet.getString("deTime");
	
}
String sql2="insert into passenger(PNR,name,age,adhar,flino,alname,src,dest,date,aTime,dTime,rate)values('"+PNR+"','"+name+"','"+age+"','"+aadharno+"','"+fliNo+"','"+alname+"','"+src+"','"+dest+"','"+date+"','"+aTime+"','"+dTime+"','"+r1+"')";
statement.executeQuery(sql2);
connection.close();
} catch (Exception e){
e.printStackTrace();


}
session.setAttribute("PNRNo",PNR);
%>


</table>

<div class="text-center" style="margin-top:20px;">
	    <!--button type="submit" style="background-color: #56b8e6;  border: none;color: white;text-align: center;padding: 15px 32px;font-size: 20px;">
		Confirm Details
		</button-->
    <form action="paymentform.jsp" method="post" role="form" class="php-email-form">
    <input type="hidden" name="pnr" value="<%= PNR %>"/>
      <div class="text-center" style="margin-top:50px; margin-bottom: 50px;"><!--button type="submit">Next</button-->
        <input type="submit" value="Proceed to Payment" onClick="myFunction()">
      </div>
    </form>
  	</div> 
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
   <script>
        function myFunction() {
          window.location.replace('paymentform.jsp')
        }
    </script>
<% //System.out.println(PNR); %>
</body>
</html>