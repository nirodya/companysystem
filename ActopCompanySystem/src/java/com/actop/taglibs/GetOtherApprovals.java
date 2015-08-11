/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.actop.taglibs;

import com.actop.db.OtherApprovals;
import com.actop.model.ApprovalManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class GetOtherApprovals extends TagSupport{
    int oid;

    public void setOid(int oid) {
        this.oid = oid;
    }
    
    @Override
    public int doStartTag() throws JspException {
        ApprovalManagement am=new ApprovalManagement();
        OtherApprovals oa=am.getOtherApproval(oid);
        pageContext.setAttribute("otherapproval", oa);
        return EVAL_BODY_INCLUDE; //To change body of generated methods, choose Tools | Templates.
    }

}
