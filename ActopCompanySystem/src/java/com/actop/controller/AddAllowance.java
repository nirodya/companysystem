/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.Allowances;
import com.actop.db.DepartmentsHasDesignation;
import com.actop.db.Designation;
import com.actop.db.Employers;
import com.actop.db.EmployersHasAllowances;
import com.actop.model.ApprovalManagement;
import com.actop.model.UserManagement;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
@WebServlet(name = "AddAllowance", urlPatterns = {"/AddAllowance"})
public class AddAllowance extends HttpServlet {
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
        String allowancetype = request.getParameter("allowancetype");
        depthasdesigid=request.getParameterValues("depthasdesigid");
        String eid = request.getParameter("eid");
        String designation = request.getParameter("designation");
        if (allowancetype != null && eid != null && designation != null) {
            UserManagement management = new UserManagement();
            Employers e = management.loadEmployer(Integer.parseInt(eid));
            Designation d = management.loadDesignation(Integer.parseInt(designation));
            Allowances a = management.loadAllowance(Integer.parseInt(allowancetype));
            EmployersHasAllowances eha=management.saveEmployerHasAllowance(a, d, e);
            ApprovalManagement am=new ApprovalManagement();
            for (int i = 0; i < depthasdesigid.length; i++) {
                String depthasdesigid1 = depthasdesigid[i];
                DepartmentsHasDesignation dhd=management.loadDepartmentsHasDesignation(Integer.parseInt(depthasdesigid[i]));
                System.out.println("dhd id : "+dhd.getIdDepartmentsHasDesignation());
                if (dhd!=null) {
                    //System.out.println("awa"+dhd);
                    am.saveAllowanceApproval(null, dhd, eha, null, 0);
                }
            }
            request.setAttribute("msg", "Saved Successfully");
        }
        request.getRequestDispatcher("/addallowance").forward(request, response);
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
