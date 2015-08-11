<%-- 
    Document   : projects
    Created on : Aug 7, 2015, 4:14:01 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/actoptags.tld" prefix="m" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<m:getproject proid="${param.proid}" />
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<m:openHibSession/>
<m:updatehibsession object="${project}" session="${hibsession}" />
<compress:html removeIntertagSpaces="true">
    <!DOCTYPE html>
    <html>
        <head>
            <%@include file="header.jsp" %>

            <script>
                <%@include file="js/adminjs.js" %>
            </script>
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
            <%@include file="navigationbar.jsp" %>
            <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Project Name</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${project.projectName}" /></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Start Date</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel">${project.startDate}</label>
                    </div>
                </div>
                <c:if test="${project.endDate!=null}">
                    <div class="form-group">
                        <label for="salary" class="col-lg-4 control-label">End Date</label>
                        <div class="col-lg-8">
                            <label for="salary" class="col-lg-6 datalabel">${project.endDate}</label>
                        </div>
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Actual Start Date</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel">${project.actualStartDate}</label>
                    </div>
                </div>
                <c:if test="${project.actualEndDate!=null}">
                    <div class="form-group">
                        <label for="salary" class="col-lg-4 control-label">Actual End Date</label>
                        <div class="col-lg-8">
                            <label for="salary" class="col-lg-6 datalabel">${project.actualEndDate}</label>
                        </div>
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Project Type</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${project.projectType}" /></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Project Description</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${project.projectDescription}" /></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Project Status</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${project.projectStatus}" /></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Project Manager</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${project.projectManager}" /></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Client Name</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${project.clients.name}" /></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Client Note</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${project.clientNote}" /></label>
                    </div>
                </div>
                <div style="clear: both;"></div>
                <hr>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <label>Project Tasks</label>
                        <a href="addtasks"><button style="float: right" class="btn btn-info">Add new Task</button></a>
                        <div style="clear: both"></div>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Employer Name</th>
                                        <th>Project Task Type</th>
                                        <th>Task Assign By</th>
                                        <th>Task Status</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Assigned Date</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${project.projectTaskses}" var="projecttask" begin="0" end="${fn:length(project.projectTaskses)}">
                                        <tr>
                                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${projecttask.employers.callingName}" /></td>
                                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${projecttask.projectTaskType}" /></td>
                                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${projecttask.projectTaskAssingBy}" /></td>
                                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${projecttask.projectTaskStates}" /></td>
                                            <td valign="middle" style="vertical-align:middle;">${projecttask.projectTaskStart}</td>
                                            <td valign="middle" style="vertical-align:middle;">${projecttask.projectTaskEnd}</td>
                                            <td valign="middle" style="vertical-align:middle;">${projecttask.projectTaskAssing}</td>
                                            <td valign="top"><a href=""><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger">View Details</button></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </body>
    </html>
</compress:html>
<m:closehibsession session="${hibsession}"/>