<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@include file="/Include.jsp" %>
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
	
	
	
 
	<div class="container-fluid">
		<br/>
			<div class="row">
				<div class="col-lg-2 col-md-offset-1">
					<div class="input-group">
						<input type="text" placeholder="enter document id" id="doc_id" name ="doc_id" class="form-control">
					</div><!-- /input-group -->
				</div>
				<div class="btn-group">
					<input type="button" class="btn btn-default" value="Search" name="but" id="but">
				</div>
				<div class="row">
				<div class="btn-group col-md-offset-3">
					<div class='col-md-offset-10'><a href='print.jsp'><button type='submit' style='margin-left:280px' class='btn btn-default'>Profile Details</button></a></div>
					</br></hr>
				</div>
				</div>	
			</div>
				
		</br>
			<div class="row" style="display:none" id="searchPanel">
				<div class="panel panel-default col-md-offset-3" style="width:650px" >
				<!-- Default panel contents -->
					<div class="panel-heading"><b>Search Result</b></div>
						<div class="panel-body">
							<div id="docBody" style="margin-left:30px">
							</div>
						</div>
					</div>
				</div>
				<br/><br/>
			
			<div class="row">
				<div class="panel panel-default col-md-offset-1" style="width:1000px">
				<!-- Default panel contents -->
					<div class="panel-heading"><b>Recently Viewed Documents</b></div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
								  <tr> <th text-align=center> Sl. No. </th> <th> ID </th> <th> Name of the Doc</th> <th> Date of Uploading </th> <th> Verification Status </th><th> Privacy </th></tr>
								  <tbody>
								  <%
								  	try {
								  		String viewer_id = (String)session.getAttribute("owner");
										java.sql.Connection con;
									    Class.forName("com.mysql.jdbc.Driver");
									    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
									    Statement stmt = con.createStatement();
									    String s="select d.id,d.name,d.uploaded_on,d.privacy from docs d,recentdocs rd where rd.doc_id=d.id and rd.viewer_id="+viewer_id;
									    ResultSet rs = stmt.executeQuery(s);
									    int i=0;
									    while(rs.next()){
									       //Retrieve by column name
									       String name = rs.getString("name");
									       String id = rs.getString("id");
									       String date = rs.getString("uploaded_on");
									       String privacy = rs.getString("privacy");
									
									       //Display values
									       out.print(" <tr align=center><td><b>#"+(++i)+"</td><td><a href='" + "retriveImage?" + id + "'  rel='lightbox'>"+id+"</a></td> <td>"+name+"</td> <td>"+date+" </td> <td> Verified </td><td>"+privacy+" </td></tr>");
										}
									    if(i == 0)
									    	out.print("<td colspan='7' align='center'>No Document Viewed Recently</td>");
									    rs.close();
						  			}
									catch(SQLException e) {
									    out.println("failed....\nSQLException caught: " +e.getMessage());
								    }	
								  %>
								  </tbody>
								</table>
							</div>
						</div>
				</div>	  
			</div>
				
				
				
	</div>
	<br/>
	

<br/><hr class="one2"/>
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
