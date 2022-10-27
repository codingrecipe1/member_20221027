<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-27
  Time: 오전 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberMain.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>${sessionScope.loginEmail} 님 환영합니다.</h2>
        <h2>model값: ${modelEmail}</h2>

        <a href="/">index.jsp</a>
    </div>
</body>
</html>
