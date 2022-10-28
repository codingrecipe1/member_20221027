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
        <button class="btn btn-warning" onclick="updateForm()">내정보수정하기</button>
        <a href="/">index.jsp</a>
    </div>
</body>
<%-- /update 주소를 요청하는 update 함수 --%>
<script>
    const updateForm = () => {
        location.href = "/update";
    }
</script>
</html>
