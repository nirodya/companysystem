/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.connection.Connection;
import com.actop.db.Departments;
import com.actop.db.DepartmentsHasDesignation;
import com.actop.db.Designation;
import com.actop.model.UserManagement;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
@WebServlet(name = "GetDesignationFromDept", urlPatterns = {"/GetDesignationFromDept"})
public class GetDesignationFromDept extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String[] rawdeps = request.getParameterValues("depid");
            ArrayList<Integer> depids = new ArrayList<>();
            ArrayList<DepartmentsHasDesignation> dephasdesig = new ArrayList<>();
            for (int i = 0; i < rawdeps.length; i++) {

                depids.add(Integer.parseInt(rawdeps[i]));
            }
            UserManagement um = new UserManagement();
            Departments dep;
            for (int i = 0; i < depids.size(); i++) {
                if (um.loadDesignation(depids.get(i)) != null) {
                    dep = um.loadDepartment(depids.get(i));
                    dephasdesig.addAll((ArrayList<DepartmentsHasDesignation>) um.getDesignationFromDept(dep));
                    
                }
            }
            Session s = Connection.getSessionFactory().openSession();
            if (dephasdesig != null) {
                dephasdesig.forEach(e -> {
                    if (e != null) {
                        s.update(e.getDepartments());
                        s.update(e.getDesignation());
                        s.update(e.getEmployers());
                        out.write("<option ng-repeat=\"sel in selectables\" value=\""+e.getIdDepartmentsHasDesignation()+"\">"+new String(e.getDepartments().getDepartment())+" "+new String(e.getDesignation().getDesignation())+" "+new String(e.getEmployers().getCallingName())+"</option>");
                    }
                });
            }
            s.close();
            
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
