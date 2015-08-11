/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.PromotionApproval;
import com.actop.model.ApprovalManagement;
import com.actop.model.PromotionManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class GetPromotionApproval extends TagSupport {

    int prid;

    public void setPrid(int prid) {
        this.prid = prid;
    }

    @Override
    public int doStartTag() throws JspException {
        ApprovalManagement approvalManagement=new ApprovalManagement();
        PromotionApproval pm=approvalManagement.getPromotionApproval(prid);
        pageContext.setAttribute("promotionapprove", pm);
        return EVAL_BODY_INCLUDE; //To change body of generated methods, choose Tools | Templates.
    }

}
