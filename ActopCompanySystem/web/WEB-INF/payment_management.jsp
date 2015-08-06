<%-- 
    Document   : payment_management
    Created on : Jul 21, 2015, 1:17:08 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/actoptags.tld" prefix="m" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<m:retrievePayments/>
<m:openHibSession/>
<m:retrieveemphasallowances/>
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
                            Payments
                            <a href="payments"><button style="float: right" class="btn btn-success">Pay for an Employer</button></a>

                            <div style="clear: both"></div>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Payment Type</th>
                                            <th>Payment</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${payments}" var="payment" begin="0" end="${fn:length(payments)}">
                                            <m:updatehibsession object="${payment}" session="${hibsession}" />
                                            <tr>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${payment.employers.callingName}" /></td>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${payment.paymentTypes}" /></td>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${payment.payment}" /></td>
                                                <td valign="top"><button data-toggle="modal" data-target="#myModal${payment.idPayments}" class="btn btn-danger">View Details</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <!--Data Models-->
                                <c:forEach items="${payments}" var="payment" begin="0" end="${fn:length(payments)}">
                                    <div class="modal fade" id="myModal${payment.idPayments}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">Modal title Here</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Payment Type</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label"><m:convertbytetostring text="${payment.paymentTypes}" /></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Payment For</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label"><m:convertbytetostring text="${payment.paymentFor}" /></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Payment</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label"><m:convertbytetostring text="${payment.payment}" /></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Payment Date</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label">${payment.paymentDate}</label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Approved By</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label"><m:convertbytetostring text="${payment.paymentApprovedBy}" /></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Approved Date</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label">${paymentApproved}</label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Status</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label"><m:convertbytetostring text="${payment.paymentStates}" /></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Payed Date</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label">${paymentPayed}</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="clear: both"></div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!--Data Models End-->
                            </div>
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Allowances
                            <a href="addallowance"><button style="float: right" class="btn btn-default">Add allowances</button></a>
                            <div style="clear: both"></div>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Allowance Type</th>
                                            <th>Maximum</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${emphasallowances}" var="emphasallowance" begin="0" end="${fn:length(emphasallowances)}">
                                            <m:updatehibsession object="${emphasallowance}" session="${hibsession}" />
                                            <tr>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${emphasallowance.employers.callingName}" /></td>
                                                <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${emphasallowance.allowances.allowanceType}" /></td>
                                                <td valign="middle" style="vertical-align:middle;">${emphasallowance.allowances.allowanceMaximum}</td>
                                                <td valign="top"><button data-toggle="modal" data-target="#myModal${emphasallowance.idEmployersHasAllowances}" class="btn btn-danger">View Details</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <!--Data Models-->
                                <c:forEach items="${emphasallowances}" var="emphasallowance" begin="0" end="${fn:length(emphasallowances)}">
                                    <div class="modal fade" id="myModal${emphasallowance.idEmployersHasAllowances}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">Allowance Details</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Name</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label"><m:convertbytetostring text="${emphasallowance.employers.fullName}" /></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Allowance Type</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label"><m:convertbytetostring text="${emphasallowance.allowances.allowanceType}" /></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Minimum</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label">${emphasallowance.allowances.allownceMinimum}</label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Maximum</label>
                                                        <div class="col-lg-8">
                                                            <label class="control-label">${emphasallowance.allowances.allowanceMaximum}</label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                </div>
                                                <div style="clear: both"></div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!--Data Models End-->
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
        <footer><p>All right reserved. <a href="http://actoptec.com">ACTOP Technologies</a></p></footer>
    </body>
</html>
<m:closehibsession session="${hibsession}"/>
</compress:html>