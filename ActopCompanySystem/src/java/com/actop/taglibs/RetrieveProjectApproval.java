/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.DepartmentsHasDesignation;
import com.actop.db.Employers;
import com.actop.db.ProjectsApproval;
import com.actop.db.UserLogin;
import com.actop.model.ApprovalManagement;
import com.actop.model.UserManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class RetrieveProjectApproval extends TagSupport {

    @Override
    public int doStartTag() throws JspException {
        ApprovalManagement am = new ApprovalManagement();
        UserManagement um = new UserManagement();
        UserLogin sessul = (UserLogin) pageContext.getAttribute("loggedUser", PageContext.SESSION_SCOPE);
        Employers e = sessul.getEmployers();
        DepartmentsHasDesignation dhd = um.getDepartmentHasDesignation(e);
        List<ProjectsApproval> pas = am.checkProjectsApproval(dhd,false);
        if (pas.size() > 0) {
            pageContext.setAttribute("projectApprovals", pas);
            return EVAL_BODY_INCLUDE;
        } else {
            return SKIP_BODY;
        }
    }

}
