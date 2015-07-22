<%-- 
    Document   : promote
    Created on : Jul 17, 2015, 5:39:27 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${promoid!=''}">

    <niro:getPromotion promoid="${param.promoid}" />
    <niro:openHibSession />
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
                <h3 style="width: 100%;text-align: center">Promote an Employer</h3>
                <hr>
                <form action="promoteEmp" method="post">
                    <niro:updatehibsession object="${promotion}" session="${hibsession}" />
                    <input type="hidden" name="promoid" value="${param.promoid}" />
                    <div class="form-group">
                        <label for="fullname" class="col-lg-4 control-label">Full Name</label>
                        <div class="col-lg-8">
                            <label for="fullname" class="col-lg-8 datalabel"><niro:convertbytetostring text="${promotion.employers.fullName}" /></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="currentPromo" class="col-lg-4 control-label">Current Designation</label>
                        <div class="col-lg-8">
                            <label for="currentPromo" class="col-lg-8 datalabel"><niro:convertbytetostring text="${promotion.beforePromotion}" /></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="appliedPromo" class="col-lg-4 control-label">Applied Designation</label>
                        <div class="col-lg-8">
                            <label for="appliedPromo" class="col-lg-8 datalabel"><niro:convertbytetostring text="${promotion.promotionFor}" /></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="promoteBy" class="col-lg-4 control-label">Promote by</label>
                        <div class="col-lg-8">
                            <input type="text" required="" class="form-control" name="promoteBy" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="effectiveDate" class="col-lg-4 control-label">Effective Date</label>
                        <div class="col-lg-8">
                            <input type="date" required="" class="form-control" name="effectDate" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="effectiveDate" class="col-lg-4 control-label">Approved By</label>
                        <div class="col-lg-8">
                            <input type="text" required="" class="form-control" name="approvedBy" />
                        </div>
                    </div>
                        <input class="btn btn-primary" type="submit" value="Promote" />
                </form>
                <div style="clear: both;"></div>
            </div>
        </body>
    </html>
</c:if>
<niro:closehibsession session="${hibsession}" />