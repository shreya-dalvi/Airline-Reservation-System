<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>
      Skybroker | Payment 
    </title>
  </head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
    <link rel="stylesheet" href="css/pay.css">
    <body style="margin:0; background: #1b2f45;">
     <input type="hidden" name="pnr" value="<%=session.getAttribute("PNRNo")%>"/>
     <input type="hidden" name="flight" value="<%= request.getParameter("flightno") %>"/><br>
        <div class="wrapper">
            <div class="payment">
              <div class="payment-logo" style="background-color: #1b2f45;">
                <img src="imgs/flight.png" style="margin-left: 180px;" alt="">
              </div>
              <h2>Payment Gateway</h2>
              <div class="form">
                <div class="card space icon-relative">
                  <label class="label">Card holder:</label>
                  <input type="text" class="input" placeholder="Card Holder">
                  <i class="fas fa-user"></i>
                </div>
                <div class="card space icon-relative">
                  <label class="label">Card number:</label>
                  <input type="text" class="input" data-mask="0000 0000 0000 0000" placeholder="Card Number">
                  <i class="far fa-credit-card"></i>
                </div>
                <div class="card-grp space">
                  <div class="card-item icon-relative">
                    <label class="label">Expiry date:</label>
                    <input type="text" name="expiry-data" class="input"  placeholder="00 / 00">
                    <i class="far fa-calendar-alt"></i>
                  </div>
                  <div class="card-item icon-relative">
                    <label class="label">CVC:</label>
                    <input type="text" class="input" data-mask="000" placeholder="000">
                    <i class="fas fa-lock"></i>
                  </div>
                </div>
                  
                <button class="btn" style="width:100%; font-size:large; font-weight: bold;" onclick="myFunction()">Pay</button>
               
                <% System.out.println(session.getAttribute("PNRNo")); %>
    </body>
    <script>
        function myFunction() {
          window.location.replace('progress.jsp')
        }
    </script>
        
</html>