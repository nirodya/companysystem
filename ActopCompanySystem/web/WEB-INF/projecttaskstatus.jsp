<%-- 
    Document   : projecttaskstatus
    Created on : Aug 7, 2015, 6:25:50 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/actoptags.tld" prefix="m" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<m:getprojecttaskstatus ptsid="${param.pstatid}" />
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<m:openHibSession/>
<m:updatehibsession object="${projectTaskStatus}" session="${hibsession}" />
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
                    <label for="salary" class="col-lg-4 control-label">Project Task</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${projectTaskStatus.projectTasks.projectTaskType}" /></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Topic</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${projectTaskStatus.topic}" /></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Start Date</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel">${projectTaskStatus.topicStart}</label>
                    </div>
                </div>
                <c:if test="${projectTaskStatus.topicEnd!=null}">
                    <div class="form-group">
                        <label for="salary" class="col-lg-4 control-label">End Date</label>
                        <div class="col-lg-8">
                            <label for="salary" class="col-lg-6 datalabel">${projectTaskStatus.topicEnd}</label>
                        </div>
                    </div>
                </c:if>
                <c:if test="${projectTaskStatus.topicActualTime!=null}">
                    <div class="form-group">
                        <label for="salary" class="col-lg-4 control-label">Actual Time</label>
                        <div class="col-lg-8">
                            <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${projectTaskStatus.topicActualTime}" /></label>
                        </div>
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Estimate Time</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${projectTaskStatus.topicEstimateTime}"/></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Note</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel">${projectTaskStatus.topicNote}</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="salary" class="col-lg-4 control-label">Task Status</label>
                    <div class="col-lg-8">
                        <label for="salary" class="col-lg-6 datalabel"><m:convertbytetostring text="${projectTaskStatus.topicStates}" /></label>
                    </div>
                </div>
                <div style="clear: both;"></div>
                <hr>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <label>Project Task Details</label>
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
                                    <c:forEach items="${projectTaskStatus.taskDetailses}" var="taskstatus" begin="0" end="${fn:length(ptask.projectTaskStateses)}">
                                        <tr>
                                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${taskstatus.topic}" /></td>
                                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${taskstatus.topicEstimateTime}" /></td>
                                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${taskstatus.topicActualTime}" /></td>
                                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${taskstatus.topicStates}" /></td>
                                            <td valign="middle" style="vertical-align:middle;">${taskstatus.topicStart}</td>
                                            <td valign="middle" style="vertical-align:middle;">${taskstatus.topicEnd}</td>
                                            <td valign="middle" style="vertical-align:middle;">${taskstatus.topicNote}</td>
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
