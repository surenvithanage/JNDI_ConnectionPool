<%-- 
    Document   : index
    Created on : Oct 7, 2018, 10:29:24 AM
    Author     : suren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style> 
            input[type=text] {
                width: 130px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                background-color: white;
                background-image: url('searchicon.png');
                background-position: 10px 10px; 
                background-repeat: no-repeat;
                padding: 12px 20px 12px 40px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;
            }

            input[type=text]:focus {
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <h1>Search</h1>
            <form method="post" action="search">
                <input type="text" name="search" placeholder="Search..">
                <input type="submit" class="btn btn-success" value="Search" style="margin-top:20px;"/>
            </form>

            <table class="table">
                <c:if test="${fn:length(result) gt 0}">
                    <thead>
                    <th>Name</th>
                    <th>Phone NO </th>
                    <th>Email</th>
                    </thead>
                    <tbody>
                        <c:forEach var="items" items="${result}">
                            <tr>
                                <td>  <c:out value="${items.getName()}"></c:out></td>
                                <td><c:out value="${items.getPhoneNo()}"></c:out></td>
                                <td> <c:out value="${items.getEmail()}"></c:out></td>
                                </tr>
                        </c:forEach>
                    </tbody>
                </c:if>
                <c:if test="${fn:length(result) <= 0}">
                    <h3>Search using a keyword</h3>
                </c:if>
            </table>
        </div>
    </body>
</html>
