/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.LeaveApproval;
import com.actop.model.ApprovalManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class GetLeaveApproval extends TagSupport {
    
    int lid;
    
    public void setLid(int lid) {
        this.lid = lid;
    }

    @Override
    public int doStartTag() throws JspException {
        ApprovalManagement am=new ApprovalManagement();
        LeaveApproval la=am.getLeaveApproval(lid);
        pageContext.setAttribute("leaveApprove", la);
        return EVAL_BODY_INCLUDE; //To change body of generated methods, choose Tools | Templates.
    }
    
}
