package ekosh;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.lowagie.text.pdf.AcroFields;

import static ekosh.Variables.*;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)	// upload file's size up to 16MB
public class FileUploadServlet extends HttpServlet {
	
	// database connection settings
	//private String dbURL = "jdbc:mysql://localhost:3306/AppDB";
	//private String dbUser = "root";
	//private String dbPass = "";
	
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// gets values of text fields
		String type = request.getParameter("type");
		String docname = request.getParameter("docname");
		String privacy = request.getParameter("privacy");
		
		InputStream inputStream = null;	// input stream of the upload file
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("file");
		if (filePart != null) {
			// prints out some information for debugging
			//System.out.println(filePart.getName());
			//System.out.println(filePart.getSize());
						
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}
		String signed = "";
		try{
			com.lowagie.text.pdf.PdfReader reader = new com.lowagie.text.pdf.PdfReader(inputStream);
			AcroFields af = reader.getAcroFields();
			 
			// Search of the whole signature
			ArrayList names = af.getSignatureNames();
			
			if(names.size()!=0)
			{
				System.out.print("Signature exists");
				signed="Signed";
				
			}
			else
			{
				System.out.print("Signture does not exist");
				signed="Not-Signed";
			}
			
			}
			
			catch(Exception e)
			{
				signed="Not-Signed";
				System.out.println("Please upload PDF only");
			}
		
		Connection conn = null;	// connection to the database
		String message = null;	// message will be sent back to client
		
		try {
			// connects to the database
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);
			
			// constructs SQL statement
			String sql = "INSERT INTO docs (owner_id, type,name , data, format, uploaded_on,privacy,signed) values (?, ?, ?, ?, ?, ?,?, ?)";
			int own = Integer.parseInt((String)request.getSession().getAttribute("owner"));
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, own );		//update owner id
			statement.setString(2, type);
			statement.setString(3, docname);
			statement.setString(6, new java.util.Date().toString());
			statement.setString(5, filePart.getContentType());
			statement.setString(7, privacy);
			statement.setString(8, signed);
			
			//cryptClass.encrypt(key, inputStream, outputStream);
			InputStream is = new ByteArrayInputStream(cryptClass.encrypt(encryptKey, inputStream));
			//copyStream(inputStream, cryptClass.encrypt(key, inputStream, outputStream));
			//outputStream.close();
			
			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				//statement.setBlob(3, inputStream);
				statement.setBinaryStream(4,is,is.available());
			}

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "File uploaded and saved into database";
			}
		} catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} catch (Exception ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} finally {
			if (conn != null) {
				// closes the database connection
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			// sets the message in request scope
			request.setAttribute("Message", message);
			
			// forwards to the message page
			getServletContext().getRequestDispatcher("/user.jsp").forward(request, response);
		}
	}
}