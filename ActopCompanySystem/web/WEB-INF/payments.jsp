<%-- 
    Document   : payments
    Created on : Jul 15, 2015, 12:07:18 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<niro:retrieveDesignations/>
<niro:retrieveDepartments/>
<niro:retrievepaymenttypes/>
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>

        <script>
            <%@include file="js/adminjs.js" %>
        </script>
        <script>
            var app = angular.module('myApp', []);
// controller here
            app.controller('myCtrl', function ($scope, $http) {
                $scope.selectables = [
            <c:forEach items="${departments}" var="department" begin="0" end="${fn:length(departments)}">
                    {label: '<niro:convertbytetostring text="${department.department}" />', value: ${department.idDepartment}},
            </c:forEach>
                ];
                $scope.changeItem = function () {
                    var reqtest = '';
                    for (var i = 0; i < $('#depts').val().length; i++) {
                        if (i < 1)
                            reqtest += $('#depts').val()[i];
                        else
                            reqtest += "&depid=" + $('#depts').val()[i];
                    }

                    $http.get("GetDesignationFromDept?depid=" + reqtest)
                            .success(function (response) {
                                console.log(response);

                                $('#desigs').html(response);
                                $scope.desigs = response;
//                                $scope.names = response.records;
//                                $scope.test = "test";
                            });

                    $scope.desres = "awa";
                };
                // this is the model that's used for the data binding in the select directive
                // the default selected item
                //using value, i want to set the selected value
//                                $scope.selectedItemvalue = "2";
            });</script>
    </head>
    <body ng-app="myApp">
        <%@include file="navigationbar.jsp" %>
        <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">
            <h3 style="width: 100%;text-align: center">Payment to Employer</h3>
            <label style="color: red;">${msg}</label>
            <hr>
            <form  action="savePayment" method="post">
                <div class="form-group">
                    <label for="empname" class="col-lg-2 control-label">Employer Name</label>
                    <div class="col-lg-10">
                        <niro:retrieveallEmplyers />
                        <select name="employer" required="" class="form-control col-lg-10" id="designation" placeholder="Designation">
                            <c:forEach items="${allemployers}" var="employer" begin="0" end="${fn:length(allemployers)}">
                                <option value="${employer.idEmployers}"><niro:convertbytetostring text="${employer.fullName}" /></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ptype" class="col-lg-2 control-label">Payment Type</label>
                    <div class="col-lg-10">
                        <select name="ptype" required="" class="form-control col-lg-10" id="ptype" placeholder="Payment Type">
                            <c:forEach items="${paymenttypes}" var="paymenttype" begin="0" end="${fn:length(paymenttypes)}">
                                <option>${paymenttype.paymentType}</option>
                            </c:forEach>
                        </select>
                        <input name="ptype" required="" type="text" class="form-control" id="ptype" placeholder="Payment Type">
                    </div>
                </div>
                <div class="form-group">
                    <label for="pfor" class="col-lg-2 control-label">Payment For</label>
                    <div class="col-lg-10">
                        <input name="pfor" required="" type="text" class="form-control" id="pfor" placeholder="Payment For">
                    </div>
                </div>
                <div class="form-group">
                    <label for="payment" class="col-lg-2 control-label">Payment</label>
                    <div class="col-lg-10">
                        <input name="payment" required="" type="text" class="form-control" id="payment" placeholder="Payment">
                    </div>
                </div>
                <div class="form-group">
                    <label for="pdate" class="col-lg-2 control-label">Payment Date</label>
                    <div class="col-lg-10">
                        <input name="pdate" required="" type="date" class="form-control" id="pdate" placeholder="Payment Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="pstatus" class="col-lg-2 control-label">Payment Status</label>
                    <div class="col-lg-10">
                        <input name="pstatus" required="" type="text" class="form-control" id="pstatus" placeholder="Payment Status">
                    </div>
                </div>
                <div class="form-group">
                    <label for="payeddate" class="col-lg-2 control-label">Payed Date</label>
                    <div class="col-lg-10">
                        <input name="payeddate" required="" type="date" class="form-control" id="payeddate" placeholder="Payed Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="payeddate" class="col-lg-2 control-label">Need Approvals</label>
                    <div ng-controller="myCtrl" class="col-lg-5">
                        <select name="depthasdesigid" id="depts" ng-change="changeItem()"  class="form-control" multiple ng-model="selectedItemvalue">
                            <option ng-repeat="sel in selectables" value="{{sel.value}}">{{sel.label}}</option>
                        </select>
                        <p id="desres" ng-model="desres"></p>
                    </div>
                    <div ng-controller="myCtrl" class="col-lg-5">
                        <select id="desigs" required=""  class="form-control" multiple ng-model="selectedItemvalue">
                        </select>
                    </div>
                </div>
                <input class="btn btn-danger" value="Save" type="submit" />
                <div style="clear: both"></div>
            </form>
        </div>
    </body>
</html>
</compress:html>
