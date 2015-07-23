<%-- 
    Document   : leaveManagement
    Created on : Jul 21, 2015, 3:49:33 PM
    Author     : J.R.K. Wickramasinghe(Actop Technologies)
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <style>
            <%@include file="styles/adminstyles.css" %>
        </style>
        <script>
            <%@include file="js/adminjs.js" %>
        </script>
    </head>
    <body>
        <%@include file="navigationbar.jsp" %>
        <div style="width: 70%;margin-left: auto;margin-right: auto">
            <div class="col-md-3 content">
                <div class="panel panel-default">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Pending Approvals</h3>
                        </div>
                        <div class="panel-body">
                            <a href="leaverecords?stype=pending"><div class="icon-preview adminmiddlediv" ><i class="mdi-action-account-circle adminicons"></i></div></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 content">
                <div class="panel panel-default">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">View Approved</h3>
                        </div>
                        <div class="panel-body">
                            <a href="leaverecords?stype=approved"><div class="icon-preview adminmiddlediv" ><i class="mdi-action-account-circle adminicons"></i></div></a>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-3 content">
                <div class="panel panel-default">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">View all </h3>
                        </div>
                        <div class="panel-body">
                            <a href="leaverecords?stype=all"><div class="icon-preview adminmiddlediv" ><i class="mdi-action-account-circle adminicons"></i></div></a>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-3 content">
                <div class="panel panel-default">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Add New Type</h3>
                        </div>
                        <div class="panel-body">
                            <a href="addleavetype"><div class="icon-preview adminmiddlediv" ><i class="mdi-action-account-circle adminicons"></i></div></a>
                        </div>
                    </div>

                </div>
            </div>
             <div class="col-md-3 content">
                <div class="panel panel-default">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">View All Leave Types</h3>
                        </div>
                        <div class="panel-body">
                            <a href="addleavetype"><div class="icon-preview adminmiddlediv" ><i class="mdi-action-account-circle adminicons"></i></div></a>
                        </div>
                    </div>

                </div>
            </div>
             <div class="col-md-3 content">
                <div class="panel panel-default">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">My Leaves</h3>
                        </div>
                        <div class="panel-body">
                            <a href="myleaves"><div class="icon-preview adminmiddlediv" ><i class="mdi-action-account-circle adminicons"></i></div></a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
