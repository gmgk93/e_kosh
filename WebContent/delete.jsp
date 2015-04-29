<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@include file="Include.jsp"%>	


<%

 String[] doc_id;
doc_id=request.getParameterValues("checkbox");
String all = request.getParameter("all_checked");
int owner_id=Integer.parseInt((String)session.getAttribute("owner"));
session.setAttribute("document", "deleted");





if(all!=null && all.equals("all_checked"))
{
	
	
	try {
	    java.sql.Connection con;
	    Class.forName("com.mysql.jdbc.Driver");
	    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
	    Statement stmt = con.createStatement();
	    
	    String s="delete from docs where owner_id=" + owner_id;
	    stmt.executeUpdate(s);
	}
	catch(SQLException e) {
	    out.println("failed....\nSQLException caught: " +e.getMessage());}
}

else 
{
	int[] docs = new int[doc_id.length];
	for(int i = 0;i < doc_id.length;i++)
	{
	   // Note that this is assuming valid input
	   // If you want to check then add a try/catch 
	   // and another index for the numbers if to continue adding the others
	   docs[i] = Integer.parseInt(doc_id[i]);
			   
			   
	}
	
	for(int i=0;i<docs.length;i++)
	{
		try {
		    java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
		    Statement stmt = con.createStatement();
		    
		    String s="delete from docs where id="+docs[i];
		    stmt.executeUpdate(s);
		    
		}
		catch(SQLException e) {
		    out.println("failed....\nSQLException caught: " +e.getMessage());}
		}
		
		
		
	}
	

String site = "user.jsp" ;
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site); 

%>