/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Payments;
import com.actop.model.PaymentsManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrievePayments extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        PaymentsManagement management=new PaymentsManagement();
        List<Payments> l=management.getAllPayments();
        pageContext.setAttribute("payments", l);
        return SKIP_BODY;
    }
    
}
