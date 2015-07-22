<%-- 
    Document   : payments
    Created on : Jul 15, 2015, 12:07:18 PM
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
            <h3 style="width: 100%;text-align: center">Payment to Employer</h3>
            <label style="color: red;">${msg}</label>
            <hr>
            <form  action="savePayment" method="post">
                <div class="form-group">
                    <label for="empname" class="col-lg-2 control-label">Employer Name</label>
                    <div class="col-lg-10">
                        <niro:retrieveallEmplyers />
                        <select name="employer" required="" class="form-control col-lg-10" id="designation" placeholder="Designation">
                            <c:forEach items="${allemployers}" var="employer" begin="0" end="${fn:length(allemployers)}">
                                <option value="${employer.idEmployers}"><niro:convertbytetostring text="${employer.fullName}" /></option>
                            </c:forEach>
                        </select>

                    </div>
                </div>
                <div class="form-group">
                    <label for="ptype" class="col-lg-2 control-label">Payment Type</label>
                    <div class="col-lg-10">
                        <input name="ptype" required="" type="text" class="form-control" id="ptype" placeholder="Payment Type">
                    </div>
                </div>
                <div class="form-group">
                    <label for="pfor" class="col-lg-2 control-label">Payment For</label>
                    <div class="col-lg-10">
                        <input name="pfor" required="" type="text" class="form-control" id="pfor" placeholder="Payment For">
                    </div>
                </div>
                <div class="form-group">
                    <label for="payment" class="col-lg-2 control-label">Payment</label>
                    <div class="col-lg-10">
                        <input name="payment" required="" type="text" class="form-control" id="payment" placeholder="Payment">
                    </div>
                </div>
                <div class="form-group">
                    <label for="pdate" class="col-lg-2 control-label">Payment Date</label>
                    <div class="col-lg-10">
                        <input name="pdate" required="" type="date" class="form-control" id="pdate" placeholder="Payment Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="apdate" class="col-lg-2 control-label">Approved Date</label>
                    <div class="col-lg-10">
                        <input name="apdate" required="" type="date" class="form-control" id="apdate" placeholder="Approved Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="approvedby" class="col-lg-2 control-label">Approved by</label>
                    <div class="col-lg-10">
                        <input name="approvedby" required="" type="text" class="form-control" id="approvedby" placeholder="Approved By">
                    </div>
                </div>
                <div class="form-group">
                    <label for="pstatus" class="col-lg-2 control-label">Payment Status</label>
                    <div class="col-lg-10">
                        <input name="pstatus" required="" type="text" class="form-control" id="pstatus" placeholder="Payment Status">
                    </div>
                </div>
                <div class="form-group">
                    <label for="payeddate" class="col-lg-2 control-label">Payed Date</label>
                    <div class="col-lg-10">
                        <input name="payeddate" required="" type="date" class="form-control" id="payeddate" placeholder="Payed Date">
                    </div>
                </div>
                <input class="btn btn-danger" value="Save" type="submit" />
                <div style="clear: both"></div>
            </form>
        </div>
    </body>
</html>

