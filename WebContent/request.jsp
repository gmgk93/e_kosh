<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@include file="/Include.jsp" %>

<%
 	try {
 		 int doc_id = Integer.parseInt(request.getParameter("doc_id_req"));
 		 int third_id = Integer.parseInt((String)session.getAttribute("owner"));
		 java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		    Statement stmt = con.createStatement();
		    String s;
		    int owner_id;
		   
		//    s="select owner_id from docs where id=6";//+doc_id+"";
		  //  ResultSet rs = stmt.executeQuery(s);
		   // owner_id  = rs.getInt("owner_id");
		    
		    //while(rs.next()){
		         //Retrieve by column name
		        
		    //}    
		 //   rs.close();
		         
		    	s="insert into request values(NULL,10,'" + third_id + "','"+ doc_id + "')";
			    stmt.executeUpdate(s);
			
		    

		   
 			}

	catch(SQLException e) {
	    out.println("failed....\nSQLException caught: " +e.getMessage());
	    }	
 
 %>
