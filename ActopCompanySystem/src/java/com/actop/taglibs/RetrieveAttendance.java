/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Attendance;
import com.actop.model.AttendanceManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrieveAttendance extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        AttendanceManagement am=new AttendanceManagement();
        List<Attendance> as=am.getAllAttendance();
        pageContext.setAttribute("attendances", as);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
}
