/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Departments;
import com.actop.model.UserManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrieveDepartments extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        UserManagement um=new UserManagement();
        List<Departments> departmentses=um.getAllDepartments();
        pageContext.setAttribute("departments", departmentses);
        return SKIP_BODY;
    }
    
}
