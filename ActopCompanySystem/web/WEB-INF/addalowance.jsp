<%-- 
    Document   : addalowance
    Created on : Jul 18, 2015, 3:43:54 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<niro:retrieveallowences />
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
            <h3 style="width: 100%;text-align: center">Add Allowance</h3>
            <label style="color: red">${msg}</label>
            <hr>
            <form  action="AddAllowance" method="post">
                <div class="form-group">
                    <label for="nic" class="col-lg-2 control-label">Allowance Type</label>
                    <div class="col-lg-10">
                        <div class="col-lg-10">
                            <select name="allowancetype" required="" class="form-control" id="designation" placeholder="Designation">
                                <c:forEach items="${allowances}" var="allowance" begin="0" end="${fn:length(allowances)}">
                                    <option value="${allowance.idAllowances}"><niro:convertbytetostring text="${allowance.allowanceType}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <niro:retrieveallEmplyers />
                <div class="form-group">
                    <label class="col-lg-2 control-label">Employer</label>
                    <div class="col-lg-10">
                        <div class="col-lg-10">
                            <select name="eid" required="" class="form-control" id="designation" placeholder="Employer">
                                <c:forEach items="${allemployers}" var="employer" begin="0" end="${fn:length(allemployers)}">
                                    <option value="${employer.idEmployers}"><niro:convertbytetostring text="${employer.callingName}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <niro:retrieveDesignations/>
                <div class="form-group">
                    <label for="nic" class="col-lg-2 control-label">Apply for</label>
                    <div class="col-lg-10">
                        <div class="col-lg-10">
                            <select name="designation" required="" class="form-control" id="designation" placeholder="Designation">
                                <c:forEach items="${designations}" var="designation" begin="0" end="${fn:length(designations)}">
                                    <option value="${designation.idDesignation}"><niro:convertbytetostring text="${designation.designation}" /></option>
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

