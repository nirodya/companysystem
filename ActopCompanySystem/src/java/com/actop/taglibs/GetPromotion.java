/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;


import com.actop.db.Promotions;
import com.actop.model.PromotionManagement;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class GetPromotion extends TagSupport{
    
    private int promoid;

    public void setPromoid(int promoid) {
        this.promoid = promoid;
    }


    @Override
    public int doStartTag() throws JspException {
        PromotionManagement management=new PromotionManagement();
        Promotions p=management.getPromotion(promoid);
        pageContext.setAttribute("promotion", p);
        return SKIP_BODY;
    }
    
}
