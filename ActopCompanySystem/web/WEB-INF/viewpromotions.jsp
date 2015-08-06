<%-- 
    Document   : viewpromotions
    Created on : Jul 15, 2015, 4:15:50 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>

<%@page import="java.util.List"%>
<%@page import="com.actop.db.Promotions"%>
<%@page import="com.actop.connection.Connection"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<niro:retrievePromotions />
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
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
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Before Designation</th>
                        <th>Applied Designation</th>
                        <th>Status</th>
                        <th>#</th>
                    </tr>
                </thead>
                <tbody>
                    <niro:openHibSession />
                    <c:forEach items="${promotions}" var="promotion" begin="0" end="${fn:length(promotions)}">
                        <niro:updatehibsession object="${promotion}" session="${hibsession}" />
                        <tr>
                            <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotion.employers.callingName}" /></td>
                            <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotion.beforePromotion}" /></td>
                            <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotion.promotionFor}" /></td>
                            <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotion.promotionStates}" /></td>
                            <td valign="top">
                                <form action="promote" method="POST">
                                    <input type="hidden" name="promoid" value="${promotion.idPromotions}" />
                                    <button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger">View and Promote</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
<niro:closehibsession session="${hibsession}" />
</compress:html>