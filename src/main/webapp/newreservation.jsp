<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>SkyBroker | Search Flights</title>
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
</head>
<body>
<%
String source,dest,date,nop;
%>
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

        <h2>Search Flights</h2>

      </div>
    </div>
    </div><!-- End Breadcrumbs -->
	
    <!-- ======= Contact Section ======= -->
<div style="background-image: url('imgs/11.jpg');">
    <section id="contact" class="contact">
      <div class="container position-relative" data-aos="fade-up">
        <div class="row gy-4 d-flex justify-content-end">
          <div class="col-lg-12" data-aos="fade-up" data-aos-delay="250">
          <form method="post" action="availableflights.jsp">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="source" class="form-control" id="source" placeholder="Source" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="text" class="form-control" name="dest" id="dest" placeholder="Destination" required>
                </div>
              </div>
              <div class="row form-group mt-3">
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="text" class="form-control"  style="color: grey;" name="date" id="date" placeholder="Date (dd-mm-yyyy)" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0 custom-select">
                  <select class="form-select" style="height: 46px; color: grey; font-size: 15px;" name="classOption">
                    <option disabled selected hidden>Class</option>
                    <option value="Economy" class="classOpt">Economy</option>
                    <option value="First" class="classOpt">First</option>
                    <option value="Business" class="classOpt">Business</option>
                  </select>
                </div>
              </div>
              <div class="text-center" style="margin-top:50px;"><!--button type="submit">Next</button-->
                <Input type = 'Submit' Name ='Submit' value="Next"  align="center" padding="20px">
              </div>
            </form>
           
          </div><!-- End Contact Form -->
        </div>
      </div>
    </section><!-- End Contact Section -->
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
          window.location.replace('availableflights.jsp')
        }
    </script>

</body>
</html>