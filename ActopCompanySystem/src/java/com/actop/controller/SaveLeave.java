/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.Employers;
import com.actop.model.LeaveManagement;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author J.R.K. Wickramasinghe
 */
@WebServlet(name = "SaveLeave", urlPatterns = {"/SaveLeave"})
public class SaveLeave extends HttpServlet {

    private int empid;
    private String leavetype;
    private int nuofdays;
    private Date sdate;
    private Date edate;
    private Employers emp;
//    private String substitute;
//    private String sadatentime;
//    private String appby;
//    private Date appdate;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
            leavetype = request.getParameter("leavetype");
            sdate = dateFormat.parse(request.getParameter("sdate"));
            edate = dateFormat.parse(request.getParameter("edate"));

//            String[] cal1 = request.getParameter("sdate").split("-");
//            String[] cal2 = request.getParameter("edate").split("-");
//            
//             int d1=Integer.parseInt(cal1[2]);
//             int d2=Integer.parseInt(cal2[2]);
//             int m1=Integer.parseInt(cal1[1]);
//             int m2=Integer.parseInt(cal2[1]);
//             int y1=Integer.parseInt(cal1[0]);
//             int y2=Integer.parseInt(cal2[0]);
//
//             if (y2-y1>=0) {
//                 if (m2-m1>0) {
//                      
//                 } else {
//                 }
//            } else {
//                 
//            }
            System.out.println(leavetype + request.getParameter("sdate"));
            LeaveManagement lm = new LeaveManagement();
            com.actop.db.UserLogin ul = (com.actop.db.UserLogin) request.getSession().getAttribute("loggedUser");
            emp = ul.getEmployers();
            lm.saveLeave1(leavetype, nuofdays, sdate, edate, emp);
            response.sendRedirect("leave");
        } catch (Exception e) {
            throw new ServletException(e);
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
