<%-- 
    Document   : addtaskstatus
    Created on : Jul 21, 2015, 10:56:16 AM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:choose>
    <c:when test="${param.taskid!=null}">
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
                    <h3 style="width: 100%;text-align: center">Assign Task Status</h3>
                    <label style="color: red;">${msg}</label>
                    <hr>
                    <form  action="SaveProjectTaskStatus" method="post">
                        <input type="hidden" value="${param.taskid}" name="taskid"/>
                        <div class="form-group">
                            <label for="topic" class="col-lg-2 control-label">Topic</label>
                            <div class="col-lg-10">
                                <input name="topic" required="" type="text" class="form-control" id="topic" placeholder="Topic">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ttartdate" class="col-lg-2 control-label">Start Date</label>
                            <div class="col-lg-10">
                                <input name="ttartdate" required="" type="date" class="form-control" id="ttartdate" placeholder="Start Date">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tenddate" class="col-lg-2 control-label">End Date</label>
                            <div class="col-lg-10">
                                <input name="tenddate" required="" type="date" class="form-control" id="tenddate" placeholder="End Date">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="estimated" class="col-lg-2 control-label">Estimated Time</label>
                            <div class="col-lg-10">
                                <input name="estimated" required="" type="text" class="form-control" id="estimated" placeholder="Estimated Time">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="actual" class="col-lg-2 control-label">Actual Time</label>
                            <div class="col-lg-10">
                                <input name="actual" required="" type="text" class="form-control" id="actual" placeholder="Actual Time">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="note" class="col-lg-2 control-label">Note</label>
                            <div class="col-lg-10">
                                <textarea name="note" class="form-control" placeholder="Note" rows="4" cols="20"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="status" class="col-lg-2 control-label">Status</label>
                            <div class="col-lg-10">
                                <input name="status" required="" type="text" class="form-control" id="status" placeholder="Status">
                            </div>
                        </div>
                        <input type="submit" class="btn btn-danger" />
                    </form>
                </div>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <jsp:forward page="admin" />
    </c:otherwise>
</c:choose>