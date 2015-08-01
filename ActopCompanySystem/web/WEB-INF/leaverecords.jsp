<%-- 
    Document   : leaverecords
    Created on : Jul 21, 2015, 4:02:29 PM
     Author     : J.R.K. Wickramasinghe(Actop Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/actoptags.tld" prefix="m" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<m:retrieveallleaves/>
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
                            Leave
                            <a href="leave"><button style="float: right" class="btn btn-info">Add new Leave</button></a>
                            <div style="clear: both"></div>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                    <tr>
                        <th>Employer ID</th>
                        <th>Leave Type</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Number of Dates</th>
                        <th>Substitute</th>
                        <th>Substitute Approved Date</th>
                        
                        <th></th>
                    </tr>
                </thead>
                                    <tbody>
                                         <c:forEach items="${allleaves}" var="leaves" begin="0" end="${fn:length(allleaves)}">
                        <tr>
                            <td valign="middle" style="vertical-align:middle;"/>${leaves.employers.idEmployers}</td>
                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${leaves.leaveType}" /></td>
                            <td valign="middle" style="vertical-align:middle;"  />${leaves.startDate}</td>
                            <td valign="middle" style="vertical-align:middle;"  />${leaves.endDate}</td>
                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${leaves.noOfDays}" /></td>
                            <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${leaves.substitute}" /></td>
                            <td valign="middle" style="vertical-align:middle;">${leaves.substituteApprove}</td>
                             <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger   ">Edit Details</button></td>
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
