<%-- 
    Document   : myLeaves
    Created on : Jul 23, 2015, 1:32:40 PM
    Author     : J.R.K. Wickramasinghe(Actop Technologies)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri="/WEB-INF/tlds/actoptags.tld" prefix="m" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
<m:retrieveallleaves/>
<m:openHibSession/>
<%--<niro:retrieveprofile id="${param['id']}" />--%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>

        <script>
            <%@include file="js/adminjs.js" %>
        </script>

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
                <!-- /. NAV SIDE  -->
                <div>


                    <form>
                        <div>
                            <div style="width: 100%;padding-left: 50px;">
                                <h4>&nbsp;Leave Summery</h4>
                                <hr>

                                <div class="form-group">

                                    <div class="col-lg-6">
                                        <label for="fullname" class="col-lg-2 control-label">Leaves for this year:</label>
                                        <input name="fullname" required="" readonly="readonly"  type="text" style="display: none;" class="form-control updatingtext" value="" id="lvsfordisyr">
                                    </div>
                                </div><br>
                                <div class="form-group">
                                    <div class="col-lg-6">
                                        <label for="fullname" class="col-lg-6 datalabel">Leaves Already Taken:</label>
                                        <input name="fullname" required="" readonly="readonly"  type="text" style="display: none;" class="form-control updatingtext" value="" id="lvsfordisyr">
                                    </div>
                                </div><br>
                                <div class="panel-heading">

                                    <a href="leave"><button style="float: right" class="btn btn-info">Apply a Leave</button></a>
                                    <div style="clear: both"></div>
                                </div>

                            </div>
                        </div>
                    </form>     
                </div>  
            </div>
            <!-- Advanced Tables -->
           <div class="panel panel-default">
                <div class="panel-heading">
                    Pending History

                    <div style="clear: both"></div>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>Employer ID</th>
                                    <th>Leave Type</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Number of Dates</th>
                                    <th>Substitute</th>
                                    <th>Substitute Approved Date</th>

                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${allleaves}" var="leaves" begin="0" end="${fn:length(allleaves)}">
                                 <c:if test="${empty fn:trim(leaves.substituteApprove)}">       <tr>
                                        <td valign="middle" style="vertical-align:middle;"/>${leaves.employers.idEmployers}</td>
                                        <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${leaves.leaveType}" /></td>
                                        <td valign="middle" style="vertical-align:middle;"  />${leaves.startDate}</td>
                                        <td valign="middle" style="vertical-align:middle;"  />${leaves.endDate}</td>
                                        <td valign="middle" style="vertical-align:middle;"  />${leaves.substituteApprove}</td>
                                        <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${leaves.noOfDays}" /></td>
                                        <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${leaves.substitute}" /></td>
                                        <td valign="middle" style="vertical-align:middle;">${leaves.substituteApprove}</td>
                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger   ">Edit Details</button></td>
                                     </tr></c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
            <!--End Advanced Tables -->
            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    Leave History

                    <div style="clear: both"></div>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>Employer ID</th>
                                    <th>Leave Type</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Number of Dates</th>
                                    <th>Substitute</th>
                                    <th>Substitute Approved Date</th>

                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${allleaves}" var="leaves" begin="0" end="${fn:length(allleaves)}">
                                    <tr>
                                        <td valign="middle" style="vertical-align:middle;"/>${leaves.employers.idEmployers}</td>
                                        <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${leaves.leaveType}" /></td>
                                        <td valign="middle" style="vertical-align:middle;"  />${leaves.startDate}</td>
                                        <td valign="middle" style="vertical-align:middle;"  />${leaves.endDate}</td>
                                        <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${leaves.noOfDays}" /></td>
                                        <td valign="middle" style="vertical-align:middle;"><m:convertbytetostring text="${leaves.substitute}" /></td>
                                        <td valign="middle" style="vertical-align:middle;">${leaves.substituteApprove}</td>
                                        <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger   ">Edit Details</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
            <!--End Advanced Tables -->

            <!-- /. PAGE WRAPPER  -->
        </div>
    </div>
    <footer><p>&nbsp;All right reserved. <a href="http://actoptec.com">ACTOP Technologies</a></p></footer>

</body>
</html>
<m:closehibsession session="${hibsession}"/>
</compress:html>