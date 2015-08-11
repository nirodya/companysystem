/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.ProjectTasks;
import com.actop.model.ProjectsManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class GetProjectTask extends TagSupport {

    int ptid;

    public void setPtid(int ptid) {
        this.ptid = ptid;
    }

    @Override
    public int doStartTag() throws JspException {
        ProjectsManagement pm=new ProjectsManagement();
        ProjectTasks projectTasks=pm.loadProjectTasks(ptid);
        pageContext.setAttribute("ptask", projectTasks);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
}
