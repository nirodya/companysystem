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
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Interface Name</th>
                                            <th>Access</th>
                                            <th>Save</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                            <th>Search</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${permissions}" var="permission" begin="0" end="${fn:length(permissions)}">
                                            <m:updatehibsession object="${permission}" session="${hibsession}" />

                                            <tr>
                                        <form action="UpdatePermission" method="post">
                                            <input type="hidden" name="permid" value="${permission.idInterfacesHasUserLogin}" />
                                            <td valign="middle" style="vertical-align:middle; height: 50px;"><m:convertbytetostring text="${permission.userLogin.employers.callingName}" />
                                                <input name="empname" type="hidden" value="${permission.userLogin.employers.idEmployers}" />
                                            </td>
                                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${permission.interfaces.interfaceName}" />
                                                <input name="interfaceName" type="hidden" value="<m:convertbytetostring text="${permission.interfaces.interfaceName}" />" />
                                            </td>
                                            <td valign="middle" style="vertical-align:middle;">
                                                <select name="access" class="edit" style="display: none">
                                                    <option value="1" <c:if test="${permission.permissionType==1}">selected=""</c:if>>Allowed</option>
                                                    <option value="0" <c:if test="${permission.permissionType==0}">selected=""</c:if>>Not Allowed</option>
                                                    </select>
                                                    <label class="text">
                                                    <c:choose>
                                                        <c:when test="${permission.permissionType==1}">
                                                            Allowed
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not Allowed
                                                        </c:otherwise>
                                                    </c:choose>
                                                </label>

                                            </td>
                                            <td valign="middle" style="vertical-align:middle;">
                                                <select name="save" class="edit" style="display: none">
                                                    <option value="1" <c:if test="${permission.permissionSave==1}">selected=""</c:if>>Allowed</option>
                                                    <option value="0" <c:if test="${permission.permissionSave==0}">selected=""</c:if>>Not Allowed</option>
                                                    </select>
                                                    <label class="text">
                                                    <c:choose>
                                                        <c:when test="${permission.permissionSave==1}">
                                                            Allowed
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not Allowed
                                                        </c:otherwise>
                                                    </c:choose>
                                                </label>

                                            </td>
                                            <td valign="middle" style="vertical-align:middle;">
                                                <select name="update" class="edit" style="display: none">
                                                    <option value="1" <c:if test="${permission.permissionUpdate==1}">selected=""</c:if>>Allowed</option>
                                                    <option value="0" <c:if test="${permission.permissionUpdate==0}">selected=""</c:if>>Not Allowed</option>
                                                    </select>
                                                    <label class="text">
                                                    <c:choose>
                                                        <c:when test="${permission.permissionUpdate==1}">
                                                            Allowed
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not Allowed
                                                        </c:otherwise>
                                                    </c:choose>
                                                </label>

                                            </td>
                                            <td valign="middle" style="vertical-align:middle;">
                                                <select name="delete" class="edit" style="display: none">
                                                    <option value="1" <c:if test="${permission.permissionDelete==1}">selected=""</c:if>>Allowed</option>
                                                    <option value="0" <c:if test="${permission.permissionDelete==0}">selected=""</c:if>>Not Allowed</option>
                                                    </select>
                                                    <label class="text">
                                                    <c:choose>
                                                        <c:when test="${permission.permissionDelete==1}">
                                                            Allowed
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not Allowed
                                                        </c:otherwise>
                                                    </c:choose>
                                                </label>

                                            </td>
                                            <td valign="middle" style="vertical-align:middle;">
                                                <select name="search" class="edit" style="display: none">
                                                    <option value="1" <c:if test="${permission.permissionSearch==1}"></c:if>>Allowed</option>
                                                    <option value="0" <c:if test="${permission.permissionSearch==0}"></c:if>>Not Allowed</option>
                                                    </select>
                                                    <label class="text">
                                                    <c:choose>
                                                        <c:when test="${permission.permissionSearch==1}">
                                                            Allowed
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not Allowed
                                                        </c:otherwise>
                                                    </c:choose>
                                                </label>

                                            </td>
                                            <td valign="top"><button type="button" id="changepermission" data-toggle="modal" class="btn btn-danger">Edit</button>
                                                <button style="display: none" type="submit" class="btn btn-danger" id="saveChanges">Save</button>
                                            </td>
                                        </form>
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
                            <a href="addpermission"><button style="float: right" class="btn btn-warning">Add Permissions</button></a>
                            <div style="clear: both"></div>
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