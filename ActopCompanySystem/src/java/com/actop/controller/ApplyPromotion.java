/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.Employers;
import com.actop.model.PromotionManagement;
import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
@WebServlet(name = "ApplyPromotion", urlPatterns = {"/ApplyPromotion"})
public class ApplyPromotion extends HttpServlet {

    private String designation;
    private String currentdesignation;

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println(request.getParameter("designation"));
//        if (Integer.parseInt((String) request.getAttribute("validate")) != 0) {
            designation = request.getParameter("designation");
            currentdesignation = request.getParameter("currentdesignation");
            PromotionManagement management = new PromotionManagement();
            HttpSession session = request.getSession();
            com.actop.db.UserLogin ul = (com.actop.db.UserLogin) session.getAttribute("loggedUser");
            Employers emp=ul.getEmployers();
            management.savePromotion(currentdesignation, emp, null, new Date(), null, null, null, designation, "Not Revieved");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/profile?id="+emp.getIdEmployers());
            dispatcher.forward(request, response);
//        }else{
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/promotion");
//            dispatcher.forward(request, response);
//        }
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
