/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.filters;

import com.actop.db.Interfaces;
import com.actop.db.UserLogin;
import com.actop.model.PermissionManagement;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class CheckPermission implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        System.out.println("permission filtercalled");
        HttpSession session = req.getSession();
        if (session.getAttribute("loggedUser") == null) {
            UserLogin ul=(UserLogin) session.getAttribute("loggedUser");
            PermissionManagement pm=new PermissionManagement();
            Interfaces i=pm.loadInterface(req.getServletPath());
            if (!pm.loadPermission(ul, i)) {
                request.setAttribute("msg", "You dont have permission for that page");
                req.getRequestDispatcher("/login").forward(request, response);
            }
        }else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
       
    }
    
}
