/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.Employers;
import com.actop.db.Projects;
import com.actop.model.ProjectsManagement;
import com.actop.model.UserManagement;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
@WebServlet(name = "SaveAssignTasks", urlPatterns = {"/SaveAssignTasks"})
public class SaveAssignTasks extends HttpServlet {

    private String employer;
    private String projectname;
    private String ttype;
    private String tnote;
    private String stdate;
    private String endate;
    private String assignby;
    private String status;
    private String priority;

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
        request.getRequestDispatcher("/addtasks").forward(request, response);

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
        employer = request.getParameter("employer");
        projectname = request.getParameter("projectname");
        ttype = request.getParameter("ttype");
        tnote = request.getParameter("tnote");
        stdate = request.getParameter("stdate");
        endate = request.getParameter("endate");
        assignby = request.getParameter("assignby");
        status = request.getParameter("status");
        priority = request.getParameter("priority");
        if (employer != null && projectname != null && ttype != null && tnote != null && stdate != null) {
            ProjectsManagement pm = new ProjectsManagement();
            UserManagement um = new UserManagement();
            Employers emp = um.loadEmployer(Integer.parseInt(employer));
            Projects p = pm.loadProjects(Integer.parseInt(projectname));
            pm.saveProjectTasks(emp, new Date(), assignby, convertToDate(endate), tnote, Integer.parseInt(priority), convertToDate(stdate), status, ttype, p);
            request.setAttribute("msg", "Saved Successfully");
        }
            request.getRequestDispatcher("/addtasks").forward(request, response);
    }

    public Date convertToDate(String strDate) {
        Date apdate = null;
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            apdate = dateFormat.parse(strDate);

        } catch (ParseException ex) {
            Logger.getLogger(SaveProject.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apdate;
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
