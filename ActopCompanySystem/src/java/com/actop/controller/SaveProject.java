/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.Clients;
import com.actop.db.Employers;
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
@WebServlet(name = "SaveProject", urlPatterns = {"/SaveProject"})
public class SaveProject extends HttpServlet {

    private String pname;
    private Date startdate;
    private Date enddate;
    private Date actualstart;
    private Date actualenddate;
    private String projecttype;
    private String projectdescription;
    private String projectstatus;
    private String projectManager;
    private String client;
    private String employer;
    private String clientNote;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        pname = request.getParameter("pname");
        startdate = convertToDate(request.getParameter("startdate"));
        enddate = convertToDate(request.getParameter("enddate"));
        actualstart = convertToDate(request.getParameter("actualstart"));
        actualenddate = convertToDate(request.getParameter("actualenddate"));
        projecttype = request.getParameter("projecttype");
        projectdescription = request.getParameter("projectdescription");
        projectstatus = request.getParameter("projectstatus");
        projectManager = request.getParameter("projectManager");
        client = request.getParameter("client");
        employer = request.getParameter("employer");
        clientNote = request.getParameter("clientNote");
        UserManagement um=new UserManagement();
       
        
        if (pname != null && startdate != null && client != null) {
            Employers loadedEmployer=um.loadEmployer(Integer.parseInt(employer));
            ProjectsManagement pm = new ProjectsManagement();
            Clients loadClient=pm.loadClients(Integer.parseInt(client));
            pm.saveProject(actualenddate, actualstart, clientNote, loadClient, loadedEmployer, 
                    enddate, projectdescription, projectManager, projecttype, projectstatus, projecttype, startdate);
            request.setAttribute("msg", "Suucessfully Saved");
        }
        request.getRequestDispatcher("/addproject").forward(request, response);
    }

    public Date convertToDate(String strDate) {
        Date apdate = null;
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
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
