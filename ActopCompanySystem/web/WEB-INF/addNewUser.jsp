<%-- 
    Document   : addNewUser
    Created on : Jul 10, 2015, 12:58:18 PM
    Author     : Nirodya Gamage
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
                        <img src="images/favicon.png" />
                    </div>
                </div>
                <label id="loginheader"><h3>Add New User</h3></label>
                <label style="color: red;">${msg}</label>
                <form class="form-horizontal" action="SaveUser" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="nic" class="col-lg-2 control-label">NIC</label>
                        <div class="col-lg-10">
                            <input name="nic" required="" type="text" class="form-control" id="nic" placeholder="NIC">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fullname" class="col-lg-2 control-label">Full Name</label>
                        <div class="col-lg-10">
                            <input name="fullname" required="" type="text" class="form-control" id="fullname" placeholder="Full Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="callingname" class="col-lg-2 control-label">Calling Name</label>
                        <div class="col-lg-10">
                            <input name="callingname" required="" type="text" class="form-control" id="callingname" placeholder="Calling Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ad1" class="col-lg-2 control-label">Address 1</label>
                        <div class="col-lg-10">
                            <input name="ad1" required="" type="text" class="form-control" id="ad1" placeholder="Address 1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ad2" class="col-lg-2 control-label">Address 2</label>
                        <div class="col-lg-10">
                            <input name="ad2" required="" type="text" class="form-control" id="ad2" placeholder="Address 2">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="city" class="col-lg-2 control-label">City</label>
                        <div class="col-lg-10">
                            <input name="city" required="" type="text" class="form-control" id="city" placeholder="City">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="district" class="col-lg-2 control-label">District</label>
                        <div class="col-lg-10">
                            <input name="district" required="" type="text" class="form-control" id="city" placeholder="District">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mobile" class="col-lg-2 control-label">Mobile No.</label>
                        <div class="col-lg-10">
                            <input name="mobile" required="" type="tel" class="form-control" id="mobile" placeholder="Mobile No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="home" class="col-lg-2 control-label">Home No.</label>
                        <div class="col-lg-10">
                            <input name="home" required="" type="tel" class="form-control" id="mobile" placeholder="Home No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="epf" class="col-lg-2 control-label">EPF No.</label>
                        <div class="col-lg-10">
                            <input name="epf" required="" type="text" class="form-control" id="epf" placeholder="EPF No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="department" class="col-lg-2 control-label">Department</label>
                        <div class="col-lg-10">
                            <select name="department" required="" class="form-control" id="department" placeholder="department">
                                <c:forEach items="${departments}" var="departments" begin="0" end="${fn:length(departments)}">
                                    <option value="${departments.idDepartment}"><niro:convertbytetostring text="${departments.department}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="designation" class="col-lg-2 control-label">Designation</label>
                        <div class="col-lg-10">
                            <select name="designation" required="" class="form-control" id="designation" placeholder="Designation">
                                <c:forEach items="${designations}" var="designations" begin="0" end="${fn:length(designations)}">
                                    <option value="${designations.idDesignation}"><niro:convertbytetostring text="${designations.designation}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="salary" class="col-lg-2 control-label">Salary&nbsp;Rs:</label>
                        <div class="col-lg-10">
                            <input name="salary" required="" type="number" class="form-control" id="designation" placeholder="Sallary">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="appointeddate" class="col-lg-2 control-label">Appointed Date</label>
                        <div class="col-lg-10">
                            <input name="appointeddate" required="" type="date" class="form-control" id="appointeddate" placeholder="Appointed Date">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="appointedtype" class="col-lg-2 control-label">Appointed Type</label>
                        <div class="col-lg-10">
                            <input name="appointedtype" required="" type="text" class="form-control" id="appointedtype" placeholder="Appointed Type">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="reportby" class="col-lg-2 control-label">Report By</label>
                        <div class="col-lg-10">
                            <input name="reportby" required="" type="text" class="form-control" id="reportby" placeholder="Report By">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bloodgroup" class="col-lg-2 control-label">Blood Group</label>
                        <div class="col-lg-10 dropdownjs">
                            <select id="bloodselect" name="bloodselect" class="form-control" data-dropdownjs="true" placeholder="Your favorite pastry">
                                <option value="A+">A+</option>
                                <option value="B+">B+</option>
                                <option value="AB+">AB+</option>
                                <option value="O+">O+</option>
                                <option value="A-">A-</option>
                                <option value="B-">B-</option>
                                <option value="AB-">AB-</option>
                                <option value="O-">O-</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="passport" class="col-lg-2 control-label">Passport No.</label>
                        <div class="col-lg-10">
                            <input name="passport" required="" type="text" class="form-control" id="passport" placeholder="Passport No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="license" class="col-lg-2 control-label">License No.</label>
                        <div class="col-lg-10">
                            <input name="license" required="" type="text" class="form-control" id="license" placeholder="License No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="branch" class="col-lg-2 control-label">Branch</label>
                        <div class="col-lg-10">
                            <input name="branch" required="" type="text" class="form-control" id="branch" placeholder="Branch">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="officeemail" class="col-lg-2 control-label">Office Email</label>
                        <div class="col-lg-10">
                            <input name="officeemail" required="" type="email" class="form-control" id="officeemail" placeholder="Office email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="personalemail" class="col-lg-2 control-label">Personal Email</label>
                        <div class="col-lg-10">
                            <input name="personalemail" required="" type="email" class="form-control" id="personalemail" placeholder="Personal email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="officeno" class="col-lg-2 control-label">Office No.</label>
                        <div class="col-lg-10">
                            <input name="officeno" required="" type="tel" class="form-control" id="officeno" placeholder="Office No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="extension" class="col-lg-2 control-label">Extension No.</label>
                        <div class="col-lg-10">
                            <input name="extension" required="" type="tel" class="form-control" id="extension" placeholder="Extension No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bank" class="col-lg-2 control-label">Payment Bank</label>
                        <div class="col-lg-10">
                            <input name="bank" required="" type="text" class="form-control" id="bank" placeholder="Payment Bank">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bankbranch" class="col-lg-2 control-label">Payment Bank Branch</label>
                        <div class="col-lg-10">
                            <input name="bankbranch" required="" type="text" class="form-control" id="bankbranch" placeholder="Payment Bank Branch">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bankaccount" class="col-lg-2 control-label">Payment Bank Account No.</label>
                        <div class="col-lg-10">
                            <input name="bankaccount" required="" type="text" class="form-control" id="bankaccount" placeholder="Payment Bank Account">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bankperson" class="col-lg-2 control-label">Payment Bank Person Name</label>
                        <div class="col-lg-10">
                            <input name="bankperson" required="" type="text" class="form-control" id="bankperson" placeholder="Payment Bank Person Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="image" class="col-lg-2 control-label">Image</label>
                        <div class="col-lg-10">
                            <input name="image" required="" type="file" class="form-control" id="image">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="un" class="col-lg-2 control-label">UserName</label>
                        <div class="col-lg-10">
                            <input name="un" required="" type="text" class="form-control" id="un">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pw" class="col-lg-2 control-label">Password</label>
                        <div class="col-lg-10">
                            <input name="pw" required="" type="password" class="form-control" id="pw">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sq1" class="col-lg-2 control-label">Security Question 1</label>
                        <div class="col-lg-10">
                            <input name="sq1" required="" type="text" class="form-control" id="sq1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="answer1" class="col-lg-2 control-label">Answer</label>
                        <div class="col-lg-10">
                            <input name="answer1" required="" type="text" class="form-control" id="answer1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sq2" class="col-lg-2 control-label">Security Question 2</label>
                        <div class="col-lg-10">
                            <input name="sq2" required="" type="text" class="form-control" id="sq2">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="answer2" class="col-lg-2 control-label">Answer</label>
                        <div class="col-lg-10">
                            <input name="answer2" required="" type="text" class="form-control" id="answer2">
                        </div>
                    </div>
                    <br>
                    <div>
                        <input value="Register" type="submit" class="btn btn-danger btn-raised" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>