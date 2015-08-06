<%-- 
    Document   : other
    Created on : Jul 30, 2015, 5:44:39 PM
    Author     : ACTOP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
<niro:retrieveDesignations/>
<niro:retrieveDepartments/>
<niro:retrieveothertypes />
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
            <h3 style="width: 100%;text-align: center">Other Payment</h3>
            <label style="color: red;">${msg}</label>
            <hr>
            <form  action="SaveOther" method="post">
                <div class="form-group">
                    <label for="empname" class="col-lg-2 control-label">Other Type</label>
                    <div class="col-lg-10">
                        <niro:retrieveallEmplyers />
                        <select name="type" required="" class="form-control col-lg-10" id="designation" placeholder="Designation">
                            <c:forEach items="${othertype}" var="type" begin="0" end="${fn:length(othertype)}">
                                <option value="${type.idOtherTypes}">${type.otherType}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="location" class="col-lg-2 control-label">Location</label>
                    <div class="col-lg-10">
                        <input name="location" required="" type="text" class="form-control" id="ptype" placeholder="Location">
                    </div>
                </div>
                <div class="form-group">
                    <label for="indate" class="col-lg-2 control-label">In Date</label>
                    <div class="col-lg-10">
                        <input name="indate" required="" type="date" class="form-control" id="pfor" placeholder="In Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="outdate" class="col-lg-2 control-label">Out Date</label>
                    <div class="col-lg-10">
                        <input name="outdate" required="" type="date" class="form-control" id="outdate" placeholder="Out Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="reason" class="col-lg-2 control-label">Reason</label>
                    <div class="col-lg-10">
                        <input name="reason" required="" type="text" class="form-control" id="reason" placeholder="Reason">
                    </div>
                </div>
                <div class="form-group">
                    <label for="note" class="col-lg-2 control-label">Note</label>
                    <div class="col-lg-10">
                        <textarea name="note" class="form-control" placeholder="Payment Status"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="expenses" class="col-lg-2 control-label">Expenses</label>
                    <div class="col-lg-10">
                        <input name="expenses" required="" type="text" class="form-control" id="expenses" placeholder="Expenses">
                    </div>
                </div>
                <div class="form-group">
                    <label for="claim" class="col-lg-2 control-label">Claim</label>
                    <div class="col-lg-10">
                        <input name="claim" required="" type="number" class="form-control" id="claim" placeholder="Claim">
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