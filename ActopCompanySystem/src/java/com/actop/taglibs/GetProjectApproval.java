/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.ProjectsApproval;
import com.actop.model.ApprovalManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class GetProjectApproval extends TagSupport {

    int proid;

    public void setProid(int proid) {
        this.proid = proid;
    }

    @Override
    public int doStartTag() throws JspException {
        ApprovalManagement am=new ApprovalManagement();
        ProjectsApproval pa=am.getProjectApproval(proid);
        pageContext.setAttribute("projectsApproval", pa);
        return EVAL_BODY_INCLUDE; //To change body of generated methods, choose Tools | Templates.
    }

}
