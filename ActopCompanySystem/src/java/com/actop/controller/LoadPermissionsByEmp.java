/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.Employers;
import com.actop.db.InterfacesHasUserLogin;
import com.actop.model.PermissionManagement;
import com.actop.model.UserManagement;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACTOP
 */
@WebServlet(name = "LoadPermissionsByEmp", urlPatterns = {"/LoadPermissionsByEmp"})
public class LoadPermissionsByEmp extends HttpServlet {

    private int empid;

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
        request.getRequestDispatcher("/permissions").forward(request, response);
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
        empid = Integer.parseInt(request.getParameter("empid"));
        if (request.getParameter("empid") != null) {
            UserManagement um = new UserManagement();
            Employers emp = um.loadEmployer(empid);
            com.actop.db.UserLogin ul = um.loadUserLoginfromEmployer(emp);
            PermissionManagement pm = new PermissionManagement();
            List<InterfacesHasUserLogin> ihuls = pm.getPermissionByEmployer(ul);
            PrintWriter out = response.getWriter();
            ihuls.forEach(ihul -> {
                out.write("<tr>");
                out.write("<td>" + new String(ihul.getInterfaces().getInterfaceName()) + "</td>");
                if (ihul.getPermissionType() == 1) {
                    out.write("<td>Allowed</td>");
                } else {
                    out.write("<td>Not Allowed</td>");
                }
                if (ihul.getPermissionSave() == 1) {
                    out.write("<td>Allowed</td>");
                } else {
                    out.write("<td>Not Allowed</td>");
                }
                if (ihul.getPermissionUpdate() == 1) {
                    out.write("<td>Allowed</td>");
                } else {
                    out.write("<td>Not Allowed</td>");
                }
                if (ihul.getPermissionDelete() == 1) {
                    out.write("<td>Allowed</td>");
                } else {
                    out.write("<td>Not Allowed</td>");
                }
                if (ihul.getPermissionSearch() == 1) {
                    out.write("<td>Allowed</td>");
                } else {
                    out.write("<td>Not Allowed</td>");
                }
                out.write("</tr>");
            });
            
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
