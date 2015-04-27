<%@ page import="java.sql.*"%>
<%@ page import="ekosh.sendSms"%>

<%@include file="Include.jsp"%>

<%
	String name = request.getParameter("fullname");
	String email = request.getParameter("email");
	String pswd = sendSms.generateOTP();
	String mobile= request.getParameter("mobile");
	String type = request.getParameter("user");
	try {
	    java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		Statement stmt = con.createStatement();
		
		//sql update querry
		String s = "insert into details values(NULL,'" + email + "','"
				+ name + "','" + pswd + "','" + mobile + "','" + type + "',0)";
		stmt.executeUpdate(s);
		
		String site = new String("index.jsp");
				
		//get id of newly created user to create session variable
		s ="select * from details where email='"+email+"'";
	    ResultSet rs = stmt.executeQuery(s);
	    rs.next();
	    String owner=rs.getString("owner_id");
	    
	    //send otp
	    String msg = "Your one time Password is: "+pswd;
	    sendSms.SMSSender("ishan.int29", "615916", mobile, msg, "WEBSMS", "0");
		session.setAttribute("OTP", "sent");
	    response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
	} catch (SQLException e) {
		out.println("failed....\nSQLException caught: "
				+ e.getMessage());
	}
%>
