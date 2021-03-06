<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="ekosh.digiSign"%>

<%
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = "d://ishan//workspace//ekosh//WebContent//files//new";

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath + 
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            String id = (String) session.getAttribute("owner");
            String name = "user"+id;
            String signedFilePath = digiSign.convertAndSign(fileName,name);	//sign file and get its location on server
            File signedFile = new File(signedFilePath);
            response.setHeader("Content-Type",    getServletContext().getMimeType(signedFile.getName()));		//download file on client
            response.setHeader("Content-Length", String.valueOf(signedFile.length()));
            response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"_Signed.pdf\"");
            Files.copy(signedFile.toPath(), response.getOutputStream());
            }
            
            
         }
      }catch(Exception ex) {
    	  out.println("<html>");
          out.println("<head>");
          out.println("<title>Servlet upload</title>");  
          out.println("</head>");
          out.println("<body>");
          out.println("<br/><br/><h3><center>Sigining Failed. You dont have a key pair to sign documents. Click <a href='newKeyForm.jsp'>Here</a> to create one now.</center></h3>"); 
          out.println("</body>");
          out.println("</html>");
       }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>Sigining Failed</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>