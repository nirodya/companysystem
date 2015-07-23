/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.SpecialHolidays;
import com.actop.model.LeaveManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author J.R.K. Wickramasinghe(Actop Technologies)
 */
public class RetrieveSpclLeaveTypes extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        LeaveManagement lm=new LeaveManagement();
        List<SpecialHolidays> spclleavetypes= lm.getAllspclLeaveTypes();
        System.out.println(spclleavetypes.size());
        pageContext.setAttribute("allspclleavetypes", spclleavetypes);
        return SKIP_BODY;
    }}
