/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.taglibs;

import com.actop.db.Promotions;
import com.actop.model.PromotionManagement;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class RetrievePromotions extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        System.out.println("awa1");
        PromotionManagement management=new PromotionManagement();
        System.out.println("awa2");
        List<Promotions> promotionses=management.getallPromotions();
        System.out.println("awa3");
        pageContext.setAttribute("promotions", promotionses);
        System.out.println(promotionses.size());
        return SKIP_BODY;
    }
    
}
