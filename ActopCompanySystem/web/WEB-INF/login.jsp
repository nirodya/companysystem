<%-- 
    Document   : login
    Created on : Jul 10, 2015, 11:09:55 AM
    Author     : Nirodya Gamage
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="/WEB-INF/tlds/actoptags.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <style>
            <%@include file="styles/loginstyles.css" %>
        </style>
    </head>
    <body>
        <div id="bodycontainer">
            <%@include file="navigationbar.jsp" %>
            <div class="well" style="" id="logincontainer">
                <m:msgwriter/>
                <div id="logoholder">
                    <div>
                        <img src="../ActopSystem/images/user.ico" />
                    </div>
                </div>
                <label id="loginheader"><h3>ACTOP System Login</h3></label>
                <form class="form-horizontal" action="UserLogin" method="post">
                    <input name="path" type="hidden" value="${path}" />
                    <div class="form-group">
                        <label for="un" class="col-lg-2 control-label">Username</label>
                        <div class="col-lg-10">
                            <input name="un" required="" type="text" class="form-control" id="un" placeholder="UserName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pw" class="col-lg-2 control-label">Password</label>
                        <div class="col-lg-10">
                            <input name="pw" required="" type="password" class="form-control" id="pw" placeholder="Password">
                        </div>
                    </div>
                    <br>
                    <div>
                        <input value="Login" type="submit" class="btn btn-info btn-raised" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
