/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Leave;
import com.actop.db.LeaveTypes;
import com.actop.model.LeaveManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author J.R.K Wickramasinghe
 */
public class RetrieveLeaveTypes extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        LeaveManagement lm=new LeaveManagement();
        List<LeaveTypes> leavetypes= lm.getAllLeaveTypes();
        System.out.println(leavetypes.size());
        pageContext.setAttribute("allleavetypes", leavetypes);
        return SKIP_BODY;
    }
}
