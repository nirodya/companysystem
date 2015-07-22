/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        System.out.println("filtercalled");
        HttpSession session = req.getSession();
        if (session.getAttribute("loggedUser") == null) {
            RequestDispatcher rs = req.getRequestDispatcher("/login");
            request.setAttribute("msg", "Please Login First");
            request.setAttribute("path", req.getServletPath());
            rs.forward(request, response);
        } else {
            chain.doFilter(request, response);
        }
        System.out.println("servlet path= " + req.getServletPath());
        System.out.println("request URL= " + req.getRequestURL());
        System.out.println("request URI= " + req.getRequestURI());
    }

    @Override
    public void destroy() {

    }

}
