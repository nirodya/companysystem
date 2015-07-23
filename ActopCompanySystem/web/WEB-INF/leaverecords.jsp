<%-- 
    Document   : leaverecords
    Created on : Jul 21, 2015, 4:02:29 PM
     Author     : J.R.K. Wickramasinghe(Actop Technologies)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/actoptags.tld" prefix="m" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<m:retrieveallleaves/>
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
    <body style="width: 100%">
        <%@include file="navigationbar.jsp" %>
        <br>

        <div class="well" style="width: 80%;margin-left: auto;margin-right: auto">
            <table class="table">
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
                            <td valign="middle" style="vertical-align:middle;"  />${leaves.substituteApprove}</td>
                             <td valign="top"><button data-toggle="modal" data-target="#complete-dialog" class="btn btn-danger   ">Edit Details</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


        </div>
        <br>
<!--        <div id="complete-dialog" class="modal fade" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Dialog</h4>
                    </div>
                    <div class="modal-body">
                        <p>Fore aut non quem incididunt, varias reprehenderit deserunt quem offendit,
                            cillum proident ne reprehenderit, quem ad laborum, quo possumus praetermissum,
                            si ne illustriora, hic appellat coniunctione, do labore aliqua quo probant. In
                            probant voluptatibus quo mentitum est laboris. Quorum mandaremus graviterque.
                            Mentitum id velit, dolor aut litteris, ea varias illustriora, ita commodo ita
                            ingeniis, iis nulla appellat incurreret, aut irure amet summis pariatur ita ubi
                            quis dolore veniam proident, consequat sed ingeniis.</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" data-dismiss="modal">Dismiss</button>
                    </div>
                </div>
            </div>
        </div> -->
    </body>
</html>
