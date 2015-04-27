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
		<div class="col-md-4 col-md-offset-1">
		<h2> Welcome <% out.print((String)session.getAttribute("name")); %>. </h2><br>
		<h3> Enter Your New Password</h3>
		<form method="post" action="changePswd.jsp" id="pswd-reset" name="pswd-reset">
			<div id='pass_mismatch' class='alert alert-block alert-danger' style="display:none">
				<button type='button' class='close' data-dismiss='alert'></button>
				<span class='alert-heading'><b>Error!</b></span>
				<span class='alert-heading'>Passwords Dont Match</span>
			</div>
			<div id="d-password_log11" class="form-group">
				<div class="input-group">
					<span id="password_log-tooltip1" data-toggle="tooltip" data-placement="left" data-original-title="Please enter your new password" class="input-group-addon">
						<i class="fa fa-lock"></i>
					</span>
					<input type="password" id="password_log11" class="form-control" placeholder="Password" name="password_log11">
				</div>
			</div>	
			<div id="d-password_log12" class="form-group">
				<div class="input-group">
					<span id="password_log-tooltip2" data-toggle="tooltip" data-placement="left" data-original-title="Please reenter your password" class="input-group-addon">
						<i class="fa fa-lock"></i>
					</span>
					<input type="password" id="password_log12" class="form-control" placeholder="Reenter Password" name="password_log12">
				</div>
			</div>
  		</form>
			<button id="but_pswd_reset" type="button" role="button" class="btn btn-primary cool-text">Change Password</button>
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