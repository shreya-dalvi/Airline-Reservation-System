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
<meta charset="UTF-8">
  <title>SkyBroker | Boarding Pass</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css'><link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/main.css">
</head>
<body>
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

//System.out.println(request.getParameter("pnr"));
%>
<input type="hidden" name="source" value="<%=request.getParameter("source")%>"/><br>
<input type="hidden" name="typ" value="<%=request.getParameter("typ")%>"/><br>
<%
try{
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
//String sql="select * from databaseflight";
String sql ="select * from passenger where PNR='" + session.getAttribute("PNRNo")+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<div class="container" id="container">
	<div class="ticket airline">
		<div class="top">
			<h1>Boarding Pass</h1>
			<div class="big">
			 <img src="imgs/logo.png" alt="" style="height: 130px; width: 150px;"> 
			</div>
			<div class="top--side">
				<i class="fas fa-plane" style="color: #fff;"></i>
				<p style="font-size: 16px;"> <%=resultSet.getString("src") %>&nbsp; <i class="fas fa-arrow-right" style="font-size: 15px;"></i>
				<p style="font-size: 16px;"><%=resultSet.getString("dest") %></p>
			</div>
		</div>
		<div class="bottom">
			<div class="column">
				<div class="row row-1">
					<p><span>Flight</span><%=resultSet.getString("flino") %></p>
					<p><span>PNR</span><%=session.getAttribute("PNRNo")%></p>
					<p class="row--right"><span>Gate</span>B3</p>
				</div>
				<div class="row row-2">
					<p><span>Boards</span><%=resultSet.getString("aTime") %></p>
					<p class="row--center"><span>Departs</span><%=resultSet.getString("dTime") %></p>
					<p class="row--right"><span>Arrives</span><%=resultSet.getString("dTime") %></p>
				</div>
				<div class="row row-3">
					<p><span>Passenger</span><%=resultSet.getString("name") %></p>
					<p class="row--center"><span>Seat</span>11E</p>
					<p class="row--right"><span>Group</span>3</p>
				</div>
			</div>
			<div class="bar--code"></div>
		</div>
	</div>
</div>
<%
}} catch (Exception e){
e.printStackTrace();
}
%>
</div>
	</div>
</div>
<div class="text-center" style="margin-top:30px; margin-bottom: 50px;"><button type="submit" onclick="generatepdf()">Download PDF</button>
</div>
<!-- partial -->
  <script  src="js/script.js"></script>

</body>
<script src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>
    <script>
		function generatepdf()
			{
				const element = document.getElementById("container")
				element.style.borderColor = "black";
				html2pdf()
				.from(element)
				.save();
			}
	</script>
</html>
