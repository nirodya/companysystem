/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.InterfacesHasUserLogin;
import com.actop.model.PermissionManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrievePermissions extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        PermissionManagement pm=new PermissionManagement();
        List<InterfacesHasUserLogin> ihuls=pm.getAllPermissions();
        pageContext.setAttribute("permissions", ihuls);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
}
