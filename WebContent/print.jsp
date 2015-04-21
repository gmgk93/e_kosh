<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>


<%
       try
		{
    	   String email_id = (String)session.getAttribute("email");
    	   
    	   
		if(email_id==null)
		{
			response.sendRedirect("index.jsp");
		}
		
		}
catch(Exception e)

{
	e.printStackTrace();
}
		
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-kosh</title>

    <!-- Bootstrap -->
    <link href="bootstrap/CSS/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/CSS/my.css" rel="stylesheet">
	<link href="bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap/CSS/lightbox.css" type="text/css" media="screen" />
	<script type="text/javascript" src="bootstrap/js/lightbox.js"></script>
    
  </head>
  
  <body>
	<div class="one">
	<div id="container_header" class="container">
	<div id="Llogo">
		<a href="http://www.bmsce.ac.in/" target="_blank" title="DeitY"></a><center><a href="http://www.bmsce.ac.in/" target="_blank" title="DeitY"><img src="img/bms.png" style="height:140px"></a></div>
	<div id="Clogo">
		<a href="http://www.ekosh.gov.in/" target="_blank" title="DeitY"></a><center><a href="http://www.ekosh.gov.in/" target="_blank" title="DeitY"><img src="./img/ekosh.jpg" style="height:140px"></a></div>
	<div id="Rlogo">
		<a href="http://www.cdac.in/" target="_blank" title="DeitY"></a><center><a href="http://www.cdac.in/" target="_blank" title="DeitY"><img src="./img/cdac.png"></a></div>
		</div>
	<nav class="navbar navbar-default" role="navigation">
	  <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="col-md-offset-1">
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		 
		</div></div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		
		 <ul class="nav navbar-nav navbar-right">
			<li><a href="#">Welcome User!!</a></li>
			<li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-list" aria-hidden="true"></span></a>
			  <ul class="dropdown-menu" role="menu">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li class="divider"></li>
				<li><a href="#">Separated link</a></li>
			  </ul>
			</li>
			<li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a>
			  <ul class="dropdown-menu" role="menu">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li class="divider"></li>
				<li><a href="#">Separated link</a></li>
			  </ul>
			</li>
			<li><a href="logout.jsp">Sign out</a></li>
			<div class="col-md-1"></div>
		  </ul>
		</div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>

	 <hr/>
<div class="container-fluid">
	<br/>
		<div class="col-md-offset-1"><h3 class="no-margin-top text-muted">User Details </h3></div><br/>
		<div class=" col-md-6 col-md-offset-2">
		<div class='col-md-offset-10'><a href='print.jsp?email="+email+"'><button type='submit' value='print' onClick='window.print()' class='btn btn-default'>Print</button></a></div><br>
		<table class="table table-bordered table-striped no-margin-bottom" id="userTable">
						
		<%
		try {
			String email_id = (String)session.getAttribute("email");
			
		    java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "");
		    Statement stmt = con.createStatement();  
		    String s="select * from details where email='"+email_id+"'";
		    ResultSet rs = stmt.executeQuery(s);
		    //STEP 5: Extract data from result set
		    while(rs.next()){
		       //Retrieve by column name
		       String name = rs.getString("name");
		       String email = rs.getString("email");
		       String passrd = rs.getString("pswd");
		
		       //Display values
		       out.print("<tbody><tr><th>Name</th><td>"+name+"</td></tr>");
			   out.print("<tr><th>Email</th><td>"+email+"</td></tr>");
			   out.print("<tr><th>Password</th><td>"+passrd+"</td></tr></tbody>");
			   
		    	
				
				
			}
		    rs.close();
		    out.print("</tbody></table>");
		}
		catch(SQLException e) {
		    out.println("failed....\nSQLException caught: " +e.getMessage());}
		%>
		</div>
	
</div><br/><hr class="one2"/>
<div class="footer">
	
	<p>&nbsp;&nbsp;&nbsp;<a href="http://epramaan.gov.in/index.jsp">Home</a> | <a href="http://epramaan.gov.in/service.jsp">e-Governance Services</a> | <a href="http://epramaan.gov.in/faq.jsp">FAQs</a> | <a href="http://epramaan.gov.in/aboutcdac.jsp">About C-DAC  </a> | <a href="http://www.deity.gov.in/">About DeitY  </a></p>
	</div> <br/>
 
 </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/my.js"></script>
  </body>
</html>