/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.actop.taglibs;

import com.actop.db.ProjectTypes;
import com.actop.model.ProjectsManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class RetrieveProjectTypes extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        ProjectsManagement pm=new ProjectsManagement();
        List<ProjectTypes> l=pm.getAllProjectTypes();
        pageContext.setAttribute("projecttype", l);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }

}
