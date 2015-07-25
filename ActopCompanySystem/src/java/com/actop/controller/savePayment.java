/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.DepartmentsHasDesignation;
import com.actop.db.Employers;
import com.actop.db.Payments;
import com.actop.model.ApprovalManagement;
import com.actop.model.PaymentsManagement;
import com.actop.model.UserManagement;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "savePayment", urlPatterns = {"/savePayment"})
public class savePayment extends HttpServlet {

    private String employer;
    private String ptype;
    private String pfor;
    private String payment;
    private String pdate;
    private String approvedby;
    private String pstatus;
    private String payeddate;
    private String apdate;
    private String depthasdesigid[];

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        employer = request.getParameter("employer");
        ptype = request.getParameter("ptype");
        pfor = request.getParameter("pfor");
        payment = request.getParameter("payment");
        pdate = request.getParameter("pdate");
        pstatus = request.getParameter("pstatus");
        payeddate = request.getParameter("payeddate");
        depthasdesigid=request.getParameterValues("depthasdesigid");

        if (employer != null && ptype != null && pfor != null && payment != null) {
            UserManagement umanagement = new UserManagement();
            Employers emp = umanagement.loadEmployer(Integer.parseInt(employer));

            PaymentsManagement management = new PaymentsManagement();
            Payments p= management.savePayment(emp, payment, convertToDate(pdate), new Date(), pstatus, ptype, pfor);
            ApprovalManagement am=new ApprovalManagement();
            for (int i = 0; i < depthasdesigid.length; i++) {
                String depthasdesigid1 = depthasdesigid[i];
                DepartmentsHasDesignation dhd=umanagement.loadDepartmentsHasDesignation(Integer.parseInt(depthasdesigid[i]));
                System.out.println("dhd id : "+dhd.getIdDepartmentsHasDesignation());
                System.out.println("payment id : "+p.getIdPayments());
                if (dhd!=null) {
                    //System.out.println("awa"+dhd);
                    am.savePaymentApproval(null, dhd, null, p, 0);
                }
            }
            request.setAttribute("msg", "Saved Successfully");
        }
        request.getRequestDispatcher("/payments").forward(request, response);
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
    }
// </editor-fold>

}
