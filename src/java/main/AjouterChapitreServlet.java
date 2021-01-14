/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import com.alemny.BD.ReqBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chaima
 */
@WebServlet(name = "AjouterChapitreServlet", urlPatterns = {"/AjouterChapitreServlet"})
public class AjouterChapitreServlet extends HttpServlet {

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
        String ID = request.getParameter("ID");
        request.setAttribute("ID", ID);
        request.getRequestDispatcher("/AjouterChapitre.jsp").forward(request, response);

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
              
        String nom = request.getParameter("nom");
       
        String description = request.getParameter("description");
        String moduleID = request.getParameter("ID");
        Vector columns  = new Vector();
         columns.add("nom");
         
         columns.add("description");
columns.add("moduleID");         
        
         
         Vector values  = new Vector();
         values.add(nom);
         
         values.add(description);
         values.add(moduleID);
         
         
         String table = "chapitre";
         ReqBD data = new ReqBD();
         String id =  data.InsertDB(table, columns, values);
         response.setContentType("text/html;charset=UTF-8");
PrintWriter out = response.getWriter();
         out.println("<script type=\"text/javascript\">");
   out.println("alert('Chapitre ajouté');");
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
