<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-27
  Time: 오후 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>memberList.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">
    <table class="table table-striped table-hover">
        <tr>
            <th>id</th>
            <th>email</th>
            <th>password</th>
            <th>name</th>
            <th>age</th>
            <th>조회</th>
            <th>삭제</th>
            <th>조회(ajax)</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.id}</td>
                <td>
                    <a href="/member?id=${member.id}">${member.memberEmail}</a>
                </td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberAge}</td>
                <td>
                    <a href="/member?id=${member.id}">조회</a>
                </td>
                <td>
                    <button class="btn btn-danger" onclick="deleteMember('${member.id}')">삭제</button>
                </td>
                <td>
                    <button class="btn btn-primary" onclick="findMember('${member.id}')">조회</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div id="detail-area">

    </div>
</div>
</body>
<script>
    const findMember = (findId) => {
        console.log("findId", findId);
        const detailArea = document.getElementById("detail-area");
        $.ajax({
            type: "get",
            url: "/detail-ajax",
            data: {id: findId},
            dataType: "json",
            success: function (member) {
                console.log("조회결과", member);
                console.log("조회id: ", member.id);
                let result =
                    "        <table class=\"table table-striped\">\n" +
                    "            <tr>\n" +
                    "                <th>id</th>\n" +
                    "                <td>"+ member.id +"</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>email</th>\n" +
                    "                <td>" + member.memberEmail + "</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>password</th>\n" +
                    "                <td>" + member.memberPassword + "</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>name</th>\n" +
                    "                <td> " + member.memberName + "</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>age</th>\n" +
                    "                <td>" + member.memberAge + "</td>\n" +
                    "            </tr>\n" +
                    "        </table>";
                detailArea.innerHTML = result;
            },
            error: function () {

            }
        });
    }

    const deleteMember = (clickedId) => {
        <%--console.log('${memberList}');--%>
        <%--console.log('${memberList.id}')--%>
        console.log("클릭한 id값: ", clickedId);
        location.href = "/delete?id=" + clickedId;
    }
</script>
</html>
