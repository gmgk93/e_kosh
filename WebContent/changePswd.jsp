<%@ page import="java.sql.*"%>
<%@ page import="ekosh.sendSms"%>

<%@include file="Include.jsp"%>

<%
	String pswd = request.getParameter("password_log11");
	String email = (String)session.getAttribute("email");
	String type = (String)session.getAttribute("type");
	try {
	    java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		Statement stmt = con.createStatement();
		
		//sql update querry
		String s = "UPDATE details SET pswd='"+pswd+"',verified=1 where email='"+email+"'";
		stmt.executeUpdate(s);
		String site;		
		if(type.equals("user"))
    		site = new String("user.jsp");
    	else
    		site = new String("third.jsp");
    	
    	response.setStatus(response.SC_MOVED_TEMPORARILY);
    	response.setHeader("Location", site);
    	
	} catch (SQLException e) {
		out.println("failed....\nSQLException caught: "
				+ e.getMessage());
	}
%>