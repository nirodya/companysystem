<%-- 
    Document   : projectsmanagement
    Created on : Jul 30, 2015, 5:30:24 PM
    Author     : ACTOP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/actoptags.tld" prefix="m" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<m:retrieveallEmplyers/>
<m:retrieveProjects/>
<m:openHibSession/>
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
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
                            Employers
                            <a href="register"><button style="float: right" class="btn btn-info">Add new Project</button></a>
                            <div style="clear: both"></div>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Type</th>
                                            <th>Project Manager</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${projects}" var="project" begin="0" end="${fn:length(projects)}">
                                            <tr>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${project.projectName}" /></td>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${project.projectType}" /></td>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${project.projectManager}" /></td>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${project.projectStatus}" /></td>
                                                <td valign="top"><a href="profile?id=${employer.idEmployers}"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger">View Profile</button></a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                    <!-- Advanced Tables -->
                    
                    <!--End Advanced Tables -->
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
        <footer><p>&nbsp;All right reserved. <a href="http://actoptec.com">ACTOP Technologies</a></p></footer>
    </body>
</html>
<m:closehibsession session="${hibsession}"/>
</compress:html>