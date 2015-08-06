<%-- 
    Document   : approvals
    Created on : Aug 6, 2015, 10:20:27 AM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
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
            <div id="bodycontainer">
                <%@include file="navigationbar.jsp" %>
                <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">
                    <h3 style="width: 100%;text-align: center">Approvals</h3>
                    <label style="color: red">${msg}</label>
                    <hr>
                    <form  action="AddAllowance" method="post">
                        <niro:retrievepaymentapproval>
                            <div class="form-group">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Employer</th>
                                            <th>Payment Type</th>
                                            <th>Payment</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${paymentApprovals}" var="payapproval" begin="0" end="${fn:length(paymentApprovals)}">
                                            <niro:openHibSession />
                                            <niro:updatehibsession object="${payapproval}" session="${hibsession}" />
                                            <c:choose>
                                                <c:when test="${payapproval.status==0}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${payapproval.payments.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${payapproval.payments.paymentFor}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${payapproval.payments.payment}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:when test="${payapproval.status==1}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${payapproval.payments.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${payapproval.payments.paymentFor}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${payapproval.payments.payment}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Approved</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${payapproval.payments.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${payapproval.payments.paymentFor}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${payapproval.payments.payment}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Disapproved</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            <niro:closehibsession session="${hibsession}"/>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </niro:retrievepaymentapproval>
                        <niro:retrieveleaveapproval>
                            <div class="form-group">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Employer</th>
                                            <th>Leave Type</th>
                                            <th>No of time</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${leaveApprovals}" var="leaveapproval" begin="0" end="${fn:length(leaveApprovals)}">
                                            <niro:openHibSession />
                                            <niro:updatehibsession object="${leaveapproval}" session="${hibsession}" />
                                            <c:choose>
                                                <c:when test="${leaveapproval.status==0}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${leaveapproval.leave.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${leaveapproval.leave.leaveType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${leaveapproval.leave.noOfDays}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:when test="${leaveapproval.status==1}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${leaveapproval.leave.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${leaveapproval.leave.leaveType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${leaveapproval.leave.noOfDays}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Approved</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${leaveapproval.leave.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${leaveapproval.leave.leaveType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${leaveapproval.leave.noOfDays}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Disapproved</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            <niro:closehibsession session="${hibsession}"/>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </niro:retrieveleaveapproval>
                        <niro:retrieveprojectapproval>
                            <div class="form-group">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Employer</th>
                                            <th>Project Type</th>
                                            <th>No of time</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${projectApprovals}" var="projectapproval" begin="0" end="${fn:length(projectApprovals)}">
                                            <niro:openHibSession />
                                            <niro:updatehibsession object="${projectapproval}" session="${hibsession}" />
                                            <c:choose>
                                                <c:when test="${projectapproval.status==0}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectapproval.projects.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectapproval.projects.projectType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectapproval.projects.projectName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:when test="${projectapproval.status==1}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectapproval.projects.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectapproval.projects.projectType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectapproval.projects.projectName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Approved</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectapproval.projects.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectapproval.projects.projectType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectapproval.projects.projectName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Disapproved</button></td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            <niro:closehibsession session="${hibsession}"/>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </niro:retrieveprojectapproval>
                        <niro:retrievepromotionapproval>
                            <div class="form-group">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Employer</th>
                                            <th>Project Type</th>
                                            <th>No of time</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${promotionapprovals}" var="promotionapproval" begin="0" end="${fn:length(promotionapprovals)}">
                                            <niro:openHibSession />
                                            <niro:updatehibsession object="${promotionapproval}" session="${hibsession}" />
                                            <c:choose>
                                                <c:when test="${promotionapproval.status==0}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotionapproval.promotions.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotionapproval.promotions.beforePromotion}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotionapproval.promotions.promotionFor}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:when test="${promotionapproval.status==1}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotionapproval.promotions.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotionapproval.promotions.beforePromotion}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotionapproval.promotions.promotionFor}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Approved</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotionapproval.promotions.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotionapproval.promotions.beforePromotion}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${promotionapproval.promotions.promotionFor}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Disapproved</button></td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            <niro:closehibsession session="${hibsession}"/>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </niro:retrievepromotionapproval>
                        <niro:retrieveprojecttaskapproval>
                            <div class="form-group">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Employer</th>
                                            <th>Project Type</th>
                                            <th>No of time</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${projectTaskApprovals}" var="projectTaskApproval" begin="0" end="${fn:length(projectTaskApprovals)}">
                                            <niro:openHibSession />
                                            <niro:updatehibsession object="${projectTaskApproval}" session="${hibsession}" />
                                            <c:choose>
                                                <c:when test="${projectTaskApproval.status==0}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectTaskApproval.projectTasks.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectTaskApproval.projectTasks.projectTaskType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">${projectTaskApproval.projectTasks.projectTaskPriority}</td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:when test="${promotionapproval.status==1}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectTaskApproval.projectTasks.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectTaskApproval.projectTasks.projectTaskType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">${projectTaskApproval.projectTasks.projectTaskPriority}</td>
                                                        <td valign="middle" style="vertical-align:middle;">Approved</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectTaskApproval.projectTasks.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${projectTaskApproval.projectTasks.projectTaskType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">${projectTaskApproval.projectTasks.projectTaskPriority}</td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Disapproved</button></td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            <niro:closehibsession session="${hibsession}"/>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </niro:retrieveprojecttaskapproval>
                        <niro:retrieveotherapproval>
                            <div class="form-group">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Employer</th>
                                            <th>Project Type</th>
                                            <th>No of time</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${otherApprovals}" var="otherApproval" begin="0" end="${fn:length(otherApprovals)}">
                                            <niro:openHibSession />
                                            <niro:updatehibsession object="${otherApproval}" session="${hibsession}" />
                                            <c:choose>
                                                <c:when test="${otherApproval.status==0}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${otherApproval.other.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${otherApproval.other.otherType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${otherApproval.other.expenses}"/></td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:when test="${otherApproval.status==1}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${otherApproval.other.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${otherApproval.other.otherType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">${otherApproval.other.expenses}</td>
                                                        <td valign="middle" style="vertical-align:middle;">Approved</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${otherApproval.other.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${otherApproval.other.otherType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">${otherApproval.other.expenses}</td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Disapproved</button></td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            <niro:closehibsession session="${hibsession}"/>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </niro:retrieveotherapproval>
                        <niro:retrieveallowences>
                            <div class="form-group">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Employer</th>
                                            <th>Project Type</th>
                                            <th>No of time</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${allowanceApprovals}" var="allowanceApproval" begin="0" end="${fn:length(allowanceApprovals)}">
                                            <niro:openHibSession />
                                            <niro:updatehibsession object="${allowanceApproval}" session="${hibsession}" />
                                            <c:choose>
                                                <c:when test="${allowanceApproval.status==0}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${allowanceApproval.employersHasAllowances.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${allowanceApproval.employersHasAllowances.allowances.allowanceType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:when test="${otherApproval.status==1}">
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${allowanceApproval.employersHasAllowances.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${allowanceApproval.employersHasAllowances.allowances.allowanceType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Approved</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${allowanceApproval.employersHasAllowances.employers.callingName}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;"><niro:convertbytetostring text="${allowanceApproval.employersHasAllowances.allowances.allowanceType}" /></td>
                                                        <td valign="middle" style="vertical-align:middle;">Pending</td>
                                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Disapproved</button></td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            <niro:closehibsession session="${hibsession}"/>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </niro:retrieveallowences>
                        <div style="clear: both"></div>
                    </form>
                </div>
            </div>
        </body>
    </html>
</compress:html>