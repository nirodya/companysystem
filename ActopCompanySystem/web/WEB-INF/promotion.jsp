<%-- 
    Document   : promotion
    Created on : Jul 14, 2015, 12:49:43 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<niro:retrieveDesignations/>
<niro:retrieveDepartments/>
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
            <h3 style="width: 100%;text-align: center">Apply For Promotion</h3>
            <hr>
            <form  action="ApplyPromotion" method="post">
                <div class="form-group">
                    <label for="nic" class="col-lg-2 control-label">Current Designation</label>
                    <div class="col-lg-10">

                        <select name="currentdesignation" required="" class="form-control" id="designation" placeholder="Designation">
                            <c:forEach items="${designations}" var="designations" begin="0" end="${fn:length(designations)}">
                                <option><niro:convertbytetostring text="${designations.designation}" /></option>
                            </c:forEach>
                        </select>

                    </div>
                </div>
                <niro:retrieveDesignations/>
                <div class="form-group">
                    <label for="nic" class="col-lg-2 control-label">Apply for</label>
                    <div class="col-lg-10">

                        <select name="designation" required="" class="form-control" id="designation" placeholder="Designation">
                            <c:forEach items="${designations}" var="designation" begin="0" end="${fn:length(designations)}">
                                <option><niro:convertbytetostring text="${designation.designation}" /></option>
                            </c:forEach>
                        </select>

                    </div>
                </div>
                <div class="form-group">
                    <label for="payeddate" class="col-lg-2 control-label">Need Approvals</label>
                    <div ng-controller="myCtrl" class="col-lg-5">

                        <select name="depthasdesigid" id="depts" ng-change="changeItem()" multiple  class="form-control" ng-model="selectedItemvalue">

                            <option ng-repeat="sel in selectables" value="{{sel.value}}">{{sel.label}}</option>
                        </select>

                        <p id="desres" ng-model="desres"></p>

                    </div>
                    <div ng-controller="myCtrl" class="col-lg-5">

                        <select id="desigs" required=""  class="form-control" multiple ng-model="selectedItemvalue">


                        </select>

                    </div>
                </div>
                <br>
                <div style="clear: both"></div>
                <input class="btn btn-info" value="Apply" type="submit" />
                <div style="clear: both"></div>
            </form>
        </div>
    </body>
</html>
