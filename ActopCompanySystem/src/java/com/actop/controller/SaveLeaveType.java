/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.model.LeaveManagement;
import java.io.IOException;
import java.io.PrintWriter;
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
            String ltype=request.getParameter("ltype");
            
            
            LeaveManagement lm = new LeaveManagement();
           
            lm.saveLeaveType(ltype);
            response.sendRedirect("addleavetype");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

   
}
