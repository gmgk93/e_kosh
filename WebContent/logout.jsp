<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

	<%
	session.removeAttribute("email");
	session.invalidate();
	Cookie[] cookies = request.getCookies(); 
	int i;
	for (i=0; i<cookies.length; i++) 
	{ cookies[i].setMaxAge(0); }
	
	String site = new String("index.jsp");
 	response.setStatus(response.SC_MOVED_TEMPORARILY);
 	response.setHeader("Location", site);				
    %>
