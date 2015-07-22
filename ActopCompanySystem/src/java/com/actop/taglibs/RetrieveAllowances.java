/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Allowances;
import com.actop.model.UserManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrieveAllowances extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        UserManagement management=new UserManagement();
        List<Allowances> allowanceses=management.getAllAllowance();
        pageContext.setAttribute("allowances", allowanceses);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
