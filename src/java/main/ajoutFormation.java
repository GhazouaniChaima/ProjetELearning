/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import com.mongodb.DB;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;
import javax.imageio.*;
import javax.servlet.http.Cookie;

/**
 *
 * @author chaima
 */
@WebServlet(name = "ajoutFormation", urlPatterns = {"/ajoutFormation"})
public class ajoutFormation extends HttpServlet {

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
        request.getRequestDispatcher("/ajoutformation.jsp").forward(request, response);//appel du jsp pour affichage du page
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
        String duree = request.getParameter("duree");
        String disc = request.getParameter("discipline");
        String description = request.getParameter("description");
        String nbr = request.getParameter("nbrmodule");
        // Creating a Mongo client 
      MongoClient mongo = new MongoClient( "localhost" , 27017 ); 

      
      
      // Accessing the database 
      MongoDatabase database = mongo.getDatabase("eLearning"); 

      MongoCollection<Document> collection;
      // Retrieving a collection
     collection = database.getCollection("formation");  
     
     Cookie[] cookies = request.getCookies();
     String id1 = "";
     for(int i = 0 ;i<cookies.length;i++){
         if(cookies[i].getName().equals("alemni_compte")){
             id1=cookies[i].getValue();
         }
     }
      
       

      Document document = new Document() 
      .append("name", name)
      .append("duree", duree)
      .append("nombreModule", nbr)
      .append("description", description)
      .append("statut", "en attente")
      .append("Formateur", id1)
      .append("discipline", disc);
      collection.insertOne(document);
      
      String id = document.get("_id").toString();      
      String pic = request.getParameter("pic");
       byte[] imageBytes;
      try {
            
            
            
           /*image  -->*/
            BufferedImage image = ImageIO.read(new File("/home/chaima/Images/"+pic));
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            ImageIO.write(image, "jpg", outputStream);
            imageBytes = outputStream.toByteArray();
            Mongo mongo1 = new Mongo( "127.0.0.1" );
            String dbName = "eLearning";
            DB db = mongo1.getDB( dbName );
            GridFS fs = new GridFS( db );
            GridFSInputFile in = fs.createFile( imageBytes );
            in.setFilename(pic);
            in.setContentType("image");
            in.put("ID", id);
            in.put("table","formation");
            in.save();
                 
            
        } catch (Exception ex) {
           response.setContentType("text/html;charset=UTF-8");
           PrintWriter out = response.getWriter();
           out.println("<script type=\"text/javascript\">");
           out.println("console.log("+ex.getMessage()+");");
           out.println("</script>");
        }
      
      
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
           out.println("<script type=\"text/javascript\">");
           out.println("alert('la formation est ajoutée avec succées');");
           out.println("location='index.html';");
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

    private byte[] LoadImage(String homebadrDocumentsoutputpdf) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
