/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import com.alemny.BD.ReqBD;
import com.mongodb.DB;
import com.mongodb.Mongo;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSInputFile;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Vector;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chaima
 */
@WebServlet(name = "AjouterRessourceServlet", urlPatterns = {"/AjouterRessourceServlet"})
public class AjouterRessourceServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
  
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
        String chapitreID = request.getParameter("chapID");
        request.setAttribute("chapitreID", chapitreID);
        request.getRequestDispatcher("/AjouterRessource.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
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
        
        String name = request.getParameter("nom");
        String chapitre = request.getParameter("ID");
        String pdf = request.getParameter("pdf");
        
        Vector columns  = new Vector();
         columns.add("nom");
         columns.add("type");
         columns.add("chpitreID");
         
         Vector values  = new Vector();
         values.add(name);
         values.add("pdf");
         values.add(chapitre);
      
         String id = "";
         ReqBD data = new ReqBD();
        id = data.InsertDB("resource", columns, values);
      // Retrieving a collection
      
      if(!pdf.equals("")){
         //PDF Insertion --------------------- 
            Mongo mongo1 = new Mongo( "127.0.0.1" );
            String dbName = "eLearning";
            DB db = mongo1.getDB( dbName );
            GridFS fs = new GridFS( db );
            Path pdfPath = Paths.get("/home/chaima/Images/"+pdf);
            byte[] pdffile = Files.readAllBytes(pdfPath);
            GridFSInputFile in = fs.createFile( pdffile );
            in.setFilename(pdf);
            in.put("ResourceID", id);
            in.setContentType("pdf");
            in.save(); 
      }
      response.setContentType("text/html;charset=UTF-8");
PrintWriter out = response.getWriter();
         out.println("<script type=\"text/javascript\">");
   out.println("alert('Ressource ajouté');");
   out.println("location='http://localhost:8080/3alemniWebsite/ShowFormationServlet';");
   out.println("</script>");
      
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
