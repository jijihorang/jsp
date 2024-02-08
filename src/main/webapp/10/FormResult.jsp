<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>EL - 폼 값 출력</title>
</head>
<body>
    <h2>EL로 폼 값 받기</h2>
    <ul>
        <li>이름 : ${param.name}</li>
        <li>성별 : ${param.gender}</li>
        <li>학력 : ${param.grade}</li>
        <li>관심사항 : ${paramValues.inter[0]} <%-- 값이 여려개 들어올 수 있기 떄문--%>
            ${paramValues.inter[1]}
            ${paramValues.inter[2]}
            ${paramValues.inter[3]}
        </li>
    </ul>
</body>
</html>
