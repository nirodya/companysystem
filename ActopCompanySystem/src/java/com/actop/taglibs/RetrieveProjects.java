/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Projects;
import com.actop.model.ProjectsManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrieveProjects extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        ProjectsManagement pm=new ProjectsManagement();
        List<Projects> projectslist=pm.getAllProjects();
        pageContext.setAttribute("projects", projectslist);
        return SKIP_BODY;
    }
    
}
