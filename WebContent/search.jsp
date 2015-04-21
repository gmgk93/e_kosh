<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@include file="/Include.jsp" %>

<%
 	try {
 		
		 java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		    Statement stmt = con.createStatement();
		    String s="select id,name,uploaded_on,privacy from docs where id="+request.getParameter("doc_id");
		    ResultSet rs = stmt.executeQuery(s);
		    int i=1;
		    while(rs.next()){
		       //Retrieve by column name
		       String name = rs.getString("name");
		       String id = rs.getString("id");
		       String date = rs.getString("uploaded_on");
		       String privacy = rs.getString("privacy");
		
		       //Display values
		       out.print(" <tr align=center><td><b>#"+(i++)+"</td> <td> <input type='checkbox'/> </td><td><a href='" + "retriveImage?" + id + "'  rel='lightbox'>"+id+"</a></td> <td>"+name+"</td> <td>"+date+" </td> <td> Verified </td><td>"+privacy+" </td></tr>");
			}
		    rs.close();
 			}
		
	   

	catch(SQLException e) {
	    out.println("failed....\nSQLException caught: " +e.getMessage());
	    }	
 
 %>