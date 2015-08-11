/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.actop.taglibs;

import com.actop.db.PaymentApproval;
import com.actop.model.ApprovalManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class GetPaymentApproval extends TagSupport{
    int pid;

    public void setPid(int pid) {
        this.pid = pid;
    }


    @Override
    public int doStartTag() throws JspException {
        ApprovalManagement am=new ApprovalManagement();
        PaymentApproval paymentApproval=am.getPaymentApproval(pid);
        pageContext.setAttribute("paymentApproval", paymentApproval);
        return EVAL_BODY_INCLUDE; //To change body of generated methods, choose Tools | Templates.
    }

}
