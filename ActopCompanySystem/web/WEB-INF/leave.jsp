<%-- 
    Document   : leave
    Created on : Jul 14, 2015, 4:02:40 PM
    Author     : J.R.K. Wickramasinghe(Actop Technologies)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <style>
            <%@include file="styles/registerstyles.css" %>
        </style>
        <script>

            $("#bloodselect").dropdown();

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
                <label id="loginheader"><h3>Apply a Leave</h3></label>
                <form class="form-horizontal" action="SaveLeave" method="post">
                    <div class="form-group">
                        <label for="empid" class="col-lg-2 control-label">Employee ID</label>
                        <div class="col-lg-10">
                            <!--<input name="empid" required="" type="text" class="form-control" id="nic" placeholder="Employee ID">-->
                           <input type="text" name="empid" value="${loggedUser.employers.idEmployers}" class="form-control" id="nic" readonly="readonly" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="leavetype" class="col-lg-2 control-label">Leave Type</label>
                        <div class="col-lg-10 dropdownjs">
                            <select id="bloodselect" name="leavetype" class="form-control" data-dropdownjs="true" placeholder="Leave Type">
                                <option value="hday">Half Day</option>
                                <option value="fday">Full Day</option>
                                <option value="sleave">Short Leave</option>
                                <option value="lleave">Long Leave</option>

                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="sdate" class="col-lg-2 control-label">Start Date</label>
                        <div class="col-lg-10">
                            <input name="sdate" required="" type="date" class="form-control" id="sdate" placeholder="Start Date">
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="edate" class="col-lg-2 control-label">End Date</label>
                        <div class="col-lg-10">
                            <input name="edate" required="" type="date" class="form-control" id="edate" placeholder="End Date">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nuofdays" class="col-lg-2 control-label">Number of Days</label>
                        <div class="col-lg-10">
                            <input name="nuofdays" required="" type="number" class="form-control" id="nuofdates" placeholder="Number of Days">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="substitute" class="col-lg-2 control-label">Substitute</label>
                        <div class="col-lg-10">
                            <input name="substitute" required="" type="text" class="form-control" id="callingname" placeholder="Substitute">
                        </div>
                    </div> 

                    <div class="form-group">
                        <label for="sadatentime" class="col-lg-2 control-label">Substitute Approved Date and Time</label>
                        <div class="col-lg-10">
                            <input name="sadatentime" required="" type="text" class="form-control" id="callingname" placeholder="Substitute Approved Date and Time">
                        </div>
                    </div> 

                    <div class="form-group">
                        <label for="appby" class="col-lg-2 control-label">Approved by</label>
                        <div class="col-lg-10">
                            <input name="appby" required="" type="text" class="form-control" id="callingname" placeholder="Approved by">
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="appdate" class="col-lg-2 control-label">Approved Date</label>
                        <div class="col-lg-10">
                            <input name="appdate" required="" type="text" class="form-control" id="callingname" placeholder="Approved Date">
                        </div>
                    </div>

                    <br>
                    <div>
                        <input value="Apply for the leave" type="submit" class="btn btn-danger btn-raised" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>