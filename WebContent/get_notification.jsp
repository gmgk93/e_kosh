<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ekosh.sendSms"%>

<%@include file="Include.jsp"%>	
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
	int i = 0;
	while (rs.next()) {
		//Retrieve by column name
		++i;
		//Display values
		out.print("<li class='list-group-item'><div><a class='list-group-link' href='#'>Your document "+rs.getString("doc_id")+" is requested by "+rs.getString("req_by")+"</a><a class='btn btn-sm btn-default'  href='accept.jsp?doc_id="+rs.getString("doc_id")+"&third_id="+rs.getString("third_id")+"&req_id="+rs.getString("id")+"'>Accept</a><a class='btn btn-sm btn-default'>Reject</a></div></li>");
	}
	if(i ==0){
		out.print("<li class='list-group-item'>You have no new notification</li>");
	}
	rs.close();
} catch (SQLException e) {
	out.println("failed....\nSQLException caught: "
			+ e.getMessage());
}
%>
