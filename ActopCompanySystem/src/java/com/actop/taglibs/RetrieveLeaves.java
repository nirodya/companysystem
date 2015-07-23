/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Leave;
import com.actop.model.LeaveManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author J.R.K Wickramasinghe
 */
public class RetrieveLeaves extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        LeaveManagement lm=new LeaveManagement();
        List<Leave> leaves= lm.getAllLeaves();
        System.out.println(leaves.size());
        pageContext.setAttribute("allleaves", leaves);
        return SKIP_BODY;
    }
}
