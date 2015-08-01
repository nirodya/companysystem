/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.AllowanceApproval;
import com.actop.db.DepartmentsHasDesignation;
import com.actop.db.Employers;
import com.actop.db.LeaveApproval;
import com.actop.db.OtherApprovals;
import com.actop.db.PaymentApproval;
import com.actop.db.ProjectTasksApproval;
import com.actop.db.ProjectsApproval;
import com.actop.db.PromotionApproval;
import com.actop.model.ApprovalManagement;
import com.actop.model.UserManagement;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACTOP
 */
@WebServlet(name = "ApprovalListner", urlPatterns = {"/ApprovalListner"})
public class ApprovalListner extends HttpServlet {

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
        System.out.println("awa");
        ApprovalManagement am = new ApprovalManagement();
        UserManagement um = new UserManagement();
        HttpSession httpSession = request.getSession();
        com.actop.db.UserLogin ul = (com.actop.db.UserLogin) httpSession.getAttribute("loggedUser");
        Employers e = ul.getEmployers();
        DepartmentsHasDesignation dhd = um.getDepartmentHasDesignation(e);
        List<PaymentApproval> paymentApprovals = am.checkPayementApproval(dhd);
        List<LeaveApproval> leaveApprovals = am.checkLeaveApproval(dhd);
        List<ProjectsApproval> projectsApprovals = am.checkProjectsApproval(dhd);
        List<PromotionApproval> promotionApprovals = am.checkPromotionApproval(dhd);
        List<ProjectTasksApproval> projectTasksApprovals = am.checkProjectTaskApproval(dhd);
        List<OtherApprovals> otherApprovalses = am.checkOtherApproval(dhd);
        List<AllowanceApproval> allowanceApprovals = am.checkAllowanceApproval(dhd);
        int count = 0;
        if (!paymentApprovals.isEmpty()) {
            count = paymentApprovals.size();
        }
        if (!leaveApprovals.isEmpty()) {
            count = leaveApprovals.size();
        }
        if (!projectsApprovals.isEmpty()) {
            count = projectsApprovals.size();
        }
        if (!promotionApprovals.isEmpty()) {
            count = promotionApprovals.size();
        }
        if (!projectTasksApprovals.isEmpty()) {
            count = projectTasksApprovals.size();
        }
        if (!otherApprovalses.isEmpty()) {
            count = otherApprovalses.size();
        }
        if (!allowanceApprovals.isEmpty()) {
            count = allowanceApprovals.size();
        }
        PrintWriter out = response.getWriter();
        System.out.println("awa");
        if (count > 0) {
            out.write(""+count+"");
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
