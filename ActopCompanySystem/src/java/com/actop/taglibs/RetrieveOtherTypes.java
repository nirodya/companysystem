/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.OtherTypes;
import com.actop.model.OtherManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage
 */
public class RetrieveOtherTypes extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        OtherManagement management=new OtherManagement();
        List<OtherTypes> l=management.getAllOtherTypes();
        pageContext.setAttribute("othertype", l);
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
}
