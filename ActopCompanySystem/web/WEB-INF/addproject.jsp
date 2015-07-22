<%-- 
    Document   : addproject
    Created on : Jul 14, 2015, 4:17:15 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<niro:retrieveDesignations/>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>

        <script>
            <%@include file="js/adminjs.js" %>
        </script>
    </head>
    <body>
        <%@include file="navigationbar.jsp" %>
        <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">
            <h3 style="width: 100%;text-align: center">Add a Project</h3>
            <label style="color: red;">${msg}</label>
            <hr>
            <form  action="SaveProject" method="post">
                <div class="form-group">
                    <label for="pname" class="col-lg-2 control-label">Project Name</label>
                    <div class="col-lg-10">
                        <input name="pname" required="" type="text" class="form-control" id="pname" placeholder="Project Name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="startdate" class="col-lg-2 control-label">Start Date</label>
                    <div class="col-lg-10">
                        <input name="startdate" required="" type="date" class="form-control" id="startdate" placeholder="Start Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="enddate" class="col-lg-2 control-label">End Date</label>
                    <div class="col-lg-10">
                        <input name="enddate" required="" type="date" class="form-control" id="startdate" placeholder="End Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="actualstart" class="col-lg-2 control-label">Actual Start Date</label>
                    <div class="col-lg-10">
                        <input name="actualstart" required="" type="date" class="form-control" id="actualstart" placeholder="Actual Start Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="actualenddate" class="col-lg-2 control-label">Actual End Date</label>
                    <div class="col-lg-10">
                        <input name="actualenddate" required="" type="date" class="form-control" id="actualenddate" placeholder="Actual End Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="projecttype" class="col-lg-2 control-label">Project Type</label>
                    <div class="col-lg-10">
                        <input name="projecttype" required="" type="text" class="form-control" id="actualenddate" placeholder="Actual End Date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="projectdescription" class="col-lg-2 control-label">Project Description</label>
                    <div class="col-lg-10">
                        <input name="projectdescription" required="" type="text" class="form-control" id="projectdescription" placeholder="Project Description">
                    </div>
                </div>
                <div class="form-group">
                    <label for="projectstatus" class="col-lg-2 control-label">Project Status</label>
                    <div class="col-lg-10">
                        <input name="projectstatus" required="" type="text" class="form-control" id="projectstatus" placeholder="Project Status">
                    </div>
                </div>
                <div class="form-group">
                    <label for="projectManager" class="col-lg-2 control-label">Project Manager</label>
                    <div class="col-lg-10">
                        <input name="projectManager" required="" type="text" class="form-control" id="projectManager" placeholder="Project Manager">
                    </div>
                </div>
                <niro:retrieveClients />
                <div class="form-group">
                    <label for="nic" class="col-lg-2 control-label">Client</label>
                    <div class="col-lg-10">

                        <select name="client" required="" class="form-control col-lg-10" id="designation" placeholder="Designation">
                            <c:forEach items="${clients}" var="clients" begin="0" end="${fn:length(clients)}">
                                <option value="${clients.idClients}"><niro:convertbytetostring text="${clients.name}" /></option>
                            </c:forEach>
                        </select>

                    </div>
                </div>
                <niro:retrieveallEmplyers />
                <div class="form-group">
                    <label for="nic" class="col-lg-2 control-label">Main Employer</label>
                    <div class="col-lg-10">

                        <select name="employer" required="" class="form-control col-lg-10" id="designation" placeholder="Designation">
                            <c:forEach items="${allemployers}" var="employer" begin="0" end="${fn:length(allemployers)}">
                                <option value="${employer.idEmployers}"><niro:convertbytetostring text="${employer.fullName}" /></option>
                            </c:forEach>
                        </select>

                    </div>
                </div>
                <div class="form-group">
                    <label for="clientNote" class="col-lg-2 control-label">Client Note</label>
                    <div class="col-lg-10">
                        <input name="clientNote" required="" type="text" class="form-control" id="clientNote" placeholder="Client Note">
                    </div>
                </div>
                <input class="btn btn-danger" value="Save" type="submit" />
                <div style="clear: both"></div>
            </form>
        </div>
    </body>
</html>
