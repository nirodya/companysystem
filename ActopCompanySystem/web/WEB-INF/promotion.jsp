<%-- 
    Document   : promotion
    Created on : Jul 14, 2015, 12:49:43 PM
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
            <h3 style="width: 100%;text-align: center">Apply For Promotion</h3>
            <hr>
            <form  action="ApplyPromotion" method="post">
                <div class="form-group">
                    <label for="nic" class="col-lg-2 control-label">Current Designation</label>
                    <div class="col-lg-10">
                        <div class="col-lg-10 dropdownjs">
                            <select name="currentdesignation" required="" class="form-control" id="designation" placeholder="Designation">
                                <c:forEach items="${designations}" var="designations" begin="0" end="${fn:length(designations)}">
                                <option><niro:convertbytetostring text="${designations.designation}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <niro:retrieveDesignations/>
                <div class="form-group">
                    <label for="nic" class="col-lg-2 control-label">Apply for</label>
                    <div class="col-lg-10">
                        <div class="col-lg-10 dropdownjs">
                            <select name="designation" required="" class="form-control" id="designation" placeholder="Designation">
                                <c:forEach items="${designations}" var="designation" begin="0" end="${fn:length(designations)}">
                                <option><niro:convertbytetostring text="${designation.designation}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <input class="btn btn-info" value="Apply" type="submit" />
                <div style="clear: both"></div>
            </form>
        </div>
    </body>
</html>
