<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
String host = "smtp.gmail.com"; 
String user = "ishanv291@gmail.com";
String pass = "ishaN3030"; 
String to = "gmanoj510@gmail.com";
String from = "ishanv291@gmail.com"; 
String subject = "Test subject"; 
String messageText = "Test body";
boolean sessionDebug = false;
Properties props = System.getProperties(); 
props.put("mail.host", host); 
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.starttls.enable","true");
props.put("mail.smtp.auth", "true");
props.put("mail.debug", "true");

props.put("mail.smtp.port", 587); 
// Uncomment 5 SMTPS-related lines below and comment out 2 SMTP-related lines above and 1 below if you prefer to use SSL
// props.put("mail.transport.protocol", "smtps");
// props.put("mail.smtps.auth", "true");
// props.put("mail.smtps.port", "465");
// props.put("mail.smtps.ssl.trust", host);
Session mailSession = Session.getDefaultInstance(props, null); 
mailSession.setDebug(sessionDebug); 
Message msg = new MimeMessage(mailSession); 
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address); 
msg.setSubject(subject); 
msg.setSentDate(new Date()); 
msg.setText(messageText); 
Transport transport = mailSession.getTransport("smtp");
// Transport transport = mailSession.getTransport("smtps");
transport.connect(host, user, pass);
transport.sendMessage(msg, msg.getAllRecipients());
out.println("Result:");
transport.close();
%>
<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
<center>
<h1>Send Email using JSP</h1>
</center>
<p align="center">
<% 
   
%>
</p>
</body>
</html>