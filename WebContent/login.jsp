<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%@include file="Include.jsp"%>	
<%
String email = request.getParameter("email");
String pswd = request.getParameter("pswd");
try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
    Statement stmt = con.createStatement();
    String s="select * from details where email='"+email+"'and pswd='"+pswd+"'";
    ResultSet rs = stmt.executeQuery(s);
    rs.last();
    if(rs.getRow()==1){
    	String site = new String("user.jsp");
    	
    	//Extracting name and owner_id
    	String owner=rs.getString("owner_id");
    	String name=rs.getString("name");
    	
    	//create session variable
    	session.setAttribute("email",email);
    	session.setAttribute("owner",owner);
    	session.setAttribute("name",name);
 	   	
    	response.setStatus(response.SC_MOVED_TEMPORARILY);
 	  	response.setHeader("Location", site);
	
	}
    else
    {
    	String error="Wrong";
    	String site = new String("index.jsp?msg="+error);
	 	   response.setStatus(response.SC_MOVED_TEMPORARILY);
	 	   response.setHeader("Location", site);
	 	   
    	
    }
}
catch(SQLException e) {
    out.println("failed....\nSQLException caught: " +e.getMessage());}
%>
