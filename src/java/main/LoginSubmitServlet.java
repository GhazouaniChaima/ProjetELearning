/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
page hedhi heya aka li fi action mta3 lform fi login ey behy nchoufou kifeh sar cnx m3a bd 

 */
package main;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;

/**
 *
 * @author chaima
 */
public class LoginSubmitServlet extends HttpServlet {

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
        
        //recupere email et password du formulaire
        String email = request.getParameter("email"); // Byname
        String pass = request.getParameter("password");
        String type = request.getParameter("type");

      // Creating a Mongo client 
      MongoClient mongo = new MongoClient( "localhost" , 27017 ); 
      MongoDatabase database = mongo.getDatabase("eLearning");// nom BD
      
      MongoCollection<Document> collection;// objet tab
      
      if(type.equals("apprenant")){
          collection = database.getCollection("apprenant");
      }else{
          collection = database.getCollection("formateur");
      }
      
        BasicDBObject whereQuery = new BasicDBObject(); 
        whereQuery.put("email", email);
        whereQuery.put("password", pass);
        whereQuery.put("statut", "active");
        FindIterable<Document> cursor = collection.find(whereQuery); //tab res (lignes) //find "where dans BD"
        Iterator it = cursor.iterator();
	
        if(it.hasNext()) {
            
            response.setContentType("text/html;charset=UTF-8");
PrintWriter out = response.getWriter();
         out.println("<script type=\"text/javascript\">");
   out.println("alert('Compte valide');");
   out.println("location='http://localhost:8080/3alemniWebsite/';");
   out.println("</script>");
   
        }
	
        
        else{//S'IL YA PAS DES LIGNE QUI ONT UN EMAIL = EMAIL DONNÉE
            response.setContentType("text/html;charset=UTF-8");
PrintWriter out = response.getWriter();
         out.println("<script type=\"text/javascript\">");
   out.println("alert('Compte en attente ou bloqué');");
   out.println("location='http://localhost:8080/3alemniWebsite/';");
   out.println("</script>");
        }
      
	
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
