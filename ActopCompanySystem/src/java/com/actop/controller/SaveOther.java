/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.DepartmentsHasDesignation;
import com.actop.db.Employers;
import com.actop.db.Other;
import com.actop.model.ApprovalManagement;
import com.actop.model.OtherManagement;
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
 * @author ACTOP
 */
@WebServlet(name = "SaveOther", urlPatterns = {"/SaveOther"})
public class SaveOther extends HttpServlet {

    private String type;
    private String location;
    private String indate;
    private String outdate;
    private String reason;
    private String note;
    private String expenses;
    private String claim;
    private String depthasdesigid[];

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
        request.getRequestDispatcher("/other").forward(request, response);
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
        type = request.getParameter("type");
        location = request.getParameter("location");
        indate = request.getParameter("indate");
        outdate = request.getParameter("outdate");
        reason = request.getParameter("reason");
        note = request.getParameter("note");
        expenses = request.getParameter("expenses");
        claim = request.getParameter("claim");
        depthasdesigid = request.getParameterValues("depthasdesigid");
        UserManagement um = new UserManagement();

        if (type != null && location != null && indate != null && outdate != null && reason != null && note != null) {
            com.actop.db.UserLogin ul = (com.actop.db.UserLogin) request.getSession().getAttribute("loggedUser");
            Employers emp = ul.getEmployers();
            OtherManagement om = new OtherManagement();
            ApprovalManagement am = new ApprovalManagement();
            Other o = om.saveOther(Integer.parseInt(claim), null, null, null, emp, expenses, convertToDate(indate), null, location, note, type, convertToDate(outdate), reason, 0);
            for (int i = 0; i < depthasdesigid.length; i++) {
                DepartmentsHasDesignation dhd = um.loadDepartmentsHasDesignation(Integer.parseInt(depthasdesigid[i]));
                if (dhd != null) {
                    am.saveOtherApproval(null, dhd, null, o, 0);
                }
            }
            request.setAttribute("msg", "saved successfully");
        }
        request.getRequestDispatcher("/other").forward(request, response);
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
