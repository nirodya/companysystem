/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

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
@WebServlet(name = "UserUpdate", urlPatterns = {"/UserUpdate"})
public class UserUpdate extends HttpServlet {
    private String fullname;
    private String callname;
    private String address1;
    private String address2;
    private String city;
    private String district;
    private String mobileNo;
    private String homeNo;
    private String epf;
    private String salary;
    private String appointedDate;
    private String appointeType;
    private String nic;
    private String bloodselect;
    private String reportBy;
    private String passport;
    private String licenseNo;
    private String branch;
    private String officeemail;
    private String personalemail;
    private String officeno;
    private String extension;
    private String bank;
    private String bankbranch;
    private String bankaccount;
    private String bankperson;
    private int empid;
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            fullname=request.getParameter("fullname");
            callname=request.getParameter("callname");
            address1=request.getParameter("address1");
            address2=request.getParameter("address2");
            city=request.getParameter("city");
            district=request.getParameter("district");
            mobileNo=request.getParameter("mobileNo");
            homeNo=request.getParameter("homeNo");
            epf=request.getParameter("epf");
            salary=request.getParameter("salary");
            appointedDate=request.getParameter("appointedDate");
            appointeType=request.getParameter("appointeType");
            nic=request.getParameter("nic");
            bloodselect=request.getParameter("bloodselect");
            reportBy=request.getParameter("reportBy");
            passport=request.getParameter("passport");
            licenseNo=request.getParameter("licenseNo");
            branch=request.getParameter("branch");
            officeemail=request.getParameter("officeemail");
            personalemail=request.getParameter("personalemail");
            officeno=request.getParameter("officeno");
            extension=request.getParameter("extension");
            bank=request.getParameter("bank");
            bankbranch=request.getParameter("bankbranch");
            bankaccount=request.getParameter("bankaccount");
            bankperson=request.getParameter("bankperson");
            empid=Integer.parseInt(request.getParameter("empid"));
            
            UserManagement management=new UserManagement();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date apdate = dateFormat.parse(appointedDate);
            management.updateEmployers(empid, fullname, callname, address1, address2, apdate, appointeType, bloodselect, branch, callname, city, district, epf, extension, homeNo, city, licenseNo, mobileNo, nic, officeemail, officeno, passport, passport, bankaccount, bankbranch, bankperson, personalemail, reportBy, null, salary);
            RequestDispatcher rd=request.getRequestDispatcher("/profile?id="+empid);
            request.setAttribute("msg", "Updated Successfully");
            rd.forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UserUpdate.class.getName()).log(Level.SEVERE, null, ex);
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
