/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Employers;
import com.actop.model.UserManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrieveProfile extends TagSupport{
    private String id;

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public int doStartTag() throws JspException {
        UserManagement um=new UserManagement();
        Employers e=um.loadEmployer(Integer.parseInt(id));
        System.out.println(id);
        pageContext.setAttribute("profile", e);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
}
