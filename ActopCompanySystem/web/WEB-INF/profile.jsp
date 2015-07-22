<%-- 
    Document   : profile
    Created on : Jul 11, 2015, 1:41:05 PM
    Author     : Nirodya Gamage (ACTOP Technologies)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="niro" uri="/WEB-INF/tlds/actoptags.tld" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<niro:retrieveprofile id="${param['id']}" />
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>

        <script>
            <%@include file="js/adminjs.js" %>
        </script>
        <script type="text/javascript">
            $(document).ready(function (){
                $('#editprofilebut').click(function (){
                    $('.datalabel').hide();
                    setTimeout(1000);
                    $('.updatingtext').show(500);
                    $('#editprofilebut').hide();
                    $('#savebut').show(500);
                });
            });
        </script>
    </head>
    <body>
        <%@include file="navigationbar.jsp" %>
        <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">
            <div style="width: 100%;text-align: center">
                <h3>User Profile</h3>
            </div>
            <div>
                <form action="UserUpdate" method="post">
                    <input type="hidden" value="${profile.idEmployers}" name="empid" />
                <div style="float: left;">
                    <img width="300" height="400" src="<niro:convertbytetostring text="${profile.imgPath}" />" />
                </div>
                <div>
                    <div style="color: red">
                        <label>${msg}</label>
                    </div>
                    <div style="width: 100%;padding-left: 50px;">
                        <h4>&nbsp;Basic Details</h4>
                        <hr>
                    </div>
                    <div class="form-group">
                        <label for="fullname" class="col-lg-2 control-label">Full Name</label>
                        <div class="col-lg-6">
                            <label for="fullname" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.fullName}" /></label>
                            <input name="fullname" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.fullName}" />" id="fullname" placeholder="Full Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="callname" class="col-lg-2 control-label">Calling Name</label>
                        <div class="col-lg-6">
                            <label for="callname" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.callingName}" /></label>
                            <input name="callname" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.callingName}" />"  id="callingnametext" placeholder="Calling Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address1" class="col-lg-2 control-label">Address 1</label>
                        <div class="col-lg-6">
                            <label for="address1" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.address1}" /></label>
                            <input name="address1" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.address1}" />" id="address1text" placeholder="Address 1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address2" class="col-lg-2 control-label">Address 2</label>
                        <div class="col-lg-6">
                            <label for="address2" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.address2}" /></label>
                            <input name="address2" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.address2}" />" id="address2text" placeholder="Address 2">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="city" class="col-lg-2 control-label">City</label>
                        <div class="col-lg-6">
                            <label for="city" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.city}" /></label>
                            <input name="city" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.city}" />" id="citytext" placeholder="Address 1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="district" class="col-lg-2 control-label">district</label>
                        <div class="col-lg-6">
                            <label for="district" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.district}" /></label>
                            <input name="district" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.district}" />" id="districttext" placeholder="District">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mobileNo" class="col-lg-2 control-label">Mobile No.</label>
                        <div class="col-lg-6">
                            <label for="mobileNo" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.mobileNo}" /></label>
                            <input name="mobileNo" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.mobileNo}" />" id="mobiletext" placeholder="Address 1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="homeNo" class="col-lg-2 control-label">Home No.</label>
                        <div class="col-lg-6">
                            <label for="homeNo" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.homeNo}" /></label>
                            <input name="homeNo" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.homeNo}" />" id="homenotext" placeholder="Home No">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="epf" class="col-lg-2 control-label">EPF</label>
                        <div class="col-lg-6">
                            <label for="epf" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.epf}" /></label>
                            <input name="epf" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.epf}" />" id="epftext" placeholder="EPF">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="appontedDate" class="col-lg-2 control-label">Appointed Date</label>
                        <div class="col-lg-6">
                            <label for="appontedDate" class="col-lg-6 datalabel"><c:out value="${profile.appointedDate}" /></label>
                            <input name="appointedDate" required="" type="date" style="display: none;" class="form-control updatingtext" value="${profile.appointedDate}" id="appointeddateText" placeholder="AppointedDate">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="appointedType" class="col-lg-2 control-label">Appointed Type</label>
                        <div class="col-lg-6">
                            <label for="appointedType" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.appointedType}" /></label>
                            <input name="appointeType" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.appointedType}" />" id="appointedtypetext" placeholder="AppointedType">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nic" class="col-lg-2 control-label">NIC</label>
                        <div class="col-lg-6">
                            <label for="nic" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.nic}" /></label>
                            <input name="nic" required="" type="text" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.nic}" />" id="nictext" placeholder="NIC">
                        </div>
                    </div>
                    
                </div>
                <div style="clear: both"></div>
                <div>
                    <div style="width: 100%;padding-left: 5px;">
                        <h4>Other Details</h4>
                        <hr>
                    </div>
                    
                    <div class="form-group">
                        <label for="salary" class="col-lg-4 control-label">Salary</label>
                        <div class="col-lg-8">
                            <label for="salary" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.salary}" /></label>
                            <input name="salary" required="" type="number" style="display: none;" class="form-control updatingtext" value="<niro:convertbytetostring text="${profile.salary}" />" id="salarytext" placeholder="Salary">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bloodGroup" class="col-lg-4 control-label">Blood Group</label>
                        <div class="col-lg-8">
                            <label for="bloodGroup" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.bloodGroup}" /></label>
                            <select id="bloodselect" name="bloodselect" style="display: none;" class="form-control updatingtext col-lg-6" data-dropdownjs="true" placeholder="Your favorite pastry">
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
                        <label for="reportBy" class="col-lg-4 control-label">Report By</label>
                        <div class="col-lg-8">
                            <label for="reportBy" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.reportBy}" /></label>
                            <input name="reportBy" required="" type="text" style="display: none;" value="<niro:convertbytetostring text="${profile.reportBy}" />" class="form-control updatingtext" id="reportbytext" placeholder="Report By">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="passport" class="col-lg-4 control-label">Passport</label>
                        <div class="col-lg-8">
                            <label for="passport" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.passport}" /></label>
                            <input name="passport" required="" type="text" style="display: none;" value="<niro:convertbytetostring text="${profile.passport}" />" class="form-control updatingtext" id="passporttext" placeholder="Passport No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="licenseNo" class="col-lg-4 control-label">License No.</label>
                        <div class="col-lg-8">
                            <label for="licenseNo" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.licenseNo}" /></label>
                            <input name="licenseNo" required="" type="text" style="display: none;" value="<niro:convertbytetostring text="${profile.licenseNo}" />" class="form-control updatingtext" id="licenseNotext" placeholder="License No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="branch" class="col-lg-4 control-label">Branch</label>
                        <div class="col-lg-8">
                            <label for="branch" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.branch}" /></label>
                            <input name="branch" required="" type="text" style="display: none;" value="<niro:convertbytetostring text="${profile.branch}" />" class="form-control updatingtext" id="branchtext" placeholder="Branch">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="officeEmail" class="col-lg-4 control-label">Office Email</label>
                        <div class="col-lg-8">
                            <label for="officeEmail" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.officeEmail}" /></label>
                            <input name="officeemail" required="" type="email" style="display: none;" value="<niro:convertbytetostring text="${profile.officeEmail}" />" class="form-control updatingtext" id="officeemailtext" placeholder="Office email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="personalEmail" class="col-lg-4 control-label">Personal Email</label>
                        <div class="col-lg-8">
                            <label for="personalEmail" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.personalEmail}" /></label>
                            <input name="personalemail" required="" type="email" style="display: none;" value="<niro:convertbytetostring text="${profile.personalEmail}" />" class="form-control updatingtext" id="personalemailtext" placeholder="Personal email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="officeNo" class="col-lg-4 control-label">Office No.</label>
                        <div class="col-lg-8">
                            <label for="officeNo" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.officeNo}" /></label>
                            <input name="officeno" required="" type="tel" style="display: none;" value="<niro:convertbytetostring text="${profile.officeNo}" />" class="form-control updatingtext" id="officenotext" placeholder="Office No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="extensionNo" class="col-lg-4 control-label">Extension No.</label>
                        <div class="col-lg-8">
                            <label for="officeNo" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.officeNo}" /></label>
                            <input name="extension" required="" type="tel" style="display: none;" value="<niro:convertbytetostring text="${profile.officeNo}" />" class="form-control updatingtext" id="extensiontext" placeholder="Extension No.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="paymetsBank" class="col-lg-4 control-label">Payment Bank</label>
                        <div class="col-lg-8">
                            <label for="paymetsBank" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.paymetsBank}" /></label>
                            <input name="bank" required="" type="text" style="display: none;" value="<niro:convertbytetostring text="${profile.paymetsBank}" />" class="form-control updatingtext" id="bank" placeholder="Payment Bank">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="paymetsBankBranch" class="col-lg-4 control-label">Payment Bank Branch</label>
                        <div class="col-lg-8">
                            <label for="paymetsBankBranch" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.paymetsBankBranch}" /></label>
                            <input name="bankbranch" required="" type="text" style="display: none;" value="<niro:convertbytetostring text="${profile.paymetsBankBranch}" />" class="form-control updatingtext" id="bankbranch" placeholder="Payment Bank Branch">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="paymetsBankAccountNumber" class="col-lg-4 control-label">Payment Bank Account No.</label>
                        <div class="col-lg-8">
                            <label for="paymetsBankAccountNumber" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.paymetsBankAccountNumber}" /></label>
                            <input name="bankaccount" required="" type="text" style="display: none;" value="<niro:convertbytetostring text="${profile.paymetsBankAccountNumber}" />" class="form-control updatingtext" id="bankaccount" placeholder="Payment Bank Account">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="paymetsBankPersonName" class="col-lg-4 control-label">Payment Bank Person</label>
                        <div class="col-lg-8">
                            <label for="paymetsBankPersonName" class="col-lg-6 datalabel"><niro:convertbytetostring text="${profile.paymetsBankPersonName}" /></label>
                            <input name="bankperson" required="" type="text" style="display: none;" value="<niro:convertbytetostring text="${profile.paymetsBankPersonName}" />" class="form-control updatingtext" id="bankperson" placeholder="Payment Bank Person Name">
                        </div>
                    </div>
                    <br>
                    <div>
                        <a id="editprofilebut" class="btn btn-info" >Edit Profile</a>
                        <input  style="display: none" id="savebut" class="btn btn-danger" value="Save" type="submit" />
                    </div>
                
                </div>
                        </form>
                <div style="clear: both"></div>
            </div>
        </div>
    </body>
</html>
