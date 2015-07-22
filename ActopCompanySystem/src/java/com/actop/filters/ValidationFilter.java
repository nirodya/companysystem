/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.filters;

import java.io.IOException;
import java.util.Map;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class ValidationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        Map<String, String[]> parameters = req.getParameterMap();
        for (Map.Entry<String, String[]> entry : parameters.entrySet()) {
            if(entry.getValue()==null){
                req.setAttribute("validate", 0);
            }
                
        }
        System.out.println("awa");
    }

    @Override
    public void destroy() {
       
    }

}
