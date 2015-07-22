/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.Departments;
import com.actop.db.Designation;
import com.actop.db.Employers;
import com.actop.db.UserLogin;
import com.actop.model.UserManagement;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
@WebServlet(name = "SaveUser", urlPatterns = {"/SaveUser"})
public class SaveUser extends HttpServlet {

    private String nic;
    private String fullname;
    private String callingname;
    private String ad1;
    private String ad2;
    private String city;
    private String district;
    private String mobile;
    private String home;
    private String epf;
    private int designation;
    private String salary;
    private String appointeddate;
    private String appointedtype;
    private String reportby;
    private String bloodselect;
    private String passport;
    private String license;
    private String branch;
    private String officeemail;
    private String personalemail;
    private String officeno;
    private String extension;
    private String bank;
    private String bankbranch;
    private String bankaccount;
    private String bankperson;
    private String path;
    private String un;
    private String pw;
    private String sq1;
    private String answer1;
    private String sq2;
    private String answer2;
    private int department;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);
            items.forEach(e -> {
                if (e.isFormField()) {
                    if (e.getFieldName().equals("nic")) {
                        nic = e.getString();
                    }
                    if (e.getFieldName().equals("fullname")) {
                        fullname = e.getString();
                    }
                    if (e.getFieldName().equals("callingname")) {
                        callingname = e.getString();
                    }
                    if (e.getFieldName().equals("ad1")) {
                        ad1 = e.getString();
                    }
                    if (e.getFieldName().equals("ad2")) {
                        ad2 = e.getString();
                    }
                    if (e.getFieldName().equals("city")) {
                        city = e.getString();
                    }
                    if (e.getFieldName().equals("district")) {
                        district = e.getString();
                    }
                    if (e.getFieldName().equals("mobile")) {
                        mobile = e.getString();
                    }
                    if (e.getFieldName().equals("home")) {
                        home = e.getString();
                    }
                    if (e.getFieldName().equals("epf")) {
                        epf = e.getString();
                    }
                    if (e.getFieldName().equals("designation")) {
                        designation = Integer.parseInt(e.getString());
                    }
                    if (e.getFieldName().equals("department")) {
                        department = Integer.parseInt(e.getString());
                    }
                    if (e.getFieldName().equals("salary")) {
                        salary = e.getString();
                    }
                    if (e.getFieldName().equals("appointeddate")) {
                        appointeddate = e.getString();
                    }
                    if (e.getFieldName().equals("appointedtype")) {
                        appointedtype = e.getString();
                    }
                    if (e.getFieldName().equals("reportby")) {
                        reportby = e.getString();
                    }
                    if (e.getFieldName().equals("bloodselect")) {
                        bloodselect = e.getString();
                    }
                    if (e.getFieldName().equals("passport")) {
                        passport = e.getString();
                    }
                    if (e.getFieldName().equals("license")) {
                        license = e.getString();
                    }
                    if (e.getFieldName().equals("branch")) {
                        branch = e.getString();
                    }
                    if (e.getFieldName().equals("officeemail")) {
                        officeemail = e.getString();
                    }
                    if (e.getFieldName().equals("personalemail")) {
                        personalemail = e.getString();
                    }
                    if (e.getFieldName().equals("officeno")) {
                        officeno = e.getString();
                    }
                    if (e.getFieldName().equals("extension")) {
                        extension = e.getString();
                    }
                    if (e.getFieldName().equals("bank")) {
                        bank = e.getString();
                    }
                    if (e.getFieldName().equals("bankbranch")) {
                        bankbranch = e.getString();
                    }
                    if (e.getFieldName().equals("bankaccount")) {
                        bankaccount = e.getString();
                    }
                    if (e.getFieldName().equals("bankperson")) {
                        bankperson = e.getString();
                    }
                    if (e.getFieldName().equals("un")) {
                        un = e.getString();
                    }
                    if (e.getFieldName().equals("pw")) {
                        pw = e.getString();
                    }
                    if (e.getFieldName().equals("sq1")) {
                        sq1 = e.getString();
                    }
                    if (e.getFieldName().equals("answer1")) {
                        answer1 = e.getString();
                    }
                    if (e.getFieldName().equals("sq2")) {
                        sq2 = e.getString();
                    }
                    if (e.getFieldName().equals("answer2")) {
                        answer2 = e.getString();
                    }
                } else {
                    path = "upload_images/" + nic + System.currentTimeMillis() + ".jpg";
                    File savedfile = new File(request.getServletContext().getRealPath("/") + path);
                    try {
                        e.write(savedfile);
                    } catch (Exception ex) {
                        Logger.getLogger(SaveUser.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            });
            UserManagement um = new UserManagement();
            if (un != null && nic != null) {
                if (um.checkUser(un)) {
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
                    Date apdate = dateFormat.parse(appointeddate);
                    Employers e = um.saveEmployers(fullname, callingname, ad1, ad2, apdate, appointedtype, bloodselect, branch, callingname, city, district, epf, extension, home, path, license, mobile, nic, officeemail, officeno, passport, passport, bank, bankaccount, bankbranch, bankperson, reportby, null, salary);
                    UserLogin ul = um.saveUserLogin(answer1, answer2, e, pw, sq1, sq2, un);
                    Designation d = um.loadDesignation(designation);
                    Departments departments = um.loadDepartment(department);
                    um.saveDepartmentHasDesignation(departments, d, e);
                    response.sendRedirect("register");
                } else {
                    request.setAttribute("msg", "There's already user registered in your username.");
                    request.getRequestDispatcher("/register").forward(request, response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
