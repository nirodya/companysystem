/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.ProjectTaskStates;
import com.actop.model.ProjectsManagement;
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
 * @author ACTOP
 */
@WebServlet(name = "SaveTaskDetails", urlPatterns = {"/SaveTaskDetails"})
public class SaveTaskDetails extends HttpServlet {

    private String topic;
    private String note;
    private String startdate;
    private String tenddate;
    private String estimated;
    private String actual;
    private String taskid;

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
        request.getRequestDispatcher("/addTaskDetails").forward(request, response);
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
        topic = request.getParameter("topic");
        note = request.getParameter("note");
        startdate = request.getParameter("startdate");
        tenddate = request.getParameter("tenddate");
        estimated = request.getParameter("estimated");
        actual = request.getParameter("actual");
        taskid = request.getParameter("taskid");
        if (topic != null && note != null && startdate != null && tenddate != null) {
            ProjectsManagement management = new ProjectsManagement();
            ProjectTaskStates pts = management.loadProjectStatus(Integer.parseInt(taskid));
            management.saveTaskDetails(pts, actual, estimated, new Date(), convertToDate(tenddate), note, convertToDate(startdate), topic);
        }
        request.getRequestDispatcher("/addTaskDetails").forward(request, response);
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
