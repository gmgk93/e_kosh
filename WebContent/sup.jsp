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
	
		<div class="col-md-6 col-md-offset-1">
		<div class="well">
			<h3 class="no-margin-top text-muted">Sign Up </h3>
			<form name="sign-up-form" id="sign-up-form" method="post" action="Signup.jsp">
			<div id="d-fullname" class="form-group">
				<div class="input-group">
					<span id="fullname-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter your fullname" class="input-group-addon">
						Fullname&nbsp
					</span>
					<input type="text" id="fullname" name="fullname" class="form-control" placeholder="Full name">
				</div>
			</div>	
			<div id="d-email" class="form-group">
				<div class="input-group">
					<span id="email-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter your email" class="input-group-addon">
						&nbsp&nbsp Email &nbsp&nbsp&nbsp
					</span>
					<input type="email" name="email" id="email" class="form-control" placeholder="Email Address">
				</div>
			</div>
				
			<div id="d-mobile" class="form-group">
				<div class="input-group">
					<span id="mobile-tooltip" data-toggle="tooltip" data-placement="left" data-original-title="Please enter mobile number" class="input-group-addon">
						&nbsp&nbsp Mobile &nbsp&nbsp
					</span>
					<input type="text" id="mobile" name="mobile" class="form-control" placeholder="10 digit mobile number">
				</div>
			</div>
						
			<div id="type" class="form-group">
				<div id="d-password" class="form-group">
				<div class="input-group">
				Signup as &nbsp&nbsp&nbsp&nbsp
				  <input type="radio" name="user" value="user" id="user" checked="checked"> User 
				  <input type="radio" name="user" value="third" id="third"> Third Party 
				</div>
			</div>	
			</div>	
			
			<div class="checkbox">
				<label>
				  <input type="checkbox" checked> By signing up I agree the <a href="#">terms</a> and <a href="#">privacy policy</a>
				</label>
			</div>
			<button id="signup" type="button" role="button" class="btn btn-danger width-full cool-text">Sign up</button>
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