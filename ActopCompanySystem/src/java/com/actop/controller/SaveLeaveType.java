/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.model.LeaveManagement;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author J.R.K. Wickramasinghe(Actop Technologies)
 */
@WebServlet(name = "SaveLeaveType", urlPatterns = {"/SaveLeaveType"})
public class SaveLeaveType extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if ("nrml".equals(request.getParameter("stype"))) {
                String ltype = request.getParameter("ltype");

                LeaveManagement lm = new LeaveManagement();

                lm.saveLeaveType(ltype);

            } else {
                String spclltype = request.getParameter("spcltype");
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                DateFormat dateFormat2 = new SimpleDateFormat("H:mm");

                Date sdate = dateFormat.parse(request.getParameter("sdate"));
                Date edate = dateFormat.parse(request.getParameter("edate"));

                LeaveManagement lm = new LeaveManagement();

                lm.saveSpclLeaveType(spclltype,sdate,edate);

            }
            response.sendRedirect("addleavetype");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

}
