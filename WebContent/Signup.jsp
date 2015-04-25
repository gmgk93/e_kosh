<%@ page import="java.sql.*"%>
<%@include file="Include.jsp"%>

<%
	String name = request.getParameter("fullname");
	String email = request.getParameter("email");
	String pswd = request.getParameter("password");
	String mobile= request.getParameter("phone");
	String type = request.getParameter("user");
	try {
	    java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		Statement stmt = con.createStatement();
		
		//sql update querry
		String s = "insert into details values(NULL,'" + email + "','"
				+ name + "','" + pswd + "','" + mobile + "','" + type + "')";
		stmt.executeUpdate(s);
		String site;
		if(type.equals("user"))
			site = new String("user.jsp");
	    else
	    	site = new String("third.jsp");
		
		
		//get id of newly created user to create session variable
		s ="select * from details where email='"+email+"'";
	    ResultSet rs = stmt.executeQuery(s);
	    rs.next();
	    String owner=rs.getString("owner_id");
		
	    //create session variable
	    session.setAttribute("email",email);
    	session.setAttribute("owner",owner);
    	session.setAttribute("name",name);
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
	} catch (SQLException e) {
		out.println("failed....\nSQLException caught: "
				+ e.getMessage());
	}
%>