<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.lang.*" %>



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
  
  
  <!--To check if redirected from OTP page-->
  <script type="text/javascript">  
	if(<%= (String)session.getAttribute("OTP")=="sent" %>)
	alert("Please enter OTP recieved on your phone as your password");	
	</script>
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
	<div class="row">
	  <div class="col-md-6 col-md-offset-1">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox"  style=" width: 800px height:300px">
			<div class="item active">
			  <img src="./img/a.png">
			</div>
			<div class="item">
			  <img src="./img/b.png" alt="...">
			</div>
			<div class="item">
			  <img src="./img/c.png" alt="...">
			</div>
			<div class="item">
			  <img src="./img/d.png" alt="...">
			</div>
			<div class="item">
			  <img src="./img/e.png" alt="...">
			</div>
			<div class="item">
			  <img src="./img/f.png" alt="...">
			</div>
		 </div>
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		  </a>
		</div>
	  </div>
	  <div class="col-md-4 margin-top pull-right">
		
		<div class="well">
			<h3 class="no-margin-top text-muted">Login to your account </h3>
				<form method="post" action="login.jsp" id="login-form" name="login-form">
				<% 
					String msg = request.getParameter("msg");
				   	if (msg != null){
						out.write("<div id='inv-pass' class='alert alert-block alert-danger'>");
							out.write("<button type='button' class='close' data-dismiss='alert'></button>");
							out.write("<span class='alert-heading'><b>Error!</b></span>");
							out.write("<span class='alert-heading'>Invalid username or password</span>");
						out.write("</div>");
					}
				%>	
				<div id="d-email_log" class="form-group">
					<div class="input-group">
						<span id="email_log-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter your email" class="input-group-addon">
							<i class="fa fa-envelope"></i>
						</span>
						<input type="email" id="email_log" class="form-control" placeholder="Email Address" name="email">
					</div>
				</div>		
				<div id="d-password_log" class="form-group">
					<div class="input-group">
						<span id="password_log-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter your password" class="input-group-addon">
							<i class="fa fa-lock"></i>
						</span>
						<input type="password" id="password_log" class="form-control" placeholder="Password" name="pswd">
					</div>
				</div>
				<div class="checkbox">
	                <label>
	                    <input id="remember" type="checkbox" checked=""> Remember me  &nbsp; - &nbsp; <a href="#">Forgot password</a>
	                </label>
                </div>
                </form>
				<button id="login" type="button" role="button" class="btn btn-primary cool-text">Login</button>
							
				<h3 class="no-margin-top text-muted">Don't have an account</h3> 
				<a href="sup.jsp"><button id="" type="button" role="button" class="btn btn-danger width-full cool-text">Sign up</button></a>					
		</div>
	</div>
	</div><br/>
	<div class="row">
		<div class="col-md-6 col-md-offset-1">
			<P class="c">
				e-Pramaan is a National e-Authentication service offered by DeitY.
				e-Pramaan provides a simple, convenient and secure way for the users to access government services via internet/mobile as well as for the government to assess the authenticity of the users. e-Pramaan builds up confidence and trust in online transactions and encourages the use of the e-services as a channel for service delivery. 
				Major Components of e-Pramaan includes: 
				  - Identity Management (including Credential Registration) 
				  - e-Authentication (including Step-up Authentication) 
				  - Single Sign-on 
				  - Aadhaar based credential verification .....More
				<CODE>margin-left</CODE> of 20 pixels.
			</P>
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