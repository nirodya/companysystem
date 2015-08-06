<%-- 
    Document   : addLeaveType
    Created on : Jul 23, 2015, 1:25:11 PM
    Author     : Nirodya Gamage(Actop Technologies)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/actoptags.tld" prefix="m" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<m:retrieveinterfaces/>
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <style>
            <%@include file="styles/registerstyles.css" %>
        </style>
        <!-- DATA TABLE SCRIPTS -->
        <script src="assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('.dataTables-example').dataTable();
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
                <label id="loginheader"><h3>Interfaces</h3></label>
                <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">

                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                            <tr>
                                <th>Interface Name</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${interfaces}" var="interface" begin="0" end="${fn:length(interfaces)}">
                                <tr>
                                    <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${interface.interfaceName}" /></td>
                                    <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <label id="loginheader"><h4>Add new Interface</h4></label>
                <form class="form-horizontal" action="SaveInterface" method="post">
                    <div class="form-group">
                        <label for="ltype" class="col-lg-2 control-label">Interface Name</label>
                        <div class="col-lg-10">
                            <input type="text" name="iname" class="form-control" id="iname"/>

                            <input value="Add New Interface" type="submit" class="btn btn-info btn-raised" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
</compress:html>