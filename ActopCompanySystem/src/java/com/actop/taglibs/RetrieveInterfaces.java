/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Interfaces;
import com.actop.model.PermissionManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrieveInterfaces extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        PermissionManagement management=new PermissionManagement();
        List<Interfaces> interfaceses=management.getAllInterfaces();
        pageContext.setAttribute("interfaces", interfaceses);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
}
