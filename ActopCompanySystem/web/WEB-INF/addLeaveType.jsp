<%-- 
    Document   : addLeaveType
    Created on : Jul 23, 2015, 1:25:11 PM
    Author     : J.R.K. Wickramasinghe(Actop Technologies)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/actoptags.tld" prefix="m" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<m:retrieveallleavetypes/>
<m:retrieveallspclleavetypes/>
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
    <body>
        <div id="bodycontainer">
            <%@include file="navigationbar.jsp" %>
            <div class="well" style="" id="logincontainer">
                <div id="logoholder">
                    <div>
                        <img src="images/favicon.png" />
                    </div>
                </div>
                <label id="loginheader"><h3>Leave Types</h3></label>
                <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">

                    <table class="table">
                        <thead>
                            <tr>

                                <th>Leave Type ID</th>
                                <th>Leave Type</th>

                                <th></th>
                            </tr>
                        </thead>
                        <tbody>


                            <c:forEach items="${allleavetypes}" var="allleavetype" begin="0" end="${fn:length(allleavetypes)}">
                                <tr>
                                    <td valign="middle" style="vertical-align:middle;" />${allleavetype.idLeaveTypes}</td>
                                    <td valign="middle" style="vertical-align:middle;">${allleavetype.leaveType}</td>
                                    <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>


                </div>

                <label id="loginheader"><h4>Add new Leave Type</h4></label>
                <form class="form-horizontal" action="SaveLeaveType?stype=nrml" method="post">
                    <div class="form-group">
                        <label for="ltype" class="col-lg-2 control-label">Leave Type</label>
                        <div class="col-lg-10">
                            <input type="text" name="ltype" value="" class="form-control" id="ltype"/>

                            <input value="Add New Leave Type" type="submit" class="btn btn-info btn-raised" />
                        </div></div>
                </form>
                <label id="loginheader"><h3>Special Leave Types</h3></label>
                <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">

                    <table class="table">
                        <thead>
                            <tr>

                                <th>Leave Type ID</th>
                                <th>Leave Type</th>
                                <th>Start Date</th>
                                <th>End Date</th>

                                <th></th>
                            </tr>
                        </thead>
                        <tbody>


                            <c:forEach items="${allspclleavetypes}" var="allspclleavetype" begin="0" end="${fn:length(allspclleavetypes)}">
                                <tr>
                                    <td valign="middle" style="vertical-align:middle;" />${allspclleavetype.idSpecialHolidays}</td>
                                    <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${allspclleavetype.holidayType}" /></td>
                                    <td valign="middle" style="vertical-align:middle;" />${allspclleavetype.startDate}</td>
                                    <td valign="middle" style="vertical-align:middle;">${allspclleavetype.endDate}</td>
                                    <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>


                </div>

                <label id="loginheader"><h4>Add Special Leave Type</h4></label>
                <form class="form-horizontal" action="SaveLeaveType?stype=spcl" method="post">
                    <div class="form-group">
                        <label for="spcltype" class="col-lg-2 control-label">Leave Type</label>
                        <div class="col-lg-10">
                            <input type="text" name="spcltype" value="" class="form-control" id="spcltype"/>
                        </div>
                        </div>  
                    <div class="form-group">
                        <label for="spcltype" class="col-lg-2 control-label">Start Date</label>
                        <div class="col-lg-10">
                            <input name="sdate" required="required" type="date" class="form-control" id="sdate" placeholder="Start Date">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="spcltype" class="col-lg-2 control-label">End Date</label>
                        <div class="col-lg-10">
                            <input name="edate" required="required" type="date" class="form-control" id="edate" placeholder="End Date">
                        
                            <input value="Add Special Leave Type" type="submit" class="btn btn-info btn-raised" />
                        </div>
                    </div>
                    </div>    
                </form>
            </div>
        </div>
    </body>
     <body ng-app="myApp">
        <%@include file="navigationbar.jsp" %>
        <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">
           <label id="loginheader"><h3>Leave Types</h3></label>
                <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">

                    <table class="table">
                        <thead>
                            <tr>

                                <th>Leave Type ID</th>
                                <th>Leave Type</th>

                                <th></th>
                            </tr>
                        </thead>
                        <tbody>


                            <c:forEach items="${allleavetypes}" var="allleavetype" begin="0" end="${fn:length(allleavetypes)}">
                                <tr>
                                    <td valign="middle" style="vertical-align:middle;" />${allleavetype.idLeaveTypes}</td>
                                    <td valign="middle" style="vertical-align:middle;">${allleavetype.leaveType}</td>
                                    <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger ">Remove</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>


                </div>
           
            <label style="color: red">${msg}</label>
            <hr>
            
            <form  action="AddAllowance" method="post">
                <div class="form-group">
                    <label for="nic" class="col-lg-2 control-label">Allowance Type</label>
                    <div class="col-lg-10">
                        <select name="allowancetype" required="" class="form-control" id="designation" placeholder="Designation">
                            <c:forEach items="${allowances}" var="allowance" begin="0" end="${fn:length(allowances)}">
                                <option value="${allowance.idAllowances}"><niro:convertbytetostring text="${allowance.allowanceType}" /></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <niro:retrieveallEmplyers />
                <div class="form-group">
                    <label class="col-lg-2 control-label">Employer</label>
                    <div class="col-lg-10">
                        <select name="eid" required="" class="form-control" id="designation" placeholder="Employer">
                            <c:forEach items="${allemployers}" var="employer" begin="0" end="${fn:length(allemployers)}">
                                <option value="${employer.idEmployers}"><niro:convertbytetostring text="${employer.callingName}" /></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <niro:retrieveDesignations/>
                <div class="form-group">
                    <label for="nic" class="col-lg-2 control-label">Designation</label>
                    <div class="col-lg-10">
                        <select name="designation" required="" class="form-control" id="designation" placeholder="Designation">
                            <c:forEach items="${designations}" var="designation" begin="0" end="${fn:length(designations)}">
                                <option value="${designation.idDesignation}"><niro:convertbytetostring text="${designation.designation}" /></option>
                            </c:forEach>
                        </select>
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
                <input class="btn btn-info" value="Apply" type="submit" />
                <div style="clear: both"></div>
            </form>
        </div>
    </body>
</html>
</compress:html>