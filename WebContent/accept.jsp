<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%@include file="Include.jsp"%>	


<%
int doc_id = Integer.parseInt(request.getParameter("doc_id"));
int third_id = Integer.parseInt(request.getParameter("third_id"));
int req_id = Integer.parseInt(request.getParameter("req_id"));


try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
    Statement stmt = con.createStatement();
    
    String s="insert into permissions values(NULL,'" + third_id + "','"
			+doc_id+ "')";
    stmt.executeUpdate(s);
    
    s="delete from request where id="+req_id;
    stmt.executeUpdate(s);
}
catch(SQLException e) {
    out.println("failed....\nSQLException caught: " +e.getMessage());}

String site = "user.jsp" ;
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site); 

%>