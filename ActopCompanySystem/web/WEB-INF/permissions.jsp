<%-- 
    Document   : permissions
    Created on : Jul 21, 2015, 4:11:16 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/actoptags.tld" prefix="m" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<m:retrievepermissions/>
<m:retrieveallEmplyers/>
<m:retrieveinterfaces/>
<m:openHibSession/>
<!DOCTYPE html>
<html>
    <head>

        <%@include file="admin_header.jsp" %>
    </head>
    <body>

        <div id="wrapper">
            <%@include file="adminTopMenu.jsp" %>
            <!--/. NAV TOP  -->
            <%@include file="adminSideMenu.jsp" %>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Permissions
                            <a href="payments"><button style="float: right" class="btn btn-success">Pay for an Employer</button></a>

                            <div style="clear: both"></div>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Payment Type</th>
                                            <th>Payment</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${permissions}" var="permission" begin="0" end="${fn:length(permissions)}">
                                            <m:updatehibsession object="${permission}" session="${hibsession}" />
                                            <tr>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${permission.userLogin.employers.callingName}" /></td>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${permission.interfaces.interfaceName}" /></td>
                                                <td valign="middle" style="vertical-align:middle;">

                                                    <c:choose>
                                                        <c:when test="${permission.permissionType==1}">
                                                            Allowed
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not Allowed
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td valign="middle" style="vertical-align:middle;">

                                                    <c:choose>
                                                        <c:when test="${permission.permissionSave==1}">
                                                            Allowed
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not Allowed
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td valign="middle" style="vertical-align:middle;">

                                                    <c:choose>
                                                        <c:when test="${permission.permissionUpdate==1}">
                                                            Allowed
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not Allowed
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td valign="middle" style="vertical-align:middle;">

                                                    <c:choose>
                                                        <c:when test="${permission.permissionDelete==1}">
                                                            Allowed
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not Allowed
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td valign="middle" style="vertical-align:middle;">

                                                    <c:choose>
                                                        <c:when test="${permission.permissionSearch==1}">
                                                            Allowed
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not Allowed
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td valign="top"><button data-toggle="modal" data-target="#myModal${permission.idInterfacesHasUserLogin}" class="btn btn-danger">View Details</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <!--Data Models-->

                                <!--Data Models End-->
                            </div>


                        </div>
                    </div>
                    <!--End Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Permissions by Employer

                        </div>
                        <select class="form-control">
                            <c:forEach items="${allemployers}" var="employer" begin="0" end="${fn:length(allemployers)}">
                                <option><m:convertbytetostring text="${employer.callingName}" /></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Permissions by Interface

                        </div>
                        <select class="form-control">
                            <c:forEach items="${interfaces}" var="interface" begin="0" end="${fn:length(interfaces)}">
                                <option><m:convertbytetostring text="${interface.interfaceName}" /></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
        <footer><p>All right reserved. <a href="http://actoptec.com">ACTOP Technologies</a></p></footer>
    </body>
</html>
<m:closehibsession session="${hibsession}"/>