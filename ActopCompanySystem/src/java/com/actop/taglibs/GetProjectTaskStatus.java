/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.ProjectTaskStates;
import com.actop.model.ProjectsManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class GetProjectTaskStatus extends TagSupport {

    int ptsid;

    public void setPtsid(int ptsid) {
        this.ptsid = ptsid;
    }

    @Override
    public int doStartTag() throws JspException {
        ProjectsManagement pm=new ProjectsManagement();
        ProjectTaskStates pts=pm.loadProjectStatus(ptsid);
        pageContext.setAttribute("projectTaskStatus", pts);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
}
