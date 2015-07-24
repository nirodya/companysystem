/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.ProjectTasks;
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
@WebServlet(name = "SaveProjectTaskStatus", urlPatterns = {"/SaveProjectTaskStatus"})
public class SaveProjectTaskStatus extends HttpServlet {
    private int taskid;
    private String topic;
    private String ttartdate;
    private String tenddate;
    private String estimated;
    private String actual;
    private String note;
    private String status;
    

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
        request.getRequestDispatcher("/admin").forward(request, response);
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
        if (request.getParameter("taskid")!=null&&request.getParameter("topic")!=null) {
            taskid=Integer.parseInt(request.getParameter("taskid"));
            topic=request.getParameter("topic");
            ttartdate=request.getParameter("ttartdate");
            tenddate=request.getParameter("tenddate");
            estimated=request.getParameter("estimated");
            actual=request.getParameter("actual");
            note=request.getParameter("note");
            status=request.getParameter("status");
            ProjectsManagement management=new ProjectsManagement();
            ProjectTasks projectTasks=management.loadProjectTasks(taskid);
            management.saveProjectTaskStatus(projectTasks, topic, actual, convertToDate(tenddate), estimated, note, convertToDate(ttartdate), status);
            System.out.println("Saved");
            request.setAttribute("msg", "Saved Successfully");
        }
        System.out.println("Awe Na");
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
