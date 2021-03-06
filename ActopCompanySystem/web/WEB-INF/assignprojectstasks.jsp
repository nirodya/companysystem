<%-- 
    Document   : assignprojectstasks
    Created on : Jul 15, 2015, 1:52:01 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<niro:retrieveDesignations/>
<niro:retrieveDepartments/>
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
            <h3 style="width: 100%;text-align: center">Assign Project Tasks.</h3>
            <label style="color: red;">${msg}</label>
            <hr>
            <form  action="SaveAssignTasks" method="post">
                <div class="form-group">
                    <label for="empname" class="col-lg-2 control-label">Employer Name</label>
                    <div class="col-lg-10">
                        <niro:retrieveallEmplyers />
                        <select name="employer" required="" class="form-control col-lg-10" id="employer" placeholder="employer">
                            <c:forEach items="${allemployers}" var="employer" begin="0" end="${fn:length(allemployers)}">
                                <option value="${employer.idEmployers}"><niro:convertbytetostring text="${employer.fullName}" /></option>
                            </c:forEach>
                        </select>

                    </div>
                </div>
                <div class="form-group">
                    <label for="projectname" class="col-lg-2 control-label">Project</label>
                    <div class="col-lg-10">
                        <niro:retrieveProjects />
                        <select name="projectname" required="" class="form-control col-lg-10" id="projectname" placeholder="Project">
                            <c:forEach items="${projects}" var="project" begin="0" end="${fn:length(projects)}">
                                <option value="${project.idProjects}"><niro:convertbytetostring text="${project.projectName}" /></option>
                            </c:forEach>
                        </select>

                    </div>
                </div>
                <div class="form-group">
                    <label for="ttype" class="col-lg-2 control-label">Task Type</label>
                    <div class="col-lg-10">
                        <input name="ttype" required="" type="text" class="form-control" id="ttype" placeholder="Task Type">
                    </div>
                </div>
                <div class="form-group">
                    <label for="tnote" class="col-lg-2 control-label">Task Note</label>
                    <div class="col-lg-10">
                        <input name="tnote" required="" type="text" class="form-control" id="tnote" placeholder="Task Note">
                    </div>
                </div>
                <div class="form-group">
                    <label for="stdate" class="col-lg-2 control-label">Start Date</label>
                    <div class="col-lg-10">
                        <input name="stdate" required="" type="date" class="form-control" id="stdate" placeholder="Start Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="endate" class="col-lg-2 control-label">End Date</label>
                    <div class="col-lg-10">
                        <input name="endate" required="" type="date" class="form-control" id="endate" placeholder="End Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="assignby" class="col-lg-2 control-label">Assign By</label>
                    <div class="col-lg-10">
                        <input name="assignby" required="" type="text" class="form-control" id="assignby" placeholder="Assign By">
                    </div>
                </div>
                <div class="form-group">
                    <label for="status" class="col-lg-2 control-label">Task Status</label>
                    <div class="col-lg-10">
                        <input name="status" required="" type="text" class="form-control" id="status" placeholder="Task Status">
                    </div>
                </div>
                <div class="form-group">
                    <label for="priority" class="col-lg-2 control-label">Task Priority</label>
                    <div class="col-lg-10">
                        <input name="priority" required="" type="number" class="form-control" id="priority" placeholder="Task Priority">
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
                <div style="clear: both"></div>
                <input class="btn btn-danger" value="Save" type="submit" />
                <div style="clear: both"></div>
            </form>
        </div>
    </body>
</html>
</compress:html>
