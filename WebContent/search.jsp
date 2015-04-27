<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@include file="/Include.jsp" %>

<%
 	try {
 		 String doc_id = request.getParameter("doc_id");
 		 int viewer_id = Integer.parseInt((String)session.getAttribute("owner"));
		 java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		    Statement stmt = con.createStatement();
		    
		    String s = "select * from recentdocs rd,docs d where viewer_id="+viewer_id+" and doc_id="+doc_id;
		    ResultSet rs = stmt.executeQuery(s);
		    if(!rs.next()){
		    	s = "insert into recentdocs values(NULL,"+doc_id+","+viewer_id+")";
			    stmt.executeUpdate(s);
			}
		    
		    s="select id,name,uploaded_on,privacy from docs where id="+doc_id+" and privacy='public'";
		    rs = stmt.executeQuery(s);
		    int i=0;
		    while(rs.next()){
		       //Retrieve by column name
		       String name = rs.getString("name");
		       String id = rs.getString("id");
		       String date = rs.getString("uploaded_on");
		       String privacy = rs.getString("privacy");
		       ++i;
		
		       //Display values
		       out.print(" <img src='" + "retriveImage?" + id + "'height='400'/><br/>");
		       out.print("<br/><br/><table class='table table-bordered table-striped no-margin-bottom'>");
		       out.print("<tr><td><b>Name</b></td><td>"+name+"</td></tr>");
		       out.print("<tr><td><b>ID</b><td>"+id+"</td></tr>");
		       out.print("<tr><td><b>Upload Date</b><td>"+date+"</td></tr>");
		       out.print("<tr><td><b>Privacy</b><td>"+privacy+"</td></tr>");
		       out.print("</table>");
		    }if(i==0)
		    	out.print("<center><h2>Document Not Found</h2></center><br/><left><h3>Possible reasons</h3><br/><li>Wrong document number</li><li>Document is private. Please request user</li></left>");
		    
		    rs.close();
 			}
		
	   

	catch(SQLException e) {
	    out.println("failed....\nSQLException caught: " +e.getMessage());
	    }	
 
 %>
