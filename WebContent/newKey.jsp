<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.*"%>

<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="/Include.jsp"%>
<%@ page import="ekosh.digiSign"%>

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

<%
int id	=	Integer.parseInt((String)session.getAttribute("owner"));
String name = request.getParameter("name");
String pass = request.getParameter("key-pswd-new");
String unitName = request.getParameter("orgUnit");
String orgName = request.getParameter("orgName");
String city = request.getParameter("cityName");
String state = request.getParameter("stateName");
String country = request.getParameter("countryName");

//register new key request
try {
	    java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		Statement stmt = con.createStatement();
		
		//sql update querry
		String s = "insert into keyrequest values("+ id +",'" + name + "','"
				+ pass + "','" + unitName + "','" + orgName + "','" + city + "','"+ state +"','"+ country +"')";
		stmt.executeUpdate(s);
		String site = new String("user.jsp");
		
		//append details into the key.properties file
		String key_property = "\nuser"+ (String)session.getAttribute("owner")+"="+pass;
		File file =new File(digiSign.PATH);
		FileWriter fileWritter = new FileWriter(file,true);
		BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
		bufferWritter.write(key_property);
		bufferWritter.close();
			
	    response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
	} catch (SQLException e) {
		out.println("failed....\nSQLException caught: "
				+ e.getMessage());
	}


%>