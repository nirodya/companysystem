/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.actop.taglibs;

import com.actop.db.ProjectTasks;
import com.actop.db.ProjectTasksApproval;
import com.actop.model.ApprovalManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class GetProjectTaskApproval extends TagSupport{
    
    int ptid;

    public void setPtid(int ptid) {
        this.ptid = ptid;
    }
    
    @Override
    public int doStartTag() throws JspException {
        ApprovalManagement am=new ApprovalManagement();
        ProjectTasksApproval pta=am.getProjectTaskApproval(ptid);
        pageContext.setAttribute("projectTaskApproval", pta);
        return EVAL_BODY_INCLUDE; //To change body of generated methods, choose Tools | Templates.
    }

}
