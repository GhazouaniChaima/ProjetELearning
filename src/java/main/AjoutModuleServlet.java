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
@WebServlet(name = "AjoutModuleServlet", urlPatterns = {"/AjoutModuleServlet"})
public class AjoutModuleServlet extends HttpServlet {

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
        String id = request.getParameter("ID");
        request.setAttribute("ID", id);
        request.getRequestDispatcher("/AjoutModule.jsp").forward(request, response);
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
        String duree = request.getParameter("duree");
        String description = request.getParameter("description");
        String nbrchapitre = request.getParameter("nbchapitre");
        String formationID = request.getParameter("ID");
        Vector columns  = new Vector();
         columns.add("nom");
         columns.add("duree");
         columns.add("description");
         
         columns.add("nbrchapitre");
         
         columns.add("formationID");
         
         Vector values  = new Vector();
         values.add(nom);
         values.add(duree);
         values.add(description);
         values.add(nbrchapitre);
         values.add(formationID);
         String table = "module";
         ReqBD data = new ReqBD();
         String id =data.InsertDB(table, columns, values);
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
