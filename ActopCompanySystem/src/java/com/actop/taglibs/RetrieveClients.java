/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Clients;
import com.actop.model.ProjectsManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrieveClients extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        ProjectsManagement management=new ProjectsManagement();
        List<Clients> clientses= management.getAllClients();
        pageContext.setAttribute("clients", clientses);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
}
