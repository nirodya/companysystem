<%-- 
    Document   : addPermission
    Created on : Jul 28, 2015, 1:24:53 PM
    Author     : Nirodya Gamage(Actop Technologies)
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
        <%@include file="header.jsp" %>
        <style>
            <%@include file="styles/registerstyles.css" %>
            .permissions{
                display: none;
            }
        </style>
        <!-- DATA TABLE SCRIPTS -->
        <script src="assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('.dataTables-example').dataTable();
                $('#access').change(function () {
                    if ($('#access').is(":checked")) {
                        $('.permissions').show(500);
                    } else {
                        $('.permissions').hide(500);
                    }

                });
                $('#changepermission').click(function () {
                    $('.text').hide();
                    $(this).hide();
                    $('.edit').show(500);
                    $('#saveChanges').show(500);
                });
            });
        </script>
    </head>
    <body>
        <div id="bodycontainer">
            <%@include file="navigationbar.jsp" %>
            <div class="well" style="" id="logincontainer">
                <div id="logoholder">
                    <div>
                        <img src="images/favicon.png" />
                    </div>
                </div>
                <label id="loginheader"><h3>Permissions</h3></label>
                <div class="well" style="width: 100%;margin-left: auto;margin-right: auto">

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
                </div>
                <label id="loginheader"><h4>Add new Permission</h4></label>
                <form class="form-horizontal" action="SavePermission" method="post">
                    <div class="form-group">
                        <label for="ltype" class="col-lg-2 control-label">Employee Name</label>
                        <div class="col-lg-10">
                            <select class="form-control" name="empname">
                                <c:forEach items="${allemployers}" var="allemployer" begin="0" end="${fn:length(allemployers)}">
                                    <option value="${allemployer.idEmployers}"><m:convertbytetostring text="${allemployer.callingName}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ltype" class="col-lg-2 control-label">Interfaces</label>
                        <div class="col-lg-10">
                            <select class="form-control" name="interfaceName">
                                <c:forEach items="${interfaces}" var="interface" begin="0" end="${fn:length(interfaces)}">
                                    <option><m:convertbytetostring text="${interface.interfaceName}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ltype" class="col-lg-2 control-label">Access</label>
                        <div class="col-lg-10">
                            <input id="access" type="checkbox" name="access" value="1" />
                        </div>
                    </div>
                    <div class="form-group permissions">
                        <label for="ltype" class="col-lg-2 control-label">Save</label>
                        <div class="col-lg-10">
                            <input type="checkbox" name="save" value="1" />
                        </div>
                    </div>
                    <div class="form-group permissions">
                        <label for="ltype" class="col-lg-2 control-label">Update</label>
                        <div class="col-lg-10">
                            <input type="checkbox" name="update" value="1" />
                        </div>
                    </div>
                    <div class="form-group permissions">
                        <label for="ltype" class="col-lg-2 control-label">Delete</label>
                        <div class="col-lg-10">
                            <input type="checkbox" name="delete" value="1" />
                        </div>
                    </div>
                    <div class="form-group permissions">
                        <label for="ltype" class="col-lg-2 control-label">Search</label>
                        <div class="col-lg-10">
                            <input type="checkbox" name="search" value="1" />
                        </div>
                    </div>
                    <input value="SAVE" type="submit" class="btn btn-info btn-raised" />
                </form>
            </div>
        </div>
    </body>
</html>
<m:closehibsession session="${hibsession}"/>