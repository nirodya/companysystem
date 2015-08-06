<%-- 
    Document   : AddClients
    Created on : Jul 14, 2015, 3:11:14 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<niro:retrieveDesignations/>
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
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
            <h3 style="width: 100%;text-align: center">Add new Client</h3>

            <label style="color: green" class="col-lg-2 control-label">${msg}</label>
            <hr>
            <form  action="AddClient" method="post">
                <div class="form-group">
                    <label for="name" class="col-lg-2 control-label">Client Name</label>
                    <div class="col-lg-10">
                        <input name="name" required="" type="text" class="form-control" id="cname" placeholder="Client Name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="address" class="col-lg-2 control-label">Client Address</label>
                    <div class="col-lg-10">
                        <textarea name="address" required="" class="form-control" id="address" placeholder="Client Address"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-lg-2 control-label">Client Email</label>
                    <div class="col-lg-10">
                        <input name="email" required="" type="email" class="form-control" id="email" placeholder="Client Email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-lg-2 control-label">Contact No.</label>
                    <div class="col-lg-10">
                        <input name="contact" required="" type="tel" class="form-control" id="contact" placeholder="Contact No.">
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactperson" class="col-lg-2 control-label">Contact Person</label>
                    <div class="col-lg-10">
                        <input name="contactperson" required="" type="text" class="form-control" id="contact" placeholder="Contact Person">
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactpersondesignation" class="col-lg-2 control-label">Contact Designation</label>
                    <div class="col-lg-10">
                        <input name="contactpersondesignation" required="" type="text" class="form-control" id="contactpersondesignation" placeholder="Contact Person Designation">
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactpersondepartment" class="col-lg-2 control-label">Contact Department</label>
                    <div class="col-lg-10">
                        <input name="contactpersondepartment" required="" type="text" class="form-control" id="contactpersondepartment" placeholder="Contact Person Department">
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactpersonno" class="col-lg-2 control-label">Contact Person No.</label>
                    <div class="col-lg-10">
                        <input name="contactpersonno" required="" type="text" class="form-control" id="contactpersonno" placeholder="Contact Person No.">
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactpersonemail" class="col-lg-2 control-label">Contact Person Email</label>
                    <div class="col-lg-10">
                        <input name="contactpersonemail" required="" type="email" class="form-control" id="contactpersonemail" placeholder="Contact Person Email">
                    </div>
                </div>
                <div style="clear: both"></div>
                <input class="btn btn-info" value="Apply" type="submit" />
            </form>
        </div>
    </body>
</html>
</compress:html>
