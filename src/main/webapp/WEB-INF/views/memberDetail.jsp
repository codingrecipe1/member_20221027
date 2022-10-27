<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-27
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberDetail.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <table class="table table-striped">
            <tr>
                <th>id</th>
                <td>${member.id}</td>
            </tr>
            <tr>
                <th>email</th>
                <td>${member.memberEmail}</td>
            </tr>
            <tr>
                <th>password</th>
                <td>${member.memberPassword}</td>
            </tr>
            <tr>
                <th>name</th>
                <td>${member.memberName}</td>
            </tr>
            <tr>
                <th>age</th>
                <td>${member.memberAge}</td>
            </tr>
        </table>
    </div>
</body>
</html>
