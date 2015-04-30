<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ekosh.sendSms"%>
<%@ page import="java.sql.*"%>
<%@include file="/Include.jsp" %>

<%
int owner_id=0;
int doc_id=0,third_id=0;
String req_by="",mobile="";
 	try {
 		 doc_id = Integer.parseInt(request.getParameter("doc_id_req"));
 		 third_id = Integer.parseInt((String)session.getAttribute("owner"));
         req_by = (String)session.getAttribute("name");
 		 java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		    Statement stmt = con.createStatement();
		    String s;
		
		   
		  s="select owner_id from docs where id="+doc_id+"";
		    ResultSet rs = stmt.executeQuery(s);
		    rs.next();
		    owner_id  = rs.getInt("owner_id");
		    rs.close();
		         
		    	s="insert into request values(NULL,'" + owner_id + "','" + third_id + "','"+ doc_id + "','"+ req_by + "')";
			    stmt.executeUpdate(s);
			
 			}

	catch(SQLException e) {
	    out.println("failed....\nSQLException caught: " +e.getMessage());
	    }	
 
 	if(owner_id!=0)
 	{
 		try {
 	 		 java.sql.Connection con;
 			    Class.forName("com.mysql.jdbc.Driver");
 			    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
 			    Statement stmt = con.createStatement();
 			    String s;
 			   
 			   
 			  s="select mobile from details where owner_id="+owner_id+"";
 			    ResultSet rs = stmt.executeQuery(s);
 			    rs.next();
 			    mobile  = rs.getString("mobile");
 			    rs.close();
 			    
 			  //SENDING SMS TO USER UPON REQUEST BY THIRD
 			   String msg = "Your document "+doc_id+" is requested by "+req_by+".Please login to provide access.";
 			   sendSms.SMSSender("gmgk93", "466639", mobile, msg, "WEBSMS", "0");
 			   
 				
 	 			}

 		catch(SQLException e) {
 		    out.println("failed....\nSQLException caught: " +e.getMessage());
 		    }	
 	 
 		
 		
 	}
 	
 %>
