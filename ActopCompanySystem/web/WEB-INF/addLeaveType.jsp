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

<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <style>
            <%@include file="styles/registerstyles.css" %>
        </style>
        <script>

        </script>
    </head>
    <body>
        <div id="bodycontainer">
            <%@include file="navigationbar.jsp" %>
            <div class="well" style="" id="logincontainer">
                <div id="logoholder">
                    <div>
                        <img src="../ActopSystem/images/favicon.png" />
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
</html>
