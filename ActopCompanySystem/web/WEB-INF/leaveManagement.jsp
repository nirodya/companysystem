<%-- 
    Document   : leaveManagement
    Created on : Jul 21, 2015, 3:49:33 PM
    Author     : J.R.K. Wickramasinghe(Actop Technologies)
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
<!DOCTYPE html>
<html>
    <head>

           <title>Management System</title>
        <!-- Bootstrap Styles-->
        <link href="../ActopCompanySystem/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="../ActopCompanySystem/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Morris Chart Styles-->
        <link href="../ActopCompanySystem/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="../ActopCompanySystem/assets/css/custom-styles.css" rel="stylesheet" />
        <!-- Google Fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   
    </head>
    <body>

        <div id="wrapper">
            <%@include file="adminTopMenu.jsp" %>
            <!--/. NAV TOP  -->
            <%@include file="adminSideMenu.jsp" %>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper">
                 
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="page-header">
                                Dashboard <small>Leave Management</small>
                            </h1>
                        </div>
                    </div>
                <div id="page-inner">
       
                    <div class="row">
                       <a href="myleaves">  
                           <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="panel panel-primary text-center no-boder bg-color-green">
                                <div class="panel-body">
                                    <i class="fa fa-bar-chart-o fa-5x"></i>
                                    <h3>8,457</h3>
                                </div>
                                <div class="panel-footer back-footer-green">
                                    My Leaves

                                </div>
                            </div>
                        </div></a>
                                               <a href="addleavetype">  

                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                <div class="panel-body">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                    <h3>52,160 </h3>
                                </div>
                                <div class="panel-footer back-footer-blue">
                                   Leave Types

                                </div>
                            </div>
                        </div></a>
                         <a href="leaverecords?stype=all">  
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="panel panel-primary text-center no-boder bg-color-red">
                                <div class="panel-body">
                                    <i class="fa fa fa-comments fa-5x"></i>
                                    <h3>15,823 </h3>
                                </div>
                                <div class="panel-footer back-footer-red">
                                    View all

                                </div>
                            </div>
                        </div></a>
                                                 <a href="leaverecords?stype=approved">  

                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="panel panel-primary text-center no-boder bg-color-brown">
                                <div class="panel-body">
                                    <i class="fa fa-users fa-5x"></i>
                                    <h3>36,752 </h3>
                                </div>
                                <div class="panel-footer back-footer-brown">
                                    approved

                                </div>
                            </div>
                        </div></a>
                                                 <a href="leaverecords?stype=pending">  

                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="panel panel-primary text-center no-boder bg-color-brown">
                                <div class="panel-body">
                                    <i class="fa fa-users fa-5x"></i>
                                    <h3>36,752 </h3>
                                </div>
                                <div class="panel-footer back-footer-brown">
                                    pending

                                </div>
                            </div>
                        </div></a>
                    </div></div></div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
       
        <!-- jQuery Js -->
        <script src="../ActopCompanySystem/assets/js/jquery-1.10.2.js"></script>
        <!-- Bootstrap Js -->
        <script src="../ActopCompanySystem/assets/js/bootstrap.min.js"></script>
        <!-- Metis Menu Js -->
        <script src="../ActopCompanySystem/assets/js/jquery.metisMenu.js"></script>
        <!-- Morris Chart Js -->
        <script src="../ActopCompanySystem/assets/js/morris/raphael-2.1.0.min.js"></script>
        <script src="../ActopCompanySystem/assets/js/morris/morris.js"></script>
        <!-- Custom Js -->
        <script src="../ActopCompanySystem/assets/js/custom-scripts.js"></script>
        <footer><p>&nbsp;All right reserved. <a href="http://actoptec.com">ACTOP Technologies</a></p></footer>

    </body>
</html>
</compress:html>
