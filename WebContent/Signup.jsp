<%@ page import="java.sql.*"%>
<%@include file="Include.jsp"%>

<%
	String name = request.getParameter("fullname");
	String email = request.getParameter("email");
	String pswd = request.getParameter("password");
	try {
	    java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		Statement stmt = con.createStatement();
		String s = "insert into details values(NULL,'" + email + "','"
				+ name + "','" + pswd + "')";
		stmt.executeUpdate(s);
		String site = new String("user.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
	} catch (SQLException e) {
		out.println("failed....\nSQLException caught: "
				+ e.getMessage());
	}
%>