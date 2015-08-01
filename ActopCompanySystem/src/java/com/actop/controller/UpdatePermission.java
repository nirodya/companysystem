/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.Employers;
import com.actop.db.Interfaces;
import com.actop.model.PermissionManagement;
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
 * @author ACTOP
 */
@WebServlet(name = "UpdatePermission", urlPatterns = {"/UpdatePermission"})
public class UpdatePermission extends HttpServlet {
    private String empname;
    private String interfaceName;
    private String rawaccess;
    private String rawsave;
    private String rawupdate;
    private String rawdelete;
    private String rawsearch;
    private int access;
    private int delete;
    private int save;
    private int search;
    private int update;
    private int permid;

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
        request.getRequestDispatcher("/addpermission").forward(request, response);
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
        empname=request.getParameter("empname");
        interfaceName=request.getParameter("interfaceName");
        rawaccess=request.getParameter("access");
        rawsave=request.getParameter("save");
        rawupdate=request.getParameter("update");
        rawdelete=request.getParameter("delete");
        rawsearch=request.getParameter("search");
        permid=Integer.parseInt(request.getParameter("permid"));
        System.out.println(interfaceName);
        if(rawaccess.equals("1"))
            access=1;
        else
            access=0;
        if(rawdelete.equals("1"))
            delete=1;
        else
            delete=0;
        if(rawsave.equals("1"))
            save=1;
        else
            save=0;
        if(rawsearch.equals("1"))
            search=1;
        else
            search=0;
        if(rawupdate.equals("1"))
            update=1;
        else
            update=0;
        System.out.println(delete+"Test");
        PermissionManagement management=new PermissionManagement();
        Interfaces interfacedb=management.loadInterface(interfaceName);
        UserManagement um=new UserManagement();
        Employers e=um.loadEmployer(Integer.parseInt(empname));
        com.actop.db.UserLogin ul=um.loadUserLoginfromEmployer(e);
        if(ul!=null)
        management.updateInterfacesHasUserLogin(interfacedb, delete, save, search, access, update, ul, permid);
        request.getRequestDispatcher("/addpermission").forward(request, response);
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
