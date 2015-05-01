<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@include file="/Include.jsp"%>

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);

	try {
		String email_id = (String) session.getAttribute("email");

		if (email_id == null) {
			response.sendRedirect("index.jsp");
		}

	} catch (Exception e)

	{
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
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
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
		  <button type="button" class="navbar-toggle collapsed" data-hover="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="#">Home</a>
		</div></div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		 <ul class="nav1 navbar-nav">
			<li class="dropdown1">
			  <a href="#" class="navbar-brand" data-toggle="dropdown" role="button" aria-expanded="false"><span aria-hidden="true">Registration</span></a>
			  <ul class="dropdown-menu" role="menu">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li class="divider"></li>
				<li><a href="#">Separated link</a></li>
			  </ul>
			</li>
			<li class="dropdown1">
			  <a href="#" class="navbar-brand" data-toggle="dropdown" role="button" aria-expanded="false"><span aria-hidden="true">Resources</span></a>
			  <ul class="dropdown-menu" role="menu">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li class="divider"></li>
				<li><a href="#">Separated link</a></li>
			  </ul>
			</li>
			<li class="dropdown1">
			  <a href="#" class="navbar-brand" data-toggle="dropdown" role="button" aria-expanded="false"><span aria-hidden="true">Contact Us</span></a>
			  <ul class="dropdown-menu" role="menu">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li class="divider"></li>
				<li><a href="#">Separated link</a></li>
			  </ul>
			</li>
		 </ul>
		</div><!-- /.navbar-collapse -->
	   </div><!-- /.container-fluid -->
	</nav>
 
<div class="container-fluid">
	<br/>
	
	<!-- enter body here -->
	<div class="col-md-6 col-md-offset-1">
		<div class="well">
			<h3 class="no-margin-top text-muted">Request For New Keypair </h3>
			<form name=new-key-form id="new-key-form" method="post" action="newKey.jsp">
			<div id="d-fullname" class="form-group">
				<div class="input-group">
					<span id="fullname-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter your name" class="input-group-addon">
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbspName&nbsp&nbsp&nbsp&nbsp&nbsp
					</span>
					<input type="text" id="name" name="name" class="form-control" placeholder="Name">
				</div>
			</div>	
			<div id="key-pswd" class="form-group">
					<div class="input-group">
						<span id="key-pswd-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter your password" class="input-group-addon">
							&nbsp&nbsp&nbspPassword&nbsp&nbsp
						</span>
						<input type="password" id="key-pswd-new" class="form-control" placeholder="Password" name="key-pswd-new">
					</div>
				</div>
			<div id="d-orgUnit" class="form-group">
				<div class="input-group">
					<span id="orgUnit-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter the name of your Organisational Unit" class="input-group-addon">
						&nbsp&nbspUnit Name&nbsp&nbsp
					</span>
					<input type="text" id="orgUnit" name="orgUnit" class="form-control" placeholder="Organisational Unit Name">
				</div>
			</div>
			<div id="d-org" class="form-group">
				<div class="input-group">
					<span id="org-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter the name of your Organisation" class="input-group-addon">
						Organisation
					</span>
					<input type="text" id="orgName" name="orgName" class="form-control" placeholder="Organisation Name">
				</div>
			</div>
			<div id="d-city" class="form-group">
				<div class="input-group">
					<span id="city-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter the name of your city" class="input-group-addon">
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCity&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					</span>
					<input type="text" id="cityName" name="cityName" class="form-control" placeholder="City Name">
				</div>
			</div>
			<div id="d-state" class="form-group">
				<div class="input-group">
					<span id="State-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter the name of your state" class="input-group-addon">
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbspState&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					</span>
					<input type="text" id="stateName" name="stateName" class="form-control" placeholder="State Name">
				</div>
			</div>
			<div id="d-country" class="form-group">
				<div class="input-group">
					<span id="country-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter the name of your country" class="input-group-addon">
						&nbsp&nbsp&nbsp&nbspCountry&nbsp&nbsp&nbsp&nbsp
					</span>
					<input type="text" id="countryName" name="countryName" class="form-control" placeholder="Country Name">
				</div>
			</div>
			<button id="newKeyFormButton" type="button" role="button" class="btn btn-danger width-full cool-text">Request New Key</button>
			</form>
		</div>
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