/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Projects;
import com.actop.model.ProjectsManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class GetProject extends TagSupport {

    int proid;

    public void setProid(int proid) {
        this.proid = proid;
    }
    
    
    @Override
    public int doStartTag() throws JspException {
        ProjectsManagement pm=new ProjectsManagement();
        Projects p=pm.loadProjects(proid);
        pageContext.setAttribute("project", p);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
}
