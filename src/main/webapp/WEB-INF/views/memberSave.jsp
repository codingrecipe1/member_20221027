<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-27
  Time: 오전 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberSave.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        #save-form {
            width: 800px;
        }
    </style>
</head>
<body>
    <div class="container" id="save-form">
        <form action="/save" method="post" name="saveForm">
            <input type="text" name="memberEmail" id="memberEmail" onblur="emailDuplicateCheck()" placeholder="이메일" class="form-control">
            <span id="email-dup-check"></span>
            <span id="email-input-check"></span>
            <input type="text" name="memberPassword" placeholder="비밀번호" class="form-control">
            <input type="text" name="memberName" placeholder="이름" class="form-control">
            <input type="text" name="memberAge" placeholder="나이" class="form-control">
            <input type="button" value="회원가입" onclick="save()" class="btn btn-primary">
<%--            <button onclick="btn1Fn()">버튼가입</button>--%>
        </form>
    </div>
</body>
<script>
    const emailDuplicateCheck = () => {
        const email = document.getElementById("memberEmail").value;
        const checkResult = document.getElementById("email-dup-check");
        console.log("입력한 이메일", email);
        $.ajax({
           type: "post",
           url: "/duplicate-check",
           dataType: "text",
           data: {inputEmail: email},
           success: function (result) {
               console.log("checkResult: ", result);
               if (result == "ok") {
                   checkResult.innerHTML = "사용할 수 있는 이메일입니다";
                   checkResult.style.color = "green";
               } else {
                   checkResult.innerHTML = "이미 사용 중인 이메일입니다";
                   checkResult.style.color = "red";
               }
           },
           error: function () {
               console.log("실패");
           }
        });

    }
    const save = () => {
        console.log("save 함수호출");
        if (document.saveForm.memberEmail.value == "") {
            // alert("이메일을 입력해주세요");
            // 이메일 입력 하지 않았을 때 span에 빨간색으로 출력
            const emailCheck = document.getElementById("email-input-check");
            emailCheck.innerHTML = "이메일을 입력해주세요";
            emailCheck.style.color = "red";
            return false;
        } else if (document.saveForm.memberPassword.value == "") {
            alert("비밀번호를 입력해주세요");
            return false;
        } else if (document.saveForm.memberName.value == "") {
            alert("이름을 입력해주세요");
            return false;
        } else if (document.saveForm.memberAge.value == "") {
            alert("나이를 입력해주세요");
            return false;
        }
        document.saveForm.submit();
    }
    const btn1Fn = () => {
        console.log("btn1Fn 함수호출");
    }
</script>
</html>
