<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>MemberAuth</title>
</head>
<body>
    <h2>MVC 패턴으로 회원인증하기</h2>
    <p>
        <strong>${authMessage}</strong> <br>
        <a href="./MemberAuth.mvc?id=ming&pass=1234">회원인증(관리자)</a>
        <a href="./MemberAuth.mvc?id=musthave&pass=1234">회원인증(회원)</a>
        <a href="./MemberAuth.mvc?id=min&pass=1004">회원인증(비회원)</a>
    </p>
</body>
</html>
