/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.Employers;
import com.actop.model.UserManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrieveCustomers extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        UserManagement um=new UserManagement();
        List<Employers> employerses= um.getAllEmployers();
        System.out.println(employerses.size());
        pageContext.setAttribute("allemployers", employerses);
        return SKIP_BODY;
    }
    
}
