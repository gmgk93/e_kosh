<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@include file="/Include.jsp" %>

<%
 	try {
 		 int doc_id = Integer.parseInt(request.getParameter("doc_id_req"));
 		 int third_id = Integer.parseInt((String)session.getAttribute("owner"));
		 String req_by = (String)session.getAttribute("name");
 		 java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		    Statement stmt = con.createStatement();
		    String s;
		    int owner_id;
		   
		  s="select owner_id from docs where id="+doc_id+"";
		    ResultSet rs = stmt.executeQuery(s);
		    rs.next();
		    owner_id  = rs.getInt("owner_id");
		    
		    //while(rs.next()){
		         //Retrieve by column name
		        
		    //}    
		    rs.close();
		         
		    	s="insert into request values(NULL,'" + owner_id + "','" + third_id + "','"+ doc_id + "','"+ req_by + "')";
			    stmt.executeUpdate(s);
			
		    

		   
 			}

	catch(SQLException e) {
	    out.println("failed....\nSQLException caught: " +e.getMessage());
	    }	
 
 %>
