/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Designation;
import com.actop.model.UserManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrieveDesignations extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        UserManagement um=new UserManagement();
        List<Designation> designations=um.getDesignations();
        System.out.println(designations.get(0).getDesignation());
        pageContext.setAttribute("designations", designations);
        System.out.println("desigset");
        return SKIP_BODY;
    }
    
}
