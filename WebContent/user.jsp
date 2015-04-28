<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@include file="/Include.jsp"%>




<script type="text/javascript">  
if(<%=request.getAttribute("javax.servlet.forward.request_uri") != null%>)
alert('Hello, <%=request.getAttribute("Message")%>
	');
</script>



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
<link href="bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="bootstrap/CSS/lightbox.css" type="text/css"
	media="screen" />
<script type="text/javascript" src="bootstrap/js/lightbox.js"></script>

</head>
<body>
	<div class="one">
		<div id="container_header" class="container">
			<div id="Llogo">
				<a href="http://www.bmsce.ac.in/" target="_blank" title="DeitY"></a>
				<center>
					<a href="http://www.bmsce.ac.in/" target="_blank" title="DeitY"><img
						src="img/bms.png" style="height: 140px"></a>
			</div>
			<div id="Clogo">
				<a href="http://www.ekosh.gov.in/" target="_blank" title="DeitY"></a>
				<center>
					<a href="http://www.ekosh.gov.in/" target="_blank" title="DeitY"><img
						src="./img/ekosh.jpg" style="height: 140px"></a>
			</div>
			<div id="Rlogo">
				<a href="http://www.cdac.in/" target="_blank" title="DeitY"></a>
				<center>
					<a href="http://www.cdac.in/" target="_blank" title="DeitY"><img
						src="./img/cdac.png"></a>
			</div>
		</div>
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="col-md-offset-1">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Home</a>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav1 navbar-nav">
						<li class="dropdown1"><a href="#" class="navbar-brand"
							data-toggle="dropdown" role="button" aria-expanded="false"><span
								aria-hidden="true">Registration</span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
						<li class="dropdown1"><a href="#" class="navbar-brand"
							data-toggle="dropdown" role="button" aria-expanded="false"><span
								aria-hidden="true">Resources</span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
						<li class="dropdown1"><a href="#" class="navbar-brand"
							data-toggle="dropdown" role="button" aria-expanded="false"><span
								aria-hidden="true">Contact Us</span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Welcome <%
							out.print((String) session.getAttribute("name"));
						%></a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><span
								class="glyphicon glyphicon-list" aria-hidden="true"></span></a>
							<ul class="dropdown-menu" role="menu">
								<%
									try {
										java.sql.Connection con;
										Class.forName("com.mysql.jdbc.Driver");
										con = DriverManager.getConnection(dbURL + dbName, dbUser,
												dbPass);
										Statement stmt = con.createStatement();

										String s = "select * from request where owner_id="
												+ session.getAttribute("owner") + "";//replace owner id with sessin variable
										ResultSet rs = stmt.executeQuery(s);
										int i = 1;
										while (rs.next()) {
											//Retrieve by column name

											//Display values
											out.print("<li class='list-group-item'><a class='list-group-link' href='http://stackoverflow.com'>Your document "
													+ rs.getString("doc_id")
													+ " is requested by "
													+ rs.getString("req_by")
													+ "</a><a class='btn btn-sm btn-default' href='http://google.com'>Accept</a></li>");
										}
										rs.close();
									} catch (SQLException e) {
										out.println("failed....\nSQLException caught: "
												+ e.getMessage());
									}
								%>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><span
								class="glyphicon glyphicon-cog" aria-hidden="true"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
						<li><a href="logout.jsp">Sign out</a></li>

						<div class="col-md-1"></div>
						
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>



		<div class="container-fluid">
			<br />
			<div class="row">
				<div class="col-lg-2 col-md-offset-1">
					<div class="input-group">
						<input type="text" placeholder="enter detail" class="form-control">
					</div>
					<!-- /input-group -->
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false">
						Search <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">By Name</a></li>
						<li><a href="#">By ID</a></li>

					</ul>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="btn-group col-md-offset-3">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" style="width: 83px" aria-expanded="false">
						Sort <span class="caret" style="margin-left: 20px"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">By Name</a></li>
						<li><a href="#">By Date</a></li>
						<li><a href="#">By Status</a></li>
					</ul>

					<div class='col-md-offset-10'>
						<a href='print.jsp'><button type='submit'
								style='margin-left: 280px' class='btn btn-default'>Profile
								Details</button></a>
					</div>

					</br>
					</hr>
				</div>
			</div>
			<br />


			<div class="row">
				<div class="panel panel-default col-md-offset-1"
					style="width: 1000px">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<b>List of Docs Uploaded</b>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<tr>
									<th text-align=center>Sl. No.</th>
									<th>Select<input type="checkbox" id="mainCheckbox"
										style="margin-left: 5px" /></th>
									<th>ID</th>
									<th>Name of the Doc</th>
									<th>Date of Uploading</th>
									<th>Verification Status</th>
									<th>Privacy</th>
								</tr>
								<tbody>
									<%
										try {
											java.sql.Connection con;
											Class.forName("com.mysql.jdbc.Driver");
											con = DriverManager.getConnection(dbURL + dbName, dbUser,
													dbPass);
											Statement stmt = con.createStatement();
											String s = "select id,name,uploaded_on,privacy from docs where owner_id="
													+ session.getAttribute("owner");//replace owner id with sessin variable
											ResultSet rs = stmt.executeQuery(s);
											int i = 1;
											while (rs.next()) {
												//Retrieve by column name
												String name = rs.getString("name");
												String id = rs.getString("id");
												String date = rs.getString("uploaded_on");
												String privacy = rs.getString("privacy");

												//Display values
												out.print(" <tr align=center><td><b>#"
														+ (i++)
														+ "</td> <td> <input type='checkbox' class='checkbox1'/> </td><td><a href='"
														+ "retriveImage?" + id + "'>" + id
														+ "</a></td> <td>" + name + "</td> <td>" + date
														+ " </td> <td> Verified </td><td>" + privacy
														+ " </td></tr>");
											}
											rs.close();
										} catch (SQLException e) {
											out.println("failed....\nSQLException caught: "
													+ e.getMessage());
										}
									%>

								</tbody>
							</table>
						</div>
						<div class="btn-group btn-group-md" style="margin-left: 125px"
							role="toolbar" aria-label="...">
							<button type="button" class="btn btn-default">Delete</button>
						</div>
					</div>
				</div>
			</div>


			<br>
			<br>
			<div class="row">
				<div class="panel panel-default col-md-offset-1"
					style="width: 1000px">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<b>Add new document here</b>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-6 col-md-offset-1">
								<form method="post" action="uploadServlet"
									enctype="multipart/form-data" id="uploadForm">
									<div class="row">
										<div class="col-md-4 ">Type of Document</div>
										<div class="col-md-5">
											<select class="btn btn-default" name="type">
												<option value="PAN Card">PAN Card</option>
												<option value="Driver's License">Driver's License</option>
												<option value="Passport">Passport</option>
												<option value="other">other</option>
											</select>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-md-4">Name of Document</div>
										<div class="col-md-5">
											<div class="input-group">
												<input type="text" placeholder="enter name"
													class="form-control" name="docname" id="docname">
											</div>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-md-4">Privacy</div>
										<div class="col-md-5">
											<div class="input-group">
												<input type="radio" name="privacy" value="private"
													id="private" checked="checked"> Private <input
													type="radio" name="privacy" value="public" id="public">
												Public
											</div>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-md-7">
											<div class="input-group">
												<input type="file" name="file" id="file"
													class="form-control" placeholder="">
											</div>
										</div>
										<button type="button" class="btn btn-default"
											id="uploadButton">Upload</button>
									</div>
								</form>
							</div>
							<div class="col-md-4 " style="border-style: outset">
								<br />
								<div class="row">
									<div class="col-md-10 col-md-offset-1">
										<center>
											<b>Document Not Signed? Sign it Here.</b>
										</center>
									</div>
								</div>
								<br />
								<form action="uploadForSigning.jsp" method="post"
									enctype="multipart/form-data" id="sign-file-form">
									<div class="row">
										<div class="col-md-10 col-md-offset-1">
											<div class="input-group">
												<input type="file" name="signfile" id="signfile"
													class="form-control" placeholder="">
											</div>
										</div>
									</div>
									<br />
								</form>
								<div class="row">
									<div class="col-md-9 col-md-offset-4">
										<button type="button" class="btn btn-default" id="signButton">Sign
											it Now</button>
									</div>
								</div>
								<br />
							</div>
						</div>
						<br />
					</div>
				</div>
			</div>
			<br /> <br />
			<hr class="one2" />


		</div>

		<div class="footer">

			<p>
				&nbsp;&nbsp;&nbsp;<a href="http://epramaan.gov.in/index.jsp">Home</a>
				| <a href="http://epramaan.gov.in/service.jsp">e-Governance
					Services</a> | <a href="http://epramaan.gov.in/faq.jsp">FAQs</a> | <a
					href="http://epramaan.gov.in/aboutcdac.jsp">About C-DAC </a> | <a
					href="http://www.deity.gov.in/">About DeitY </a>
			</p>
		</div>
		<br />

	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/my.js"></script>
</body>
</html>
