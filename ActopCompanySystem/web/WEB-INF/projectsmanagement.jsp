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
<m:retrieveattendance/>
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
                            Employers
                            <a href="register"><button style="float: right" class="btn btn-info">Add new Employer</button></a>
                            <div style="clear: both"></div>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Full Name</th>
                                            <th>Calling Name</th>
                                            <th>Branch</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${allemployers}" var="employer" begin="0" end="${fn:length(allemployers)}">
                                            <tr>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${employer.fullName}" /></td>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${employer.callingName}" /></td>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${employer.branch}" /></td>
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
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Attendance
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Employer</th>
                                            <th>Date</th>
                                            <th>Date time</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${attendances}" var="attendance" begin="0" end="${fn:length(attendances)}">
                                            <m:updatehibsession object="${attendance}" session="${hibsession}" />
                                            <tr>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${attendance.employers.callingName}" /></td>
                                                <td valign="middle" style="vertical-align:middle;">${attendance.attendanceDate}</td>
                                                <td valign="middle" style="vertical-align:middle;">${attendance.dateTime}</td>
                                                
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
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