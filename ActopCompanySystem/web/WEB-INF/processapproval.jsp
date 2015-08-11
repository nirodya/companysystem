<%-- 
    Document   : processapproval
    Created on : Aug 6, 2015, 5:23:05 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
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
                    <c:choose>
                        <c:when test="${param.type=='payapproval'}">
                            <label id="loginheader"><h4>Process Payment Approval</h4></label>
                            <form class="form-horizontal" action="ApprovePayment" method="post">
                                <m:getpaymentapproval pid="${param.id}">
                                    <m:openHibSession />
                                    <m:updatehibsession object="${paymentApproval}" session="${hibsession}" />
                                    <input type="hidden" name="id" value="${param.id}" />
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Employer Name</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${paymentApproval.payments.employers.callingName}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Payment Type</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${paymentApproval.payments.paymentTypes}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Payment For</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${paymentApproval.payments.paymentFor}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Payment</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${paymentApproval.payments.payment}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Request Date</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control">${paymentApproval.payments.paymentDate}</label>
                                        </div>
                                    </div>
                                    <c:when test="${paymentApproval.payments.paymentPayed!=null}">
                                        <div class="form-group">
                                            <label for="ltype" class="col-lg-2 control-label">Payed Date</label>
                                            <div class="col-lg-10">
                                                <label for="ltype" class="form-control">${paymentApproval.payments.paymentPayed}</label>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:choose>
                                        <c:when test="${paymentApproval.status==0}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Pending</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Note</label>
                                                <div class="col-lg-10">
                                                    <textarea name="note" for="ltype" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Approval</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="approval">
                                                        <option value="1">Approve</option>
                                                        <option value="2">Disapprove</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-primary" />
                                        </c:when>
                                        <c:when test="${paymentApproval.status==1}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${paymentApproval.status==2}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Not Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                    <input value="Add New Interface" type="submit" class="btn btn-info btn-raised" />
                                </m:getpaymentapproval>
                                <m:closehibsession session="${hibsession}"/>
                            </form>
                        </c:when>
                        <c:when test="${param.type=='leaveapproval'}">
                            <label id="loginheader"><h4>Process Leave Approval</h4></label>
                            <form class="form-horizontal" action="SaveInterface" method="post">
                                <m:getleaveapproval lid="${param.id}" >
                                    <m:openHibSession />
                                    <m:updatehibsession object="${leaveApprove}" session="${hibsession}" />
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Employer Name</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${leaveApprove.leave.employers.callingName}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Leave Type</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${leaveApprove.leave.leaveType}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Days</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${leaveApprove.leave.noOfDays}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Substitute</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${leaveApprove.leave.substitute}" /></label>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${leaveApprove.status==0}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Pending</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Note</label>
                                                <div class="col-lg-10">
                                                    <textarea name="note" for="ltype" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Approval</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="approval">
                                                        <option value="1">Approve</option>
                                                        <option value="2">Disapprove</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-primary" />
                                        </c:when>
                                        <c:when test="${leaveApprove.status==1}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${leaveApprove.status==2}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Not Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </m:getleaveapproval>
                                <m:closehibsession session="${hibsession}" />
                            </form>
                        </c:when>
                        <c:when test="${param.type=='projectapproval'}">
                            <m:getprojectapproval proid="${param.id}">
                                <m:openHibSession />
                                <m:updatehibsession object="${projectsApproval}" session="${hibsession}" />
                                <label id="loginheader"><h4>Process Payment Approval</h4></label>
                                <form class="form-horizontal" action="ApproveProject" method="post">
                                    <input type="hidden" name="id" value="${param.id}" />
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Employer Name</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${projectsApproval.projects.employers.callingName}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Project Name</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${projectsApproval.projects.projectName}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Project Type</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${projectsApproval.projects.projectType}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Project Description</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${projectsApproval.projects.projectDescription}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Project Manager</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${projectsApproval.projects.projectManager}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Client Note</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${projectsApproval.projects.clientNote}" /></label>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${projectsApproval.status==0}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Pending</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Note</label>
                                                <div class="col-lg-10">
                                                    <textarea name="note" for="ltype" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Approval</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="approval">
                                                        <option value="1">Approve</option>
                                                        <option value="2">Disapprove</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-primary" />
                                        </c:when>
                                        <c:when test="${projectsApproval.status==1}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${projectsApproval.status==2}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Not Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </form>
                            </m:getprojectapproval>
                            <m:closehibsession session="${hibsession}" />
                        </c:when>
                        <c:when test="${param.type=='promotionapproval'}">
                            <m:getPromotion promoid="${param.id}" >
                                <m:openHibSession />
                                <m:updatehibsession object="${promotionapprove}" session="${hibsession}" />
                                <label id="loginheader"><h4>Process Payment Approval</h4></label>
                                <form class="form-horizontal" action="ApprovePromotion" method="post">
                                    <input type="hidden" name="id" value="${param.id}" />
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Employer Name</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${promotionapprove.promotions.employers.callingName}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Designation</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${promotionapprove.promotions.beforePromotion}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Applied Designation</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${promotionapprove.promotions.promotionFor}" /></label>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${promotionapprove.status==0}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Pending</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Note</label>
                                                <div class="col-lg-10">
                                                    <textarea name="note" for="ltype" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Approval</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="approval">
                                                        <option value="1">Approve</option>
                                                        <option value="2">Disapprove</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-primary" />
                                        </c:when>
                                        <c:when test="${promotionapprove.status==1}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${promotionapprove.status==2}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Not Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </form>
                            </m:getPromotion>
                            <m:closehibsession session="${hibsession}" />
                        </c:when>
                        <c:when test="${param.type=='projectTaskapproval'}">
                            <m:getprojecttaskapproval ptid="${param.id}" >
                                <m:openHibSession />
                                <m:updatehibsession object="${projectTaskApproval}" session="${hibsession}" />
                                <label id="loginheader"><h4>Process Promotion Approval</h4></label>
                                <form class="form-horizontal" action="ApproveProjectTask" method="post">
                                    <input name="id" type="hidden" value="${param.id}" />
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Employer Name</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${projectTaskApproval.projectTasks.employers.callingName}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Task Type</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${projectTaskApproval.projectTasks.projectTaskType}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Assign Date</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control">${projectTaskApproval.projectTasks.projectTaskStart}</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Assigned By</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${projectTaskApproval.projectTasks.projectTaskAssingBy}" /></label>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${projectTaskApproval.status==0}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Pending</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Note</label>
                                                <div class="col-lg-10">
                                                    <textarea name="note" for="ltype" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Approval</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="approval">
                                                        <option value="1">Approve</option>
                                                        <option value="2">Disapprove</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-primary" />
                                        </c:when>
                                        <c:when test="${projectTaskApproval.status==1}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${projectTaskApproval.status==2}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Not Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </form>
                            </m:getprojecttaskapproval>
                            <m:closehibsession session="${hibsession}" />
                        </c:when>
                        <c:when test="${param.type=='otherapproval'}">
                            <m:getotherapprovals oid="${param.id}">
                                <m:openHibSession />
                                <m:updatehibsession object="${otherapproval}" session="${hibsession}" />
                                <label id="loginheader"><h4>Process Other Approvals</h4></label>
                                <form class="form-horizontal" action="ApproveOther" method="post">
                                    <input name="id" value="${param.id}" type="hidden" />
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Employer Name</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${otherapproval.other.employers.callingName}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Type</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${otherapproval.other.otherType}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Location</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${otherapproval.other.location}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Reason</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${otherapproval.other.reson}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Expenses</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${otherapproval.other.expenses}" /></label>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${otherapproval.status==0}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Pending</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Note</label>
                                                <div class="col-lg-10">
                                                    <textarea name="note" for="ltype" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Approval</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="approval">
                                                        <option value="1">Approve</option>
                                                        <option value="2">Disapprove</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-primary" />
                                        </c:when>
                                        <c:when test="${otherapproval.status==1}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${otherapproval.status==2}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Not Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </form>
                                <m:closehibsession session="${hibsession}" />
                            </m:getotherapprovals>
                        </c:when>
                        <c:when test="${param.type=='allowanceapproval'}">
                            <m:getallowanceapproval aid="${param.id}">
                                <m:openHibSession />
                                <m:updatehibsession object="${allowanceApproval}" session="${hibsession}" />
                                <label id="loginheader"><h4>Process Payment Approval</h4></label>
                                <form class="form-horizontal" action="ApproveAllowance" method="post">
                                    <input name="id" value="${param.id}" type="hidden" />
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Employer Name</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${allowanceApproval.EmployersHasAllowances.employers.callingName}" /></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ltype" class="col-lg-2 control-label">Allowance</label>
                                        <div class="col-lg-10">
                                            <label for="ltype" class="form-control"><m:convertbytetostring text="${allowanceApproval.EmployersHasAllowances.allowances.allowanceType}" /></label>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${allowanceApproval.status==0}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Pending</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Note</label>
                                                <div class="col-lg-10">
                                                    <textarea name="note" for="ltype" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Approval</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="approval">
                                                        <option value="1">Approve</option>
                                                        <option value="2">Disapprove</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-primary" />
                                        </c:when>
                                        <c:when test="${allowanceApproval.status==1}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${allowanceApproval.status==2}">
                                            <div class="form-group">
                                                <label for="ltype" class="col-lg-2 control-label">Status</label>
                                                <div class="col-lg-10">
                                                    <label for="ltype" class="form-control">Not Approved</label>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </form>
                                <m:closehibsession session="${hibsession}" />
                            </m:getallowanceapproval>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </body>
    </html>
</compress:html>