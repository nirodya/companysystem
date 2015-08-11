/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.actop.taglibs;

import com.actop.db.AllowanceApproval;
import com.actop.model.ApprovalManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class GetAllowanceApproval extends TagSupport{
    int aid;

    public void setAid(int aid) {
        this.aid = aid;
    }

    @Override
    public int doStartTag() throws JspException {
        ApprovalManagement am=new ApprovalManagement();
        AllowanceApproval aa=am.getAllowanceApproval(aid);
        pageContext.setAttribute("allowanceApproval", aa);
        return EVAL_BODY_INCLUDE; //To change body of generated methods, choose Tools | Templates.
    }

}
