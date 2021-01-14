/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;
import com.alemny.BD.*;
import com.mongodb.DB;
import com.mongodb.Mongo;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSInputFile;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;

/**
 *
 * @author chaima
 */
@WebServlet(name = "InscriptionServlet", urlPatterns = {"/Inscription"})
public class InscriptionServlet extends HttpServlet {

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
        request.getRequestDispatcher("/inscription.jsp").forward(request, response);//appel du jsp pour affichage du page
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
        
        String pic = request.getParameter("photo");
        String name = request.getParameter("nom");
        String pdf = request.getParameter("pdf");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        Vector columns  = new Vector();
         columns.add("name");
         columns.add("email");
         columns.add("password");
         
         Vector values  = new Vector();
         values.add(name);
         values.add(email);
         values.add(password);
      
         String id = "";
      // Retrieving a collection
      if (type.equals("formateur")){
          columns.add("statut");
          values.add("en attente");
         String table = "formateur";
         ReqBD data = new ReqBD();
         id = data.InsertDB(table, columns, values);
      }
      else{
          columns.add("statut");
          values.add("active");
         String table = "apprenant";
         ReqBD data = new ReqBD();
        id = data.InsertDB(table, columns, values);
      }
      
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
            in.setContentType("pdf");
            in.put("ID", id);
            in.save(); 
      }
      if(!pic.equals("")){
          Mongo mongo1 = new Mongo( "127.0.0.1" );
            String dbName = "eLearning";
            DB db = mongo1.getDB( dbName );
               /*image  -->*/
            BufferedImage image = ImageIO.read(new File("/home/chaima/Images/"+pic));
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            ImageIO.write(image, "jpg", outputStream);
        byte[] imageBytes = outputStream.toByteArray();
            GridFS fs = new GridFS( db );
            GridFSInputFile in = fs.createFile( imageBytes );
            in.setFilename(pic);
            in.setContentType("image");
            in.put("ID", id);
            in.put("table","formation");
            in.save();
      }
         
            Cookie cookie ;
            cookie = new Cookie("alemni_compte",id);
            Cookie cookie2 = new Cookie("type_compte",type);
                response.addCookie(cookie);
                response.addCookie(cookie2);
                request.getRequestDispatcher("/show_formations.jsp").forward(request, response);
            
        
                
        
            
            
      
         
             
        
            
            
             
       

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
