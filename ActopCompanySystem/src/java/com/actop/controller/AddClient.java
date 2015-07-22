/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.model.ProjectsManagement;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
@WebServlet(name = "AddClient", urlPatterns = {"/AddClient"})
public class AddClient extends HttpServlet {

    private String name;
    private String address;
    private String email;
    private String contact;
    private String contactperson;
    private String contactpersondesignation;
    private String contactpersondepartment;
    private String contactpersonno;
    private String contactpersonemail;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        name = request.getParameter("name");
        address = request.getParameter("address");
        email = request.getParameter("email");
        contact = request.getParameter("contact");
        contactperson = request.getParameter("contactperson");
        contactpersondesignation = request.getParameter("contactpersondesignation");
        contactpersondepartment = request.getParameter("contactpersondepartment");
        contactpersonno = request.getParameter("contactpersonno");
        contactpersonemail = request.getParameter("contactpersonemail");

        if (email != null && name != null && address != null) {
            ProjectsManagement management = new ProjectsManagement();
            management.saveClients(address, contactpersondepartment, contact, contactperson, contactpersondesignation, contactpersonemail, contactpersonno, email, name);
            request.setAttribute("msg", "Saved Successfully");
        }
        RequestDispatcher rd=request.getRequestDispatcher("/addclient");
        rd.forward(request, response);
        

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
