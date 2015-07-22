/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class LoginMessageCheck extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        String msg=(String) pageContext.getRequest().getAttribute("msg");
        if(msg!=null){
        JspWriter out=pageContext.getOut();//returns the instance of JspWriter
        try {
            out.print("<label style=\"color: red\" class=\"control-label\" for=\"inputError\">"+msg+"</label>");
        } catch (IOException ex) {
            Logger.getLogger(LoginMessageCheck.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
}
