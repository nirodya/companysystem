/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

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
public class ConvertByteToString extends TagSupport{
    private byte[] text;

    public void setText(byte[] text) {
        this.text = text;
    }

    @Override
    public int doStartTag() throws JspException {
        JspWriter out=pageContext.getOut();//returns the instance of JspWriter
        String convertedText=new String(text);
        System.out.println(convertedText);
        try {
            out.print(convertedText);
        } catch (IOException ex) {
            Logger.getLogger(ConvertByteToString.class.getName()).log(Level.SEVERE, null, ex);
        }
        return SKIP_BODY; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
