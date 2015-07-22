<%-- 
    Document   : allowance
    Created on : Jul 18, 2015, 2:17:49 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<niro:retrieveDesignations/>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>

        <script>
            <%@include file="js/adminjs.js" %>
        </script>
    </head>
    <body>
        <%@include file="navigationbar.jsp" %>
        <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">
            <h3 style="width: 100%;text-align: center">Allowance</h3>
            <label style="color: red" class="col-lg-2 control-label">${msg}</label>
            <hr>
            <form  action="SaveAllowance" method="post">
                <div class="form-group">
                    <label for="atype" class="col-lg-2 control-label">Allowance Type</label>
                    <div class="col-lg-10">
                        <div class="col-lg-10">
                            <input type="text" class="form-control" required="" name="atype" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="min" class="col-lg-2 control-label">Minimum Rs.</label>
                    <div class="col-lg-10">
                        <div class="col-lg-10">
                            <input type="number" class="form-control" required="" name="min" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="max" class="col-lg-2 control-label">Maximum Rs.</label>
                    <div class="col-lg-10">
                        <div class="col-lg-10">
                            <input type="number" class="form-control" required="" name="max" />
                        </div>
                    </div>
                </div>
                <input class="btn btn-info" type="submit" value="Save" />
            </form>
        </div>
    </body>
</html>