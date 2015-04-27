package ekosh;
import java.io.ByteArrayInputStream;
import java.io.IOException;



import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

import javax.servlet.ServletOutputStream;

import static ekosh.Variables.*;
 
@WebServlet("/retriveImage")
public class retriveImage extends HttpServlet {
 
	private static final long serialVersionUID = 1L;
	Connection con;
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.     
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        response.setContentType("image/jpeg");
        byte[] rawBytes = null;
        ServletOutputStream out = response.getOutputStream();
        try {
           
            String id = request.getQueryString();
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			con = DriverManager.getConnection(dbURL+dbName, dbUser, dbPass);

			// constructs SQL statement
			String sql = "Select data from docs where id="+id;
			PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
           rs.next();
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet retriveImage</title>");
//            out.println("</head>");
//            out.println("<body>");
            //rawBytes = rs.getBytes(1);
            InputStream is = new ByteArrayInputStream(rs.getBytes(1));
            rawBytes = cryptClass.decrypt(encryptKey, is);
            out.write(rawBytes);
//            out.println("</body>");
//            out.println("</html>");
            out.flush();
            statement.close();
        } catch (Exception ex) {
            out.println(ex.getMessage());
        } finally {
            try {
                con.close();
                out.close();
            } catch (Exception ex) {
            }
        }
    } 
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    } 
    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    } 
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
} 
